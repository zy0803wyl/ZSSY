<!--���������ɿƷ�EasyUi����������v3.5(build 20140519)��������������,��Ѱ��Զ����Ӱ�Ȩע��,�뱣����Ȩ��Ϣ�����������Ͷ��ɹ��������и��õĽ����뷢�����䣺843330160@qq.com-->
<!--�༭��form��datagrid�б����ݷֱ��������������aspxҳ����-->
<!--datagridҳ��:SpecimenRt_list.aspx-->
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecimenRt_list.aspx.cs" Inherits="RuRo.SpecimenRt_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="head">
<title>��Ҫ�����������ж��Ƿ���Ҫ�ط���His</title>
    <link rel="stylesheet" type="text/css" href="/js/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/js/easyui/themes/icon.css" />
	<script type="text/javascript" src="/js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="/js/gridPrint.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/kfmis.css"/>

</head>
<body>
<!--datagrid��--> 
<table id="datagrid" title="�ط�����" class="easyui-datagrid" style="width:auto;height:460px"
             url="SpecimenRt_handler.ashx?mode=qry" fit='false'
             pagination="true" idField="id" rownumbers="true" 
             fitColumns="true"  singleSelect="true" toolbar="#toolbar"
             striped="false" pageList="[15,30,50,100,500]"
             SelectOnCheck="true" CheckOnSelect="true" remoteSort="true">
    <thead>    
			<tr>
			    <th field="ck" checkbox="true"></th>
                <th field="id" width="100" sortable="true">���������</th>
                <th field="patientid" width="100" sortable="true">����Ψһ��ʶ��</th>
                <th field="patientname" width="100" sortable="true">��������</th>
                <th field="visitid" width="100" sortable="true">���߾����</th>
                <th field="sampleid" width="100" sortable="true">����Id</th>
                <th field="samplename" width="100" sortable="true">����Name</th>
                <th field="otherinfo" width="100" sortable="true">������Ϣ���������͡��ܹ������ڿ�������������������ʱ�䡢����ʱ�䣩</th>
            </tr>
    </thead>
</table>

<!--toolbar��������datagrid��toolbar�Զ�������--> 
<div id="toolbar">
<table style="width:100%;">
<tr>
    <td>
        <!--��ѯ������--> 
        <table>
            <tr>

                <!--��ѯ�ؼ�-->
                <td>
                    <!--
                    �����ֶ�<input id="so_�ֶ�����"  class="easyui-combobox" panelHeight="auto"  data-options="valueField:'������Ӧcode�ֶ���',textField:'������Ӧname�ֶ���', url:'/common/codeDataHandler.ashx?tabName=�������'"/>
                    <input id="date"     class="easyui-datebox" type="text" />
                    -->
                </td>
                <!--�����ؼ���-->
                <td><input id="so_keywords"  class="easyui-searchbox" data-options="prompt:'�������ѯ�ؼ���',searcher:searchData" ></input></td>
            </tr>
        </table> 
    </td>
    <!--button��ť������--> 
    <td  style="text-align:right;">
        <a href="javascript:void(0)" class="easyui-linkbutton" id="linkbuttonInfo" iconCls="icon-search" plain="false" onclick="infoForm();">�鿴</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" id="linkbuttonAdd" iconCls="icon-add" plain="false" onclick="newForm();">���</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" id="linkbuttonEdit" iconCls="icon-edit" plain="false" onclick="editForm();">�༭</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" id="linkbuttonDel" iconCls="icon-cancel" plain="false" onclick="destroy();">ɾ��</a>
    </td>
</tr>
</table>  
</div>

<!--diaglog���ڣ����ڱ༭����--> 
<div id="dlg"  class="easyui-dialog" closed="true"></div>

<script type="text/javascript">
	var url;
	/*������*/
	function newForm(){
		$('#dlg').dialog({    
            title: '�������',    
            width: 650, 
            height: 450,    
            closed: false,  
            cache: false,    
            href: 'SpecimenRt_info.aspx?mode=ins'
        });     
	}

	/*�鿴����*/
	function infoForm(){
		var rows = $('#datagrid').datagrid('getSelections');
	    if(rows.length>0){
	       if(rows.length==1){
				var row = $('#datagrid').datagrid('getSelected');
				$('#dlg').dialog({    
                    title: '�鿴����',    
                    width: 650,    
                    height: 450,    
                    closed: false,    
                    cache: true,    
                    href: 'SpecimenRt_info.aspx?mode=inf&pk='+ row.id
                });     
			}else{ 
				$.messager.alert('����', '�鿴����ֻ��ѡ��һ������', 'warning'); 
			}  
	    }else{
	         $.messager.alert('����', '��ѡ������', 'warning');
	    }
	}

	/*�޸�����*/
	function editForm(){
		var rows = $('#datagrid').datagrid('getSelections');
	    if(rows.length>0){
	       if(rows.length==1){
				var row = $('#datagrid').datagrid('getSelected');
				$('#dlg').dialog({    
                    title: '��Ҫ�����������ж��Ƿ���Ҫ�ط���His-�޸�����',    
                    width: 650,    
                    height: 450,    
                    closed: false,    
                    cache: true,    
                    href: 'SpecimenRt_info.aspx?mode=upd&pk='+ row.id
                });     
			}else{ 
				$.messager.alert('����', '�޸Ĳ���ֻ��ѡ��һ������', 'warning'); 
			}  
	    }else{
	         $.messager.alert('����', '��ѡ������', 'warning');
	    }
	}

	/*ɾ��ѡ������,������¼PK���������ö���,�ֿ�*/
	function destroy(){
		var rows = $('#datagrid').datagrid('getSelections');
		if(rows.length>0){ 
				var pkSelect="";
				for(var i=0;i<rows.length;i++){
					row = rows[i];
					if(i==0){
						pkSelect+= row.id;
					}else{
						pkSelect+=','+row.id;
					}
				}
				$.messager.confirm('��ʾ','�Ƿ�ȷ��ɾ�����ݣ�',function(r){
				if (r){
						$.post('SpecimenRt_handler.ashx?mode=del&pk='+pkSelect,function(result){
							if (result.success){
								$.messager.alert('��ʾ', result.msg, 'info',function(){
									$('#datagrid').datagrid('reload');    //���¼���������
								}); 
							} else {
								$.messager.alert('����', result.msg, 'warning');
							}
						},'json');
					}
				}); 
		}else{
			 $.messager.alert('����', '��ѡ������', 'warning');
		}
	}

	/*��ѯ������������*/
	function getSearchParm(){
		//������������׷�Ӳ�������
		/*comboboxֵ��ȡ����,��������������ѯ�������*/
		//var v_so_�ֶ����� = $('#so_�ֶ�����').combobox('getValue');
		var v_parm
		var v_so_keywords = $('#so_keywords').searchbox('getValue');
		v_parm = 'so_keywords='+escape(v_so_keywords);
		return v_parm;
	}

	/*��ѯ����*/
	function searchData(){
		/*��˵���Excel����������������datagrid����load�������ز�����ֱ����URL���ݲ���*/
		var Parm = getSearchParm();//��ò�ѯ����������������URL���ݲ�ѯ����
		var QryUrl='SpecimenRt_handler.ashx?mode=qry&'+Parm; 
		$('#datagrid').datagrid({url:QryUrl});
	}

    /*�ر�dialog���¼���datagrid����*/
    $('#dlg').dialog({onClose:function(){ 
        $('#datagrid').datagrid('reload'); //���¼���������
    }});

</script>

</body>
</html>
