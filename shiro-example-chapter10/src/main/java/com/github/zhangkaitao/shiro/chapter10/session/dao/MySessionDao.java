package com.github.zhangkaitao.shiro.chapter10.session.dao;

import com.github.zhangkaitao.shiro.chapter10.JdbcTemplateUtils;
import com.github.zhangkaitao.shiro.chapter10.SerializableUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.ValidatingSession;
import org.apache.shiro.session.mgt.eis.CachingSessionDAO;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.springframework.jdbc.core.JdbcTemplate;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/** doCreate/doUpdate/doDelete/doReadSession 分别代表创建/修改/删除/读取会话;
 * 此处通过把会话序列化后存储到数据库实现；接着在 shiro-web.ini 中配置：
 * sessionDAO=com.github.zhangkaitao.shiro.chapter10.session.dao.MySessionDAO
 * 其他设置和之前一样，因为继承了 CachingSessionDAO；所有在读取时会先查缓存中是否
 * 存在，如果找不到才到数据库中查找。

 * <p>Date: 14-2-8 
 * <p>Version: 1.0
 */
public class MySessionDAO extends CachingSessionDAO {

    private JdbcTemplate jdbcTemplate = JdbcTemplateUtils.jdbcTemplate();

    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = generateSessionId(session);
        assignSessionId(session, sessionId);
        String sql = "insert into sessions(id, session) values(?,?)";
        jdbcTemplate.update(sql, sessionId, SerializableUtils.serialize(session));
        return session.getId();
    }
    @Override
    protected void doUpdate(Session session) {
        if(session instanceof ValidatingSession && !((ValidatingSession)session).isValid()) {
            return; //如果会话过期/停止 没必要再更新了
        }
        String sql = "update sessions set session=? where id=?";
        jdbcTemplate.update(sql, SerializableUtils.serialize(session), session.getId());
    }
    @Override
    protected void doDelete(Session session) {
        String sql = "delete from sessions where id=?";
        jdbcTemplate.update(sql, session.getId());
    }
    @Override
    protected Session doReadSession(Serializable sessionId) {
        String sql = "select session from sessions where id=?";
        List<String> sessionStrList = jdbcTemplate.queryForList(sql, String.class, sessionId);
        if(sessionStrList.size() == 0) return null;
        return SerializableUtils.deserialize(sessionStrList.get(0));
    }
}
