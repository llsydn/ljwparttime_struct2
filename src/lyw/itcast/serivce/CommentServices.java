package lyw.itcast.serivce;

import lyw.itcast.dao.CommentDAO;
import lyw.itcast.dao.UserDao;
import lyw.itcast.domain.Comment;
import lyw.itcast.domain.Page;
import lyw.itcast.domain.Reply;
import lyw.itcast.domain.User;
import java.util.List;

/**
 * 提供评论的相关服务
 */
public class CommentServices {

    private CommentDAO commentDAO;
    private UserDao UserDao;

    public CommentServices() {
        commentDAO = new CommentDAO();
        UserDao = new UserDao();
    }

    /**
     * 获得某一页所有评论，包括发布人，回复
     *
     * @param comicId 兼职信息id
     * @return 评论的list
     */
    public List<Comment> getComicComments(int comicId, Page page) {

        //先获得这一页的所有评论
        List<Comment> lists_comment = commentDAO.getComicComments(comicId, page);
        //新建服务
        ReplyServices res = new ReplyServices();

        //遍历每一个评论进行操作
        for (Comment comment : lists_comment) {
            User user = UserDao.findById(comment.getUser_id());
            comment.setUser(user);//评论添加发布人信息

            Page replyPage = res.getReplyPage(comment.getId());//获得回复分页,默认是第一页
            comment.setReplyPage(replyPage);

            List<Reply> replyList = res.getPageReplys(comment.getId(), replyPage);//获得所有回复
            comment.setReplys(replyList);

        }

        return lists_comment;
    }

    /**
     * 添加评论
     *
     * @param user_id 用户名
     * @param message_id  兼职信息id
     * @param content   内容
     * @return true如果成功更新
     */
    public boolean addComment(String user_id, int message_id, String content) {
        return commentDAO.addComment(user_id, message_id, content);
    }

    /**
     * 获得该兼职信息的评论总数
     *
     * @param comicId 兼职信息id
     * @return 数量
     */
    public int getCommentCounts(int comicId) {
        return commentDAO.getCommentCounts(comicId);
    }

    /**
     * 获得评论的Page
     *
     * @param comicId 兼职信息id
     * @return 页数
     */
    public Page getCommentPage(int comicId) {
        Page page1 = new Page(1);
        int count = this.getCommentCounts(comicId);
        page1.setTotal(count);
        return page1;
    }

    public int getPageSize() {
        return new Page().getPageSize();
    }
}
