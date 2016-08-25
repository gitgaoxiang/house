<%@ page language="java"  pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test-Service</title>
<script type="text/javascript">
var basePath = "test/";
function testFun(value){
	document.getElementById('rightFrame').src= basePath + value;
	return false;
}
</script>
</head>
<body>

<table>
<tr style="background: lightblue;font-size: 18px">
<td colspan="2">
Nine-Service Test 
<a href="version.jsp" target="_blank" >2.2.0</a>
</td>
</tr>

<tr valign="top">
<td style="background: lightgreen;">

 <p>相册</p>
 
 <a href="#" onclick="testFun('Add_Album_Test.jsp');">添加相册</a><br>
 <a href="#" onclick="testFun('Del_Album_Test.jsp');">删除相册</a><br>
 <a href="#" onclick="testFun('Set_Album_Authority_Test.jsp');">修改相册权限</a><br>
 <a href="#" onclick="testFun('Album_ImageList_Test.jsp');">相册图片列表</a><br>

 <br>
 
 <a href="#" onclick="testFun('Recommend_Servlet_Test.htm');">好友推荐</a><br>
 <a href="#" onclick="testFun('Cont_Recommend_Servlet_Test.htm');">查询短信</a><br><br>

 <a href="#" onclick="testFun('Dynamic_PWD_Servlet_Test.htm');">动态密码</a><br><br>
 
 <a href="#" onclick="testFun('Do_Visit_Test.htm');">提交访问</a><br>
 <a href="#" onclick="testFun('Visit_Count_Test.htm');">访问列表</a><br><br>
 
  <a href="#" onclick="testFun('Do_Comment_Test.htm');">提交评论</a><br>
 <a href="#" onclick="testFun('CommentList_Test.htm');">评论列表</a><br><br>
 <a href="#" onclick="testFun('Do_Comment_Ranking_Test.htm');">评论排行榜</a><br><br>

 <a href="#" onclick="testFun('Do_Vote_Test.htm');">提交投票</a><br>
 <a href="#" onclick="testFun('Vote_Count_Test.htm');">投票列表</a><br><br>
 
 <a href="#" onclick="testFun('Order_Succ_Notice_Servlet_Test.htm');">订购成功通知</a><br><br>

 <a href="#" onclick="testFun('Remind_Test.htm');">预约</a><br><br>
 
 <a href="#" onclick="testFun('Token_Test.htm');">建立token</a><br>
 <a href="#" onclick="testFun('GetToken_Test.htm');">查询单个token</a><br>
 <a href="#" onclick="testFun('GetAllToken_Test.htm');">查询全部token</a><br><br>

 
 <a href="#" onclick="testFun('Exception_Servlet_Test.htm');">客户端异常反馈</a><br><br>

 <a href="#" onclick="testFun('Cache_Manager_Test.htm');">缓存管理</a><br>
 <a href="#" onclick="testFun('System_Manager_Test.htm');">系统管理</a><br>
 <a href="#" onclick="testFun('Stz_Channel_Test.htm');">ldap可用性测试</a><br><br>

<br>

<!--  <a href="test/remindMina" target="_blank" >预约Mina测试</a><br><br><br/> -->


 <a href="#" onclick="testFun('Do_UserInfo_Login_Test.jsp');">登录</a><br/>
 <a href="#" onclick="testFun('Do_UserInfo_Register_Test.jsp');">注册</a><br/>
 <a href="#" onclick="testFun('Do_UserInfo_ModPass_Test.jsp');">修改密码</a><br/>
<!--  <a href="#" onclick="testFun('UserInfo_FindPwd_Test.jsp');">密码找回</a><br/> -->
  <a href="#" onclick="testFun('Do_UserInfo_Edit_Test.jsp');">修改个人信息</a><br/><br/>
  
 <a href="#" onclick="testFun('Do_PlayHistory_Add_Test.jsp');">保存播放历史</a><br/>
 <a href="#" onclick="testFun('Do_PlayHistory_Query_Test.jsp');">查询播放历史</a><br/>
 <a href="#" onclick="testFun('Do_PlayHistory_Remove_Test.jsp');">删除播放历史</a><br/><br/>
 
 <a href="#" onclick="testFun('Do_Favorites_Test.jsp');">收藏</a><br>
 <a href="#" onclick="testFun('Do_Favorites_List_Test.jsp');">收藏列表</a><br>
 <a href="#" onclick="testFun('Do_Favorites_Cancel_Test.jsp');">取消收藏</a><br>
  <a href="#" onclick="testFun('Do_FavoritesOrder_Test.htm');">收藏排序</a><br><br>
 
 <a href="#" onclick="testFun('Do_User_Suggest_Servlet_Test.htm');">用户意见反馈</a><br>
 <br>
 
 <a href="#" onclick="testFun('Do_Comment_Test.jsp');">提交评论</a><br>
 <a href="#" onclick="testFun('Do_CommentList_Content_Test.jsp');">内容评论列表</a><br>
 <a href="#" onclick="testFun('Do_CommentList_User_Test.jsp');">我的评论列表</a><br>
 <a href="#" onclick="testFun('Do_Comment_Remove_Test.jsp');">删除评论</a><br><br>
 
 <a href="#" onclick="testFun('Do_UploadImage_Test.jsp');">上传图像</a><br><br>
 <a href="#" onclick="testFun('Do_GetImage_Test.htm');">获取图像</a><br><br>
 <a href="#" onclick="testFun('Do_existUserName_test.jsp');">test</a><br><br>
 
</td>

<td>
<iframe id="rightFrame" name="rightFrame" width="1000px" height="500px" frameborder="0" scrolling="auto" src=""></iframe>
</td>

</tr>

</table>

</body>
</html>