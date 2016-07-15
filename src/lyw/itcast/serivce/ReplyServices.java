package lyw.itcast.serivce;

import lyw.itcast.dao.ReplyDAO;
import lyw.itcast.dao.UserDao;
import lyw.itcast.domain.Page;
import lyw.itcast.domain.Reply;
import lyw.itcast.domain.User;

import java.util.List;

/**
 * 提供回复的相关服务
 */
public class ReplyServices {

    private ReplyDAO replyDAO;
    private UserDao UserDao;

    public ReplyServices() {
        this.replyDAO = new ReplyDAO();
        this.UserDao = new UserDao();
    }

    /**
     * 获得某评论的一页回复，供当前或者其它[service]
     *
     * @param commentId 评论
     * @param page1     Page类型的实例
     * @return list
     */
    public List<Reply> getPageReplys(int commentId, Page page1) {
    	//replyDAO获取某个区间的所有回复
        List<Reply> replyList = replyDAO.getReplyWithPage(commentId, page1.getStart(), page1.getPageSize());

        for (Reply reply : replyList) {
            User user = UserDao.findById(reply.getUser_id());
            reply.setUser(user);
        }

        return replyList;
    }

    /**
     * 获得某评论的一页回复,供[action]
     *
     * @param commentId 评论id
     * @param page      页数
     * @return list
     */
    public List<Reply> getPageReplys(int cid, int page) {

        Page page1 = new Page(page);
        page1.setPageSize(5);

        return this.getPageReplys(cid, page1);
    }

    /**
     * 获取某评论下所有回复组成的分页，当前页为第一页
     *
     * @param commentId 评论id
     * @return 回复list
     */
    public Page getReplyPage(int commentId) {

        int count = replyDAO.getReplyCount(commentId);

        Page page1 = new Page(1);
        page1.setPageSize(5);
        page1.setTotal(count);

        return page1;
    }


    /**
     * 增加一条回复
     *
     * @param user_id  用户名
     * @param content   内容
     * @param commentId 评论id
     * @return true 如果增加成功！
     */
    public boolean addReply(String user_id, String content, int commentId) {
        return replyDAO.addReply(user_id, content, commentId);
    }
}
