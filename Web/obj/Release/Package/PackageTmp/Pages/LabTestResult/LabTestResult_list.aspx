<!--���������ɿƷ�EasyUi����������v3.5(build 20140519)��������������,��Ѱ��Զ����Ӱ�Ȩע��,�뱣����Ȩ��Ϣ�����������Ͷ��ɹ��������и��õĽ����뷢�����䣺843330160@qq.com-->
<!--�༭��form��datagrid�б����ݷֱ��������������aspxҳ����-->
<!--datagridҳ��:LabTestResult_list.aspx-->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabTestResult_list.aspx.cs" Inherits="RuRo.LabTestResult_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
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
    <!--datagrid��-->
    <table id="datagridLTR" class="easyui-datagrid" style="width: auto; height: 460px"
        fit='false'
        pagination="false" idfield="ReportItemName" rownumbers="true"
        fitcolumns="true" singleselect="true"
        striped="false" pagelist="[15,30,50,100,500]"
        selectoncheck="true" checkonselect="true" remotesort="true">
        <thead>
            <tr>
                <th field="id" width="100" sortable="true" hidden="true">id</th>
                <th field="ReportItemName" width="100" sortable="true">��������</th>
                <th field="ReportItemCode" width="100" sortable="true">�������</th>
                <th field="AbnormalIndicator" width="100" sortable="true">���</th>
                <th field="Result" width="100" sortable="true">��������</th>
                <th field="Units" width="100" sortable="true">������</th>
                <th field="ResultDateTime" width="100" sortable="true">�������ڼ�ʱ��</th>
                <th field="ReferenceResult" width="100" sortable="true">����ο�ֵ</th>
            </tr>
        </thead>
    </table>
    <!--toolbar��������datagrid��toolbar�Զ�������-->
    <!--diaglog���ڣ����ڱ༭����-->
    <div id="dlg" class="easyui-dialog" closed="true"></div>
    <div id="winresultinfo"></div>
    <script type="text/javascript">
        function showLabTestResult_listData(rowData) {
            if (!rowData) { $.messager.alert('��ʾ', '���������Ƿ���ڣ�', 'error'); }
            else {
                $('#winresultinfo').window({
                    title: 'LabTestResult_list--��ϸ����ҳ��',
                    width: 800,
                    height: 500,
                    modal: true,
                    href: '/Pages/LabTestResult/LabTestResult_info.aspx?mod=inf',
                    onLoad: function () {
                        $("#frmAjaxLTR").form("load", rowData);
                    }
                });
            }
        }
        $(function () {
            //��˫�����¼�
            $('#datagridLTR').datagrid({
                onDblClickRow: function (rowIndex, rowData) {
                    showLabTestResult_listData(rowData);
                }
            });
        })
    </script>

</body>
</html>
