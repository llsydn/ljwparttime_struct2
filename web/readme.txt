1.开发环境搭建
	1.1开发需要的jar文件
	    mysql驱动
	    beanutils开发包
	    log4j
	    c3p0连接池(c3p0-0.9.2-pre1.jar,mchange-commons-0.2.jar)
	1.2工程包创建
		lyw.itcast.domain
		lyw.itcast.dao
		lyw.itcast.dao.impl
		lyw.itcast.serivce
		lyw.itcast.service.impl
		lyw.itcast.web.controller
		lyw.itcast.web.UI
		lyw.itcast.utils
		web-inf\jsp

	1.3 创建数据库
		create database lyw_parttime;
		use lyw_parttime;
		create table user
		(
			id varchar(40) primary key,
			name varchar(40) not null,
			password varchar(40) not null
		);
		
实现分页	
<!-- 调用当前jsp的方法是:	<%@include file="/public/page.jsp" %> -->
String pagenum = request.getParameter("pagenum");
BusinessService service = new BusinessService();

String serletName = this.getServletName();

Page page = service.getPageData(pagenum,request.getContextPath() + "/servlet/" + serletName);
request.setAttribute("page", page);
request.getRequestDispatcher("/WEB-INF/jsp/listcustomer.jsp").forward(request, response);

2016/4/8
1.新增：struct2架构
2.兼职种类的类Commodity
3.CommodityDAO，CommodityServices
4.数据库新增表兼职分类
5.记得更改数据库密码，开mysql

2016/4/8.2
创建简历表
create table user_resume(
	resume_id varchar(40) primary key, //简历表id号
	title varchar(40) not null, //标题
	name varchar(10),//用户真实的姓名
	sex varchar(4),//性别
	age varchar(4),//年龄
	email varchar(20),//邮箱
	salary varchar(20),//工资
	experience varchar(400),//兼职经验
	introduction varchar(400) not null,//自我介绍
	user_id varchar(40),//用户id号
	constraint user_id_FK foreign key(user_id) references user(user_id)
)DEFAULT CHARSET=utf8;

alter table test add column birth2 date default '2013-1-1'; //设置默认值。

兼职收藏
create table user_message(
	user_id varchar(40),
	message_id int(11),
	apply_time datetime not null,
	primary key(user_id, message_id),
    constraint fk_userid foreign key (user_id) references user(user_id),
    constraint fk_messageid foreign key (message_id) references message(id)
);

 商家收藏 （注意外键的名字不能重复的）
create table user_business(
	user_id varchar(40), 
	business_id int(11),
	coltime datetime not null,
	primary key(user_id, business_id),
    constraint fk1_userid foreign key (user_id) references user(user_id),
    constraint fk1_bussinessid foreign key (business_id) references business(id)
);
意见反馈表
create table feedback(
	feedbackid int auto_increment primary key not null, 自动增长的id
	user_id varchar(40) not null,
	comment varchar(200) not null,
	style varchar(40),
	feedbacktime datetime not null,
	constraint fk2_userid foreign key (user_id) references user(user_id)
);

 
 
 
 
 
 
 
 