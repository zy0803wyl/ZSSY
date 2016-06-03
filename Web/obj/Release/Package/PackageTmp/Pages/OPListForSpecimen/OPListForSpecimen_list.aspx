<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OPListForSpecimen_list.aspx.cs" Inherits="RuRo.OPListForSpecimen_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head">
    <title>��ѯҳ��</title>
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
    <table id="OPListForSpecimen" title="���ڲ�ѯ" class="easyui-datagrid" style="width: auto; height: 460px;text-align:center;align-content:center"
        url="OPListForSpecimen_handler.ashx?mode=qrydate" fit='false'
        pagination="true" idfield="PatientId" rownumbers="true"
        fitcolumns="true" singleselect="true" toolbar="#toolbar"
        striped="false" pagelist="[10,30,50]"
        selectoncheck="true" checkonselect="true" remoteSort="false" multiSort="true">
        <thead>
            <tr>
                <th field="ck" checkbox="true"></th>
                <th field="id" width="10"  hidden="true" >id</th>
                <th field="PatientId" width="10%" sortable="true">��ʶ��</th>
                <th field="InpNO" width="10%" sortable="true">סԺ��</th>
                <th field="VisitId" width="10%" sortable="true">�����</th>
                <th field="Name" width="10%" sortable="true">����</th>
                <th field="NamePhonetic" width="100"  hidden="true">����ƴ��</th>
                <th field="DateOfBirth" width="100"  hidden="true">��������</th>
                <th field="DateOfAge" width="30">����</th>
                <th field="BirthPlace" width="100"  hidden="true">����������</th>
                <th field="Citizenship" width="100"  hidden="true">���Ҽ��</th>
                <th field="Nation" width="100"  hidden="true">����</th>
                <th field="IDNO" width="100" " hidden="true" >���֤��</th>
                <th field="Identity" width="100"  hidden="true">���߹������</th>
                <th field="ChargeType" width="100"  hidden="true">�����շ����</th>
                <th field="MailingAddress" width="100"  hidden="true">����ͨ�ŵ�ַ</th>
                <th field="ZipCode" width="100"  hidden="true">��������</th>
                <th field="PhoneNumberHome" width="100"  hidden="true">��ͥ�绰����</th>
                <th field="PhoneNumbeBusiness" width="100"  hidden="true">��λ�绰����</th>
                <th field="NextOfKin" width="100" hidden="true">��������</th>
                <th field="RelationShip" width="100"  hidden="true">������ϵ</th>
                <th field="NextOfKinAddr" width="100" hidden="true">��ϵ�˵�ַ</th>
                <th field="NextOfKinZipCode" width="100" hidden="true">��ϵ����������</th>
                <th field="NextOfKinPhome" width="100" hidden="true">��ϵ�˵绰����</th>
                <th field="DeptCode" width="10%" sortable="true"  hidden="true">���Ҵ���@����</th>
                <th field="DeptCodeName" width="10%" sortable="true">��������</th>
                <th field="BedNO" width="100" hidden="true">������ס����</th>
                <th field="AdmissionDateTime" width="100" hidden="true">��Ժ���ڼ�ʱ��</th>
                <th field="DoctorInCharge" width="100" hidden="true">����ҽ������@����</th>
                <th field="ScheduleId" width="40">����id��</th>
                <th field="DiagBeforeOperation"width="14%" sortable="true">��Ҫ���</th>
                <th field="ScheduledDateTime" width="100" hidden="true">ԤԼ���иô����������ڼ�ʱ��</th>
                <th field="KeepSpecimenSign" width="5%" sortable="true">�Ƿ����걾</th>
                <th field="OperatingRoom" width="100" hidden="true">�����Ҵ���@����</th>
                <th field="Surgeon" width="100" hidden="true">����ҽʦ����@����</th>
                <th field="ResultContent" width="100" hidden="true">�ֲ�ʷ</th>
                <th field="InPatPreillness" width="100" hidden="true">�ֲ�ʷ</th>
                <th field="InPatPastillness" width="100" hidden="true">����ʷ</th>
                <th field="InPatFamillness" width="100" hidden="true">����ʷ</th>
                <th field="LabInfo" width="10%" sortable="true">�Ҹε����Խ��</th>
                <th field="Sex" width="5%" >�Ա�</th>
            </tr>
        </thead>
    </table>

    <!--toolbar��������datagrid��toolbar�Զ�������-->
    <div id="toolbar">
        <table style="width: 100%;">
            <tr>
                <!--button��ť������-->
                <td style="text-align: right;"></td>
            </tr>
        </table>
    </div>

    <!--diaglog���ڣ����ڱ༭����-->
    <div id="dlg" class="easyui-dialog" closed="true"></div>
    <div id="dd"></div>
    <script type="text/javascript">
        $(function () {
            //��˫�����¼�
            $('#OPListForSpecimen').datagrid({
                onDblClickRow: function (rowIndex, rowData) {
                    showData(rowData);
                }
            });
            //���������¼�
            $("#OPListForSpecimen").datagrid({
                onSortColumn: function (sort, order) {
                    sortData(sort, order);
                }
            })
        })

        function PagePaging(loaddata) {
            for (var i = 0; i < loaddata.length; i++) {
                var text = loaddata[i].DeptCode.split("-");
                loaddata[i].DeptCodeName = text[1];
                var age = 0
                if (loaddata[i].DateOfBirth != "") {
                    var old = new Date(loaddata[i].DateOfBirth);
                    var now = new Date();
                    if (now.getTime() > old.getTime()) {
                        age = now.getFullYear() - old.getFullYear();
                    }
                }
                loaddata[i].DateOfAge = age.toString();
            }
            $("#OPListForSpecimen").datagrid({
                data: loaddata.slice(0, 10)
            });
            var pager = $("#OPListForSpecimen").datagrid("getPager");
            pager.pagination({
                total: loaddata.length,
                onSelectPage: function (pageNo, pageSize) {
                    var start = (pageNo - 1) * pageSize;
                    var end = start + pageSize;
                    $("#OPListForSpecimen").datagrid("loadData", loaddata.slice(start, end));
                    pager.pagination('refresh', {
                        total: loaddata.length,
                        pageNumber: pageNo
                    });
                }
            });
        }

        function sortData(sort, order) {
            //alert('����Ҫд...'+sort+':'+order);
        }
        var url;

        function showData(rowData) {
            if (!rowData) { $.messager.alert('��ʾ', '���������Ƿ���ڣ�', 'error'); }
            else {
                $('#dd').window({
                    title: '��ϸ����ҳ��',
                    width: 800,
                    height: 500,
                    modal: true,
                    href: 'OPListForSpecimen/OPListForSpecimen_info.aspx',
                    onLoad: function () {
                        //var basedata = $.parseJSON(rowData);
                        //$("#frmAjax").form("load", basedata);
                        $("#frmAjax").form("load", rowData);
                    }
                });
            }
        }
        /*�鿴����*/
        function infoForm() {
            var rows = $('#datagrid').datagrid('getSelections');
            if (rows.length > 0) {
                if (rows.length == 1) {
                    var row = $('#datagrid').datagrid('getSelected');
                    $('#dlg').dialog({
                        title: 'OPListForSpecimen-�鿴����',
                        width: 650,
                        height: 450,
                        closed: false,
                        cache: true,
                        href: 'OPListForSpecimen_info.aspx?mode=inf&pk=' + row.id
                    });
                } else {
                    $.messager.alert('����', '�鿴����ֻ��ѡ��һ������', 'warning');
                }
            } else {
                $.messager.alert('����', '��ѡ������', 'warning');
            }
        }

        /*�޸�����*/
        function editForm() {
            var rows = $('#datagrid').datagrid('getSelections');
            if (rows.length > 0) {
                if (rows.length == 1) {
                    var row = $('#datagrid').datagrid('getSelected');
                    $('#dlg').dialog({
                        title: 'OPListForSpecimen-�޸�����',
                        width: 650,
                        height: 450,
                        closed: false,
                        cache: true,
                        href: 'OPListForSpecimen_info.aspx?mode=upd&pk=' + row.id
                    });
                } else {
                    $.messager.alert('����', '�޸Ĳ���ֻ��ѡ��һ������', 'warning');
                }
            } else {
                $.messager.alert('����', '��ѡ������', 'warning');
            }
        }

        /*ɾ��ѡ������,������¼PK���������ö���,�ֿ�*/
        function destroy() {
            var rows = $('#datagrid').datagrid('getSelections');
            if (rows.length > 0) {
                var pkSelect = "";
                for (var i = 0; i < rows.length; i++) {
                    row = rows[i];
                    if (i == 0) {
                        pkSelect += row.id;
                    } else {
                        pkSelect += ',' + row.id;
                    }
                }
                $.messager.confirm('��ʾ', '�Ƿ�ȷ��ɾ�����ݣ�', function (r) {
                    if (r) {
                        $.post('OPListForSpecimen_handler.ashx?mode=del&pk=' + pkSelect, function (result) {
                            if (result.success) {
                                $.messager.alert('��ʾ', result.msg, 'info', function () {
                                    $('#datagrid').datagrid('reload');    //���¼���������
                                });
                            } else {
                                $.messager.alert('����', result.msg, 'warning');
                            }
                        }, 'json');
                    }
                });
            } else {
                $.messager.alert('����', '��ѡ������', 'warning');
            }
        }

        /*��ѯ������������*/
        function getSearchParm() {
            //������������׷�Ӳ�������
            /*comboboxֵ��ȡ����,��������������ѯ�������*/
            //var v_so_�ֶ����� = $('#so_�ֶ�����').combobox('getValue');
            var v_parm
            var v_so_keywords = $('#so_keywords').searchbox('getValue');
            v_parm = 'so_keywords=' + escape(v_so_keywords);
            return v_parm;
        }

        /*��ѯ����*/
        function searchData() {
            /*��˵���Excel����������������datagrid����load�������ز�����ֱ����URL���ݲ���*/
            var Parm = getSearchParm();//��ò�ѯ����������������URL���ݲ�ѯ����
            var QryUrl = 'OPListForSpecimen_handler.ashx?mode=qry&' + Parm;
            $('#datagrid').datagrid({ url: QryUrl });
        }
        /*�ر�dialog���¼���datagrid����*/
        $('#dlg').dialog({
            onClose: function () {
                $('#datagrid').datagrid('reload'); //���¼���������
            }
        });

    </script>

</body>
</html>
