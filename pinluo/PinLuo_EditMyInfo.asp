<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Pinluo_Main/Conn.asp"-->
<!--#include file="../Pinluo_Main/Inc/md5.asp"-->
<!--#include file="PinLuo_Class.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
act=Trim(Request("act"))
dim PinLuo
Set PinLuo = New PinLuo_Class
    PinLuo.DBConnBegin
	PinLuo.CheckPurview
	UserID=Request.Cookies("pinluo")("UserID")
if act="editsave" then
	UserName = Trim(Request.Cookies("pinluo")("UserName"))
	UserPassword = Trim(Request.Form("UserPassword"))
	RealName = Trim(Request.Form("RealName"))
	Mobile = Trim(Request.Form("Mobile"))
	Email = Trim(Request.Form("Email"))
	UserPassed = Trim(Request.Form("UserPassed"))
if UserName="" then response.Write("<script language=""javascript"">alert('请填写用户账号！');window.history.back();</script>"):PinLuo.DBConnEnd:Set PinLuo=Nothing:response.End()
PinLuo_EditAdmin_chk=PinLuo.PinLuo_EditAdmin(UserID,UserName,UserPassword,UserPassed,RealName,Mobile,Email,"")
if PinLuo_EditAdmin_chk=true then
response.Write("<script language=""javascript"">alert('修改资料成功！');location.href='PinLuo_EditMyInfo.asp';</script>")
else
response.Write("<script language=""javascript"">alert('"&PinLuo.ErrMsg&"');window.history.back();</script>")
end if
PinLuo.DBConnEnd:Set PinLuo=Nothing:response.End()
end if
%>
<title>修改我的资料</title>
<meta content="品络科技,网站管理系统,企业网站管理系统,内容管理系统(CMS),网上商店管理系统,网站建设" name="Keywords" />
<meta content="品络科技成立于2005年6月，是一家集互联网基础服务、互联网应用软件开发、业务解决方案销售及服务于一体的高新技术企业。公司网址：www.5300.cn，品络互联：www.pinluo.com" name="Description"/>
<link rel="stylesheet" href="images/style.css" type="text/css">
<script language="javascript" src="js/Pinluo.js" type="text/javascript"></script>
</head>

<body class="mainbg">
	<div id="mainhearder"><span>您的位置：企业网站管理系统 >> 修改我的资料</span></div>
	<div id="hearder" class="hearder1"><span>修改我的资料</span></div>
	<div class="main5" id="main5">

<%
PinLuo.PinLuo_ViewAdminItem UserID
%>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	<td class="tableleft">
    
                    <form name="form1" method="post" action="PinLuo_EditMyInfo.asp">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
		<tr>
		  <td width="15%" class="tableleft1"><strong>用户账号：</strong></td>
		  <td width="85%" class="tableright1"><input name='UserName' type='text' class='input' value="<%=PinLuo.UserName%>" size='25' maxlength='255' readonly="readonly">&nbsp;&nbsp;</td>
		  </tr>
        <tr>
		  <td width="15%" class="tableleft1"><strong>用户密码：</strong></td>
		  <td width="85%" class="tableright1"><input type='password' size='25' maxlength='255' name='UserPassword' class='input' value="">&nbsp;&nbsp;(如不修改密码请留空)</td>
		  </tr>  
        <tr>
		<td class="tableleft1"><strong>真实姓名：</strong></td>
		<td class="tableright1"><input type='text' size='25' maxlength='255' name='RealName' class='input' value="<%=PinLuo.RealName%>"></td>
		</tr>
        <tr>
		<td class="tableleft1"><strong>联系电话：</strong></td>
		<td class="tableright1"><input type='text' size='25' maxlength='255' name='Mobile' class='input' value="<%=PinLuo.Mobile%>"></td>
		</tr>
        <tr>
		<td class="tableleft1"><strong>邮箱地址：</strong></td>
		<td class="tableright1"><input type='text' size='25' maxlength='255' name='Email' class='input' value="<%=PinLuo.Email%>"></td>
		</tr>
		<tr style="display:none">
		<td class="tableleft1"><strong>是否启用：</strong></td>
		<td class="tableright1"><label>
		  <input type="radio" name="UserPassed" id="radio" value="true"<%if PinLuo.UserPassed=true then%> checked="checked"<%end if%> />
		  是&nbsp;&nbsp;&nbsp;
		</label>
		  <input name="UserPassed" type="radio" id="radio2" value="false"<%if PinLuo.UserPassed=false then%> checked="checked"<%end if%> /> 
		  否
</td>
		</tr>
		<tr>
		  <td class="tableleft1">其他信息：</td>
		  <td class="tableright1">登陆IP：<font color="red"><%=PinLuo.LastLoginIP%></font>&nbsp;&nbsp;&nbsp;登陆时间：<font color="red"><%=PinLuo.LastLoginTime%></font>&nbsp;&nbsp;&nbsp;登陆次数：<font color="red"><%=PinLuo.LoginTimes%></font>&nbsp;&nbsp;&nbsp;退出时间：<font color="red"><%=PinLuo.LastLogoutTime%></font></td>
		  </tr>
        
		<tr>
		  <td height="55" align="center" class="tableleft1" style="height:39px;">&nbsp;</td>
		  <td height="55" class="tableright1">
          <input name="act" type="hidden" value="editsave" />
          <input type="submit" name="submit" value="完成修改" class="button">
		    <input type="reset" value="重新填写" class="button" name="reset" tabindex="25">
		    <input type="button" value="刷新本页" class="button" name="button" tabindex="25" onclick="location.reload()"></td>
		  </tr>

		</table>
        </form>
       		
	</td>
	</tr>
	</table>
	
	</div>
            <br />
<br />
&nbsp; 
<span style="display:none">
<!--
统计代码
品络科技用于统计本程序的使用量。
此代码不会影响您网站的正常运行和使用，请您保留。
请支持品络程序的发展！
-->
<script src="http://s16.cnzz.com/stat.php?id=396649&web_id=396649" language="JavaScript"></script>
<script language="javascript" type="text/javascript" src="http://js.users.51.la/3876074.js"></script>
<noscript><a href="http://www.51.la/?3876074" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/3876074.asp" style="border:none" /></a></noscript>
</span>
</body>
</html>