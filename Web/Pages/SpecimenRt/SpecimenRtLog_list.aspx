<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecimenRtLog_list.aspx.cs" Inherits="RuRo.SpecimenRtLog_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="head">
<title>�ط����ݼ�¼�浵</title>
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
<!--datagrid��--> 
<table id="dgSpecimenRtLog" title="�ط����ݼ�¼�浵" class="easyui-datagrid" style="width:auto;height:460px"
             url="SpecimenRtLog_handler.ashx?mode=qry" fit='false'
             pagination="true" idField="id" rownumbers="true" 
             fitColumns="true"  singleSelect="true" toolbar="#toolbar"
             striped="false" pageList="[10,20,50,80]"
             SelectOnCheck="true" CheckOnSelect="true" remoteSort="false">
    <thead>    
			<tr>
			    <%--<th field="ck" checkbox="true"></th>--%>
                <th field="id" width="100" sortable="true" hidden="hidden">������</th>
                <th field="username" width="100" sortable="true">�ط��û�</th>
                <th field="PatiendId" width="100" sortable="true">����Ψһ��ʶ</th>
                <th field="SampleId" width="50" sortable="true">����id</th>
                <th field="PostBackStatus" width="100" sortable="true">״̬</th>
                <th field="PostBackDate" width="100" sortable="true">�ط�ʱ��</th>
            </tr>
    </thead>
</table>

<!--toolbar��������datagrid��toolbar�Զ�������--> 
<div id="toolbar">
<table style="width:100%;">
<tr>
    <!--button��ť������--> 
    <td  style="text-align:right;">
        <a href="javascript:void(0)" class="easyui-linkbutton" id="linkbuttonInfo" iconCls="icon-search" plain="false" onclick="loadLogData();">�鿴</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" id="linkbuttonAdd" iconCls="icon-add" plain="false" onclick="resHis();">�ط�</a>
    </td>
</tr>
</table>  
</div>

<!--diaglog���ڣ����ڱ༭����--> 
<div id="dlg"  class="easyui-dialog" closed="true"></div>
<script type="text/javascript">
	var url;
    /*�ط�����*/
	function resHis() {
	    $.messager.alert('��ʾ', '��ʼ�ط�����', 'error');
	    ajaxLoading();
	    $.ajax({
	        type: 'GET',
	        url: '../Sever/SpecimenRtLog_handler.ashx?action=respondhis',
	        onSubmit: function () { },
	        success: function (data) {
	            ajaxLoadEnd();
	            $.messager.alert('��ʾ', '�ط���ɣ�����鿴�ط���Ϣ', 'error');
	        }
	    });
	}
    /*��ѯ����*/
	function loadLogData() {
	    $.ajax({
	        type: 'GET',
	        url: '../Sever/SpecimenRtLog_handler.ashx?mode=qry',
	        onSubmit: function () { },
	        success: function (data) {
	            var getdata = JSON.parse(data);
	            var loaddata = getdata.ds;
	            if (!loaddata) { $.messager.alert('��ʾ', '��ѯ��������,���������Ƿ���ڣ�', 'error'); }
	            else {
	                PagePaging(loaddata);
	            }
	        }
	    });
	}

	function PagePaging(loaddata) {
	    $("#dgSpecimenRtLog").datagrid({
	        data: loaddata.slice(0, 10)
	    });
	    var pager = $("#dgSpecimenRtLog").datagrid("getPager");
	    pager.pagination({
	        total: loaddata.length,
	        onSelectPage: function (pageNo, pageSize) {
	            var start = (pageNo - 1) * pageSize;
	            var end = start + pageSize;
	            $("#dgSpecimenRtLog").datagrid("loadData", loaddata.slice(start, end));
	            pager.pagination('refresh', {
	                total: loaddata.length,
	                pageNumber: pageNo
	            });
	        }
	    });
	}

	function searchData(){
		/*��˵���Excel����������������datagrid����load�������ز�����ֱ����URL���ݲ���*/
		var Parm = getSearchParm();//��ò�ѯ����������������URL���ݲ�ѯ����
		var QryUrl='SpecimenRtLog_handler.ashx?mode=qry&'+Parm; 
		$('#datagrid').datagrid({url:QryUrl});
	}
    /*�ر�dialog���¼���datagrid����*/
    $('#dlg').dialog({onClose:function(){ 
        $('#datagrid').datagrid('reload'); //���¼���������
    }});
</script>

</body>
</html>
