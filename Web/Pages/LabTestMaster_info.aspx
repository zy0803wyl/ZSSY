<!--���������ɿƷ�EasyUi����������v3.5(build 20140519)��������������,��Ѱ��Զ����Ӱ�Ȩע��,�뱣����Ȩ��Ϣ�����������Ͷ��ɹ��������и��õĽ����뷢�����䣺843330160@qq.com-->
<!--�༭����form��datagrid�б����ݷֱ��������������aspxҳ����-->
<!--formҳ��:LabTestMaster_info.aspx-->
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabTestMaster_info.aspx.cs" Inherits="RuRo.LabTestMaster_info" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="head">
<title>LabTestMaster</title>
    <link rel="stylesheet" type="text/css" href="/js/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css" />
	<script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="/js/gridPrint.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/kfmis.css"/>
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
<div class="ftitle">LabTestMaster</div>
    <form id="frmAjax" method="post" novalidate>
        <!--������Ʊ����ؼ�Ϊ�����������class="easyui-validatebox" required="true" -->
        <div class="fitem">
            <div class="label">id:</div>
            <div class="control"><input id="id"  name="id"  disabled="disabled" /></div>
        </div>
        <div class="fitem">
            <div class="label">�������뵥��:</div>
            <div class="control"><input  id="testno"  name="testno"   /></div>
        </div>
        <div class="fitem">
            <div class="label">���ȱ�־:</div>
            <div class="control"><input  id="priorityindicator"  name="priorityindicator"   /></div>
        </div>
        <div class="fitem">
            <div class="label">��������:</div>
            <div class="control"><input  id="workingid"  name="workingid"   /></div>
        </div>
        <div class="fitem">
            <div class="label">����Ŀ��:</div>
            <div class="control"><input  id="testcause"  name="testcause"   /></div>
        </div>
        <div class="fitem">
            <div class="label">�ٴ����:</div>
            <div class="control"><textarea  id="relevantclinicdiag"  name="relevantclinicdiag"  ></textarea></div>
        </div>
        <div class="fitem">
            <div class="label">�걾:</div>
            <div class="control"><input  id="specimen"  name="specimen"   /></div>
        </div>
        <div class="fitem">
            <div class="label">����ʱ��:</div>
            <div class="control"><input  id="spcmreceiveddatetime"  name="spcmreceiveddatetime"   /></div>
        </div>
        <div class="fitem">
            <div class="label">��ҽ������:</div>
            <div class="control"><input  id="orderingdept"  name="orderingdept"   /></div>
        </div>
        <div class="fitem">
            <div class="label">ҽ������:</div>
            <div class="control"><input  id="orderingprovider"  name="orderingprovider"   /></div>
        </div>
        <div class="fitem">
            <div class="label">ִ�п���:</div>
            <div class="control"><input  id="performedby"  name="performedby"   /></div>
        </div>
        <div class="fitem">
            <div class="label">ִ�����:</div>
            <div class="control"><input  id="resultstatus"  name="resultstatus"   /></div>
        </div>
        <div class="fitem">
            <div class="label">�������ʱ��:</div>
            <div class="control"><input  id="resultsrptdatetime"  name="resultsrptdatetime"   /></div>
        </div>
        <div class="fitem">
            <div class="label">�����߹���:</div>
            <div class="control"><input  id="transcriptionist"  name="transcriptionist"   /></div>
        </div>
        <div class="fitem">
            <div class="label">����߹���:</div>
            <div class="control"><input  id="verifiedby"  name="verifiedby"   /></div>
        </div>
    </form>
<div class="ftitle"></div>
</div>
</div>

<div data-options="region:'south'" style="height:40px; background:#f2f2f2;">
<!--��ť-->
<div class="fsubmit">
	<a href="javascript:void(0)" id="linkbuttonSave" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveForm()">����</a>
	<a href="javascript:void(0)" id="linkbuttonClear" class="easyui-linkbutton" iconCls="icon-back" onclick="clearForm();">���</a>
	<a href="javascript:void(0)" id="linkbuttonColse" class="easyui-linkbutton" iconCls="icon-cancel" onclick="$('#dlg').dialog('close');">�ر�</a>
</div>
</div>
</div>

<script type="text/javascript">
var mode = $('#mode').val();
var pk =  $('#pk').val();

/*�༭��鿴״̬�¿ؼ���ֵ*/
if(mode=='upd'|| mode=='inf'){ 
    url = 'LabTestMaster_handler.ashx?mode=inf&pk='+pk; 
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

if(mode=='ins') url = 'LabTestMaster_handler.ashx?mode=ins';
if(mode=='upd') url = 'LabTestMaster_handler.ashx?mode=upd&pk='+pk;

/*��ճ���*/
function clearForm(){
    $('#frmAjax').form('clear');
}

	/*�����������*/
	function saveForm() {
	    var validate = true;
	    /*��֤validatebox������*/
        try{
	        if($('#frmAjax').find('.easyui-validatebox').val() == ''){
	            validate = false;
	            $.messager.alert('����', '����������Ƿ���ȷ��д��', 'warning');   //������Ϣ
	            return ;
	        }
	    }catch(exption){}

        /*��֤datebox����*/
        try{
	        if($('#frmAjax').find('.easyui-datebox').datebox('getValue') == ''){
	            validate = false;
	            $.messager.alert('����', '���������Ƿ���ȷѡ��', 'warning');   //������Ϣ
	            return ;
	        }
	    }catch(exption){}

        /*��֤datetimebox����*/
        try{
	        if($('#frmAjax').find('.easyui-datetimebox').datetimebox('getValue') == ''){
	            validate = false;
	            $.messager.alert('����', '���������Ƿ���ȷѡ��', 'warning');   //������Ϣ
	            return ;
	        }
	    }catch(exption){}

	    /*��֤numberbox����*/
	    try{
	        if($('#frmAjax').find('.easyui-numberbox').numberbox('getValue') == ''){
	            validate = false;
	            $.messager.alert('����', '��������������Ƿ���ȷ��д��', 'warning');   //������Ϣ
	            return ;
	        }
	    }catch(exption){}

	    /*��֤combobox��ѡ��*/ 
	    try{
	        if($('#frmAjax').find('.easyui-combobox').combobox('getValue') == ''){
	            validate = false;
	            $.messager.alert('����', '�����ѡ���Ƿ���ȷѡ��', 'warning');   //������Ϣ
	            return ;
	        }
	    }catch(exption){}

	    /*��֤combogrid��ѡ��*/ 
	    try{
	        if($('#frmAjax').find('.easyui-combogrid').combogrid('getValue') == ''){
	            validate = false;
	            $.messager.alert('����', '�����ѡ���Ƿ���ȷѡ��', 'warning');   //������Ϣ
	            return ;
	        }
	    }catch(exption){}
        /*URL֧�ֲ��������ƣ�С�ֶα�ʹ��
		if (validate==true){
			var Parm = $('#frmAjax').serialize();
			var saveUrl = url + '&' + Parm; 
			$.post(saveUrl, function (result) {
				if (result.success) {
					$('#dlg').dialog('close');
					$.messager.alert('��ʾ',result.msg, 'info',function(){
						$('#datagrid').datagrid('reload'); // ���¼�������
					});
				} else {
					$.messager.alert('����', result.msg, 'warning');   //������Ϣ
				}
			}, 'json');
		}
		*/



		/*URL֧�ֲ��������ƣ��ɲ���submit,post�ύAjax����*/
		if (validate==true){
		    $('#frmAjax').form('submit',{  
		        url:url,
                success: function(result){
                        resultJSON = $.parseJSON(result); 
                        if (resultJSON.success) {
					        $('#dlg').dialog('close');
					        $.messager.alert('��ʾ',resultJSON.msg, 'info',function(){
						        $('#datagrid').datagrid('reload'); // ���¼�������
					        });
				        } else {
					        $.messager.alert('����', resultJSON.msg, 'warning');   //������Ϣ
				        }
                }  
            });
        }

	}

</script>

</body>
</html>