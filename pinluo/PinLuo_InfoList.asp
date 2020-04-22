﻿<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Pinluo_Main/Conn.asp"-->
<!--#include file="PinLuo_Class.asp"-->
<%
act=Trim(Request("act"))
classid=Trim(Request("classid"))
SearchKeyword2 = Trim(Request("SearchKeyword"))
SearchSelect2 = Trim(Request("SearchSelect"))

OnepageNum=12
dim PinLuo
Set PinLuo = New PinLuo_Class
    PinLuo.DBConnBegin
	PinLuo.CheckPurview
	PinLuo.Pinluo_CheckPurviewAdmin(5)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="images/style.css" type="text/css">
<title>信息管理</title>
<script language="JavaScript">
<!--
function CheckOthers(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
			if (e.checked==false)
			{
				e.checked = true;
			}
			else
			{
				e.checked = false;
			}
	}
}

function CheckAll(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
			e.checked = true
	}
}

function submit_to(url){
document.PinLuo_Infolist.action=url;
document.PinLuo_Infolist.submit();
}
//-->
</script>
</head>
<body class="mainbg">
	<div id="mainhearder"><span>您的位置：企业网站管理系统 >> 信息文章管理</span></div>
	
	<div id="hearder" class="hearder1"><span>信息列表</span></div>
	
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	<td class="tableleft">
        <form action="PinLuo_InfoList.asp" method="post" name="PinLuo_SearchInfolist" id="PinLuo_SearchInfolist">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table">
        <tr>
		<td colspan="9" class="stline" style="height:50px; border-bottom:none;">
        <select title="请选择分类！" id="classid" name="classid">
										<option value="" selected>-----选择分类-----</option>
										<%=PinLuo.PinLuo_GetClass_Option("PinLuo_InfoClass",0,classid,-1)%>
									</select>
        <input name="SearchKeyword" type="text"  id="SearchKeyword" class='input' title=" 请输入关键字！ "  value="<% = Server.Htmlencode(SearchKeyword2) %>" size="40" maxlength="255" >	
									<select title="请选择查询范围！" id="SearchSelect" name="SearchSelect">
										<option value=""<%if SearchSelect2="" then%> selected<%end if%>>-----选择范围-----</option>
										<option value="InfoTitle"<%if SearchSelect2="InfoTitle" then%> selected<%end if%>>|----信息标题</option>
										<option value="InfoContent"<%if SearchSelect2="InfoContent" then%> selected<%end if%>>|----信息内容</option>
                                        <option value="Author"<%if SearchSelect2="Author" then%> selected<%end if%>>|----作者</option>
										<option value="Origin"<%if SearchSelect2="Origin" then%> selected<%end if%>>|----出处</option>
                                        <option value="Shenhe1"<%if SearchSelect2="Shenhe1" then%> selected<%end if%>>|----未审核</option>
										<option value="Shenhe2"<%if SearchSelect2="Shenhe2" then%> selected<%end if%>>|----已审核</option>
                                        <option value="InfoImg"<%if SearchSelect2="InfoImg" then%> selected<%end if%>>|----带缩略图</option>
									</select>
                                    <input name="Submit" type="Submit" class="buttonnor"  value=" 查 询 ">&nbsp;
									<input   title=" 单击重置表单！ " class="buttonnor"
										 type="reset" value=" 重 置 " name="Submit">
        </td>
		</tr>
        </table>
        </form>
        </td>
	    </tr>
        </table>
   <form action="PinLuo_InfoList.asp" method="post" name="PinLuo_Infolist" id="PinLuo_Infolist">
   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
	<td class="tableleft">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table">
		<tr class="stline_one">
		<td width="5%" class="heardertop1">&nbsp;</td>
		<td width="8%" class="heardertop1">编号</td>
		<td width="39%" class="heardertop1">标题</td>
		<td width="14%" class="heardertop1">分类</td>
		<td width="9%" class="heardertop1">发布日期</td>
		<td width="8%" class="heardertop1">浏览次数</td>
		<td width="5%" class="heardertop1">审核</td>
		<td width="6%" class="heardertop1">排序</td>
		<td width="6%" class="heardertop1">修改</td>
		</tr>
		
		<%PinLuo.PinLuo_InfoListView OnepageNum,SearchKeyword2,SearchSelect2,classid,"PinLuo_InfoList","PinLuo_InfoClass"%>
		
		</table>
	</td>
	</tr>
	</table>
	<div id="page">
		<div id="add">
			<input name="button2" type="button" class="buttonnor" value="全选" onClick="CheckAll(this.form);">
			<input name="button2" type="button" class="buttonnor" value="反选" onClick="CheckOthers(this.form)">
            <input name="button2" type="button" class="buttonnor" value="刷新" onClick="window.location.reload();">
            <input name="button1" type="button" class="buttonadd" value="新增" onClick="location.href='Pinluo_info.asp?Act=add';">
			<input name="button4" type="button" class="buttondel" value="删除" onClick="submit_to('Pinluo_info.asp?Act=del');">
		</div>
        <div>
        <%=Pinluo.Pinluo_showpage_temp%>
        </div>
	</div>    

	</form><br />
<br />
<br />
&nbsp;
</body>
</html>
<%
PinLuo.DBConnEnd
Set PinLuo = Nothing
%>