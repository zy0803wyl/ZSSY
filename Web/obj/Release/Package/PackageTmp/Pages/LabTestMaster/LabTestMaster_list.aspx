<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabTestMaster_list.aspx.cs" Inherits="RuRo.LabTestMaster_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head">
    <title>�����Ϣ</title>
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
    <table id="datagridMaster" title="LabTestMaster--�ٴ��������" class="easyui-datagrid" style="width: auto; height: 510px; text-align: center"
        fit='false'
        pagination="false" idfield="TestNo" rownumbers="true"
        fitcolumns="true" singleselect="true" toolbar="#toolbar"
        striped="false" pagelist="[15,30,50,100,500]"
        selectoncheck="true" checkonselect="true" remotesort="true">
        <thead>
            <tr>
                <th field="id" width="100" sortable="true" hidden="true">id</th>
                <th field="TestNo" width="100" sortable="true">�������뵥��</th>
                <th field="priorityIndicator" width="100" sortable="true" hidden="true">���ȱ�־</th>
                <th field="WorkingId" width="100" sortable="true">��������</th>
                <th field="TestCause" width="100" sortable="true">����Ŀ��</th>
                <th field="RelevantClinicDiag" width="100" sortable="true">�ٴ����</th>
                <th field="Specimen" width="100" sortable="true">�걾</th>
                <th field="SpcmReceivedDateTime" width="100" sortable="true">����ʱ��</th>
                <th field="OrderingDept" width="100" sortable="true">��ҽ������</th>
                <th field="orderingProvider" width="100" sortable="true" hidden="true">ҽ������</th>
                <th field="PerformedBy" width="100" sortable="true">ִ�п���</th>
                <th field="ResultStatus" width="100" sortable="true" hidden="true">ִ�����</th>
                <th field="ResultsRptDateTime" width="100" sortable="true" hidden="true">�������ʱ��</th>
                <th field="transcriptionist" width="100" sortable="true" hidden="true">�����߹���</th>
                <th field="VerifiedBy" width="100" sortable="true" hidden="true">����߹���</th>
            </tr>
        </thead>
    </table>

    <!--toolbar��������datagrid��toolbar�Զ�������-->
    <div id="toolbar">
        <table style="width: 100%;">
            <tr>
                <td style="text-align: right;">
                    <a href="javascript:void(0)" class="easyui-linkbutton" id="linkbuttonDel" iconcls="icon-search" plain="false" onclick="getLabTestResult();">�鿴��ϸ���ֵ</a>
                </td>
            </tr>
        </table>
    </div>
    <!--diaglog���ڣ����ڱ༭����-->
    <div id="dlg" class="easyui-dialog" closed="true"></div>
    <div id="resultwin"></div>
    <div id="masterinfo" ></div>
    <div id="winmasterinfo"></div>
    <div style="display: none">
        <input id="workingId" class="easyui-textbox" name="name" style="display: none" />
        <input id="testNo" class="easyui-textbox" name="name" style="display: none" />
    </div>
    <script type="text/javascript">
        $(function () {
            //��˫�����¼�
            $('#datagridMaster').datagrid({
                onDblClickRow: function (rowIndex, rowData) {
                    showLabTestMasterData(rowData);
                }
            });
            //���������¼�
            //$("#datagrid").datagrid({
            //    onSortColumn: function (sort, order) {
            //        //sortData(sort, order);
            //    }
            //})
        })
        function showLabTestMasterData(rowData) {
            if (!rowData) { $.messager.alert('��ʾ', '���������Ƿ���ڣ�', 'error'); }
            else {
                $('#winmasterinfo').window(function () { this.window.close() });
                $('#winmasterinfo').window({
                    title: 'LabTestMaster--��ϸ����ҳ��',
                    width: 800,
                    height: 500,
                    modal: true,
                    href: '/Pages/LabTestMaster/LabTestMaster_info.aspx?mod=inf',
                    onLoad: function () {
                        //var basedata = $.parseJSON(rowData);
                        //$("#frmAjax").form("load", basedata);
                        $("#frmAjax").form("load", rowData);
                    }
                });
            }
        }

        function loadTestResultData(workingId, testNo) {
            $('#name').textbox('setValue', "��������");
            $("#datagridLTR").datagrid("loadData", { total: 0, rows: [] });
            $.ajax({
                type: "get",
                url: "/Sever/LabTest.ashx?mod=getLTR&workingId=" + workingId + "&testNo=" + testNo,
                dataType: "json",
                success: function (response) {
                    if (response) {
                        // var data = JSON.parse(response);
                        var data = response;
                        if (data.State == "0") {
                            if (data.Data) {
                                if (data.Data.ResultCode == 0) {
                                    //��ȡ���ݳɹ�
                                    $("#datagridLTR").datagrid("loadData", data.Data.LabTestResul);
                                    //$('#name').textbox('setValue', data.Data.Name);
                                } else {
                                    //��ȡ����ʧ��
                                    ShowMsg(data.Data.ResultContent)
                                }
                            } else {
                                ShowMsg(data.Msg);
                            }
                        }
                        else if (data.State == "1") {
                            ShowMsg(data.Msg);
                        }
                        else {
                            ShowMsg("��ѯ���ݴ�����������")
                        }
                    } else {
                        ShowMsg("��ѯ���ݴ�����������")
                    }
                }
            });
        }
        function getLabTestResult() {
            var rows = $('#datagridMaster').datagrid('getSelections');
            if (rows.length > 0) {
                if (rows.length == 1) {
                    var row = $('#datagridMaster').datagrid('getSelected');
                    $('#resultwin').window({
                        title: 'LabTestMaster-�鿴���',
                        width: 800,
                        height: 500,
                        modal: true,
                        href: '/Pages/LabTestResult/LabTestResult_list.aspx',
                        onOpen: function () {
                            loadTestResultData(row.WorkingId, row.TestNo);
                        }
                    })
                } else {
                    $.messager.alert('����', '�鿴�������ֻ��ѡ��һ������', 'warning');
                }
            } else {
                $.messager.alert('����', '��ѡ������', 'warning');
            }
        }
    </script>

</body>
</html>
