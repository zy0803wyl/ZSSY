 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabTestResult_info.aspx.cs" Inherits="RuRo.LabTestResult_info" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="head">
<title>LabTestResult</title>
    <link rel="stylesheet" type="text/css" href="../../include/jquery-easyui-1.4.3/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../include/jquery-easyui-1.4.3/themes/icon.css" />
    <script type="text/javascript" src="../../include/jquery-easyui-1.4.3/jquery.min.js"></script>
    <script type="text/javascript" src="../../include/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../include/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../../include/css/kfmis.css" />
    <script type="text/javascript" src="../../include/js/page.js"></script>
    <script type="text/javascript" src="../../include/js/jquery.cookie.js"></script>
</head>
<body>
<!--�洢��������input�ؼ����ж������������޸�--> 
<input value=""  id="mode" type="text" style="display:none"  runat="server"  />
<input value=""  id="pk" type="text"   style="display:none" runat="server"  />
<!--�༭����--> 
<!--�༭��������ť�̶��ڵײ�--> 
<div class="easyui-layout" data-options="fit:true">
<div data-options="region:'center',split:true" style="width:100px;padding:10px">
<div id="printBody"> 
<div class="ftitle"></div>
    <form id="frmAjaxLTR" method="post" novalidate>
        <!--������Ʊ��ؼ�Ϊ�����������class="easyui-validatebox" required="true" -->
        <div class="fitem" style="display:none">
            <div class="label">id:</div>
            <div class="control"><input id="id"  name="id"  disabled="disabled" /></div>
        </div>
        <div class="fitem">
            <div class="label">��������:</div>
            <div class="control"><input  id="ReportItemName"  name="ReportItemName"   /></div>
        </div>
        <div class="fitem">
            <div class="label">�������:</div>
            <div class="control"><input  id="ReportItemCode"  name="ReportItemCode"   /></div>
        </div>
        <div class="fitem">
            <div class="label">N-����L-��H-��:</div>
            <div class="control"><input  id="AbnormalIndicator"  name="AbnormalIndicator"   /></div>
        </div>
        <div class="fitem">
            <div class="label">������Ϊ��ֵ��:</div>
            <div class="control"><input  id="Units"  name="Units"   /></div>
        </div>
        <div class="fitem">
            <div class="label">�������ڼ�ʱ��:</div>
            <div class="control"><input  id="ResultDateTime"  name="ResultDateTime"   /></div>
        </div>
        <div class="fitem">
            <div class="label">����ο�ֵ:</div>
            <div class="control"><input  id="ReferenceResult"  name="ReferenceResult"   /></div>
        </div>
        <div class="fitem">
            <div class="label">��������:</div>
            <div class="control"><textarea  id="Result"  name="Result"  ></textarea></div>
        </div>
    </form>
<div class="ftitle"></div>
</div>
</div>

<div data-options="region:'south'" style="height:40px; background:#f2f2f2;">
<!--��ť-->
<div class="fsubmit">
</div>
</div>
</div>

<script type="text/javascript">
var mode = $('#mode').val();
var pk =  $('#pk').val();

/*�༭��鿴״̬�¿ؼ���ֵ*/
if(mode=='upd'|| mode=='inf'){ 
    url = 'LabTestResult_handler.ashx?mode=inf&pk='+pk; 
    $.post(url,function(data){ 
         $('#frmAjax').form('load',data);
    },'json');
    $('#linkbuttonClear').linkbutton({disabled:true});
}

/*�鿴״̬��disabled�ؼ�*/
if(mode=='inf'){ 
    $('#linkbuttonSave').linkbutton({disabled:true});
    $('input').attr('disabled','disabled');
    $('textarea').attr('disabled','disabled');
}

if(mode=='ins') url = 'LabTestResult_handler.ashx?mode=ins';
if(mode=='upd') url = 'LabTestResult_handler.ashx?mode=upd&pk='+pk;

</script>

</body>
</html>
