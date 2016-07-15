package lyw.itcast.action;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lyw.itcast.domain.Comment;
import lyw.itcast.domain.Page;
import lyw.itcast.domain.Reply;
import lyw.itcast.serivce.CommentServices;
import lyw.itcast.serivce.ReplyServices;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 评论的json接口
 * http://localhost:8080/comment?comic=1&page=1
 */
public class CommentAction  extends ActionSupport{

    private CommentServices commentServices;
    private ReplyServices replyServices;

    /**
     * 构造函数
     */
    public CommentAction() {
        commentServices = new CommentServices();
        replyServices = new ReplyServices();
    }
    
    //网页传来的参数，评论或者回复页数
    private int page;
  //网页传来的参数，兼职信息的id，获取评论用
    private int message_id;
    //网页传来的参数，代表评论id,获取回复用
    private int cid;
    
    //返回的评论Page
    private Page comPage;
    //返回的评论list
    private List<Comment> comList;

	//返回的回复Page
	private Page replyPage;
	//返回的回复list
	private List<Reply> replies;
	//返回的回复list2
	private List<Reply> replies2;
	
    /**
     * action 返回某一页评论list
     */
    public String getCommentList() {
    	System.out.println("getCommentList");
        Page page1 = new Page(page);
        comList = commentServices.getComicComments(message_id, page1);
        return SUCCESS;
    }

	/**
     * action 返回评论的页数
     */
    public String getCommentPage() {
    	comPage = commentServices.getCommentPage(message_id);
        return SUCCESS;
    }
    
    /**
     * action 获得某一页的回复,返回list<Reply>的json
     */
    public String getRepliesByPage() {
    	System.out.println("我擦！");
    	replies = replyServices.getPageReplys(cid, page);
        return SUCCESS;
    }

	/**
	 * action 获得第一页的回复,返回Page和list<Reply>两个的json
     */
    public String getPageOneReply(){
    	replyPage=replyServices.getReplyPage(cid);
    	replies2=replyServices.getPageReplys(cid, replyPage);
    	
    	System.out.println("getPageOneReply,cid:"+cid);

        return SUCCESS;
    }

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public Page getComPage() {
		return comPage;
	}

	public void setComPage(Page comPage) {
		this.comPage = comPage;
	}

	public List<Comment> getComList() {
		return comList;
	}

	public void setComList(List<Comment> comList) {
		this.comList = comList;
	}

	public Page getReplyPage() {
		return replyPage;
	}

	public void setReplyPage(Page replyPage) {
		this.replyPage = replyPage;
	}

	public List<Reply> getReplies() {
		return replies;
	}

	public void setReplies(List<Reply> replies) {
		this.replies = replies;
	}

	public List<Reply> getReplies2() {
		return replies2;
	}

	public void setReplies2(List<Reply> replies2) {
		this.replies2 = replies2;
	}
}
