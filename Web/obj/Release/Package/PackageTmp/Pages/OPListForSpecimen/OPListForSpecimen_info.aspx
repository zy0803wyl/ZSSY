<!--���������ɿƷ�EasyUi����������v3.5(build 20140519)��������������,��Ѱ��Զ����Ӱ�Ȩע��,�뱣����Ȩ��Ϣ�����������Ͷ��ɹ��������и��õĽ����뷢�����䣺843330160@qq.com-->
<!--�༭��form��datagrid�б����ݷֱ��������������aspxҳ����-->
<!--formҳ��:OPListForSpecimen_info.aspx-->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OPListForSpecimen_info.aspx.cs" Inherits="RuRo.OPListForSpecimen_info" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head">
    <title>������ƷԴ</title>
    <link rel="stylesheet" type="text/css" href="../../include/jquery-easyui-1.4.3/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../../include/jquery-easyui-1.4.3/themes/icon.css" />
    <script type="text/javascript" src="../../include/jquery-easyui-1.4.3/jquery.min.js"></script>
    <script type="text/javascript" src="../../include/jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../../include/jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
    <link href="../../include/css/kfmis.css" rel="stylesheet" />
    <script type="text/javascript" src="../../include/js/page.js"></script>
    <script type="text/javascript" src="../../include/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../../include/js/default.js"></script>
</head>
<body>
    <!--�洢��������input�ؼ����ж������������޸�-->
    <input value="" id="mode" type="text" style="display: none" runat="server" />
    <input value="" id="pk" type="text" style="display: none" runat="server" />
    <!--�༭����-->
    <!--�༭��������ť�̶��ڵײ�-->
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'center',split:true" style="width: 100px; padding: 10px">
            <div id="printBody">
                <%--<div class="ftitle">OPListForSpecimen</div>--%>
                <form id="frmAjax" method="post" novalidate>
                    <!--������Ʊ��ؼ�Ϊ�����������class="easyui-validatebox" required="true" -->
                    <div class="fitem" style="display: none">
                        <div class="label">id:</div>
                        <div class="control">
                            <input id="id" name="id" disabled="disabled" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����Ψһ��ʶ��:</div>
                        <div class="control">
                            <input id="PatientId" name="PatientId" data-options="required:true" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">סԺ��:</div>
                        <div class="control">
                            <input id="InpNO" name="InpNO" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">�����:</div>
                        <div class="control">
                            <input id="VisitId" name="VisitId" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">���֤��:</div>
                        <div class="control">
                            <input id="IDNO" name="IDNO" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����:</div>
                        <div class="control">
                            <input id="Name" name="Name" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����ƴ��:</div>
                        <div class="control">
                            <input id="NamePhonetic" name="NamePhonetic" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">�Ա�:</div>
                        <div class="control">
                            <input id="Sex" name="Sex" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">��������:</div>
                        <div class="control">
                            <input id="DateOfBirth" name="DateOfBirth" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����:</div>
                        <div class="control">
                            <input id="DateOfAge" name="DateOfAge" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����������:</div>
                        <div class="control">
                            <input id="BirthPlace" name="BirthPlace" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">���Ҽ��:</div>
                        <div class="control">
                            <input id="Citizenship" name="Citizenship" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����:</div>
                        <div class="control">
                            <input id="Nation" name="Nation" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">���߹������:</div>
                        <div class="control">
                            <input id="Identity" name="Identity" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">�����շ����:</div>
                        <div class="control">
                            <input id="ChargeType" name="ChargeType" />
                        </div>
                    </div>

                    <div class="fitem">
                        <div class="label">��������:</div>
                        <div class="control">
                            <input id="ZipCode" name="ZipCode" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">��ͥ�绰����:</div>
                        <div class="control">
                            <input id="PhoneNumberHome" name="PhoneNumberHome" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">��λ�绰����:</div>
                        <div class="control">
                            <input id="PhoneNumbeBusiness" name="PhoneNumbeBusiness" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">��������:</div>
                        <div class="control">
                            <input id="NextOfKin" name="NextOfKin" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">������ϵ:</div>
                        <div class="control">
                            <input id="RelationShip" name="RelationShip" />
                        </div>
                    </div>

                    <div class="fitem">
                        <div class="label">��ϵ����������:</div>
                        <div class="control">
                            <input id="NextOfKinZipCode" name="NextOfKinZipCode" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">��ϵ�˵绰����:</div>
                        <div class="control">
                            <input id="NextOfKinPhome" name="NextOfKinPhome" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">��ǰ���Ҵ���@����:</div>
                        <div class="control">
                            <input id="DeptCode" name="DeptCode" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">������ס����:</div>
                        <div class="control">
                            <input id="BedNO" name="BedNO" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">��Ժ���ڼ�ʱ��:</div>
                        <div class="control">
                            <input id="AdmissionDateTime" name="AdmissionDateTime" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����ҽ������@����:</div>
                        <div class="control">
                            <input id="DoctorInCharge" name="DoctorInCharge" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����id��:</div>
                        <div class="control">
                            <input id="ScheduleId" name="ScheduleId" />
                        </div>
                    </div>

                    <div class="fitem">
                        <div class="label">���������ڼ�ʱ��:</div>
                        <div class="control">
                            <input id="ScheduledDateTime" name="ScheduledDateTime" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">�Ƿ����걾:</div>
                        <div class="control">
                            <input id="KeepSpecimenSign" name="KeepSpecimenSign" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">�����Ҵ���@����:</div>
                        <div class="control">
                            <input id="OperatingRoom" name="OperatingRoom" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����ҽʦ����@����:</div>
                        <div class="control">
                            <input id="Surgeon" name="Surgeon" />
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">�Ҹ�÷�������Խ��:</div>
                        <div class="control">
                            <textarea id="LabInfo" name="LabInfo"></textarea>
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">��Ҫ���:</div>
                        <div class="control">
                            <textarea id="DiagBeforeOperation" name="DiagBeforeOperation"></textarea>
                        </div>
                    </div>
                     <div class="fitem">
                        <div class="label">�������:</div>
                        <div class="control">
                            <textarea id="ResultContent" name="ResultContent"></textarea>
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">�ֲ�ʷ:</div>
                        <div class="control">
                            <textarea id="InPatPreillness" name="InPatPreillness"></textarea>
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����ʷ:</div>
                        <div class="control">
                            <textarea id="InPatPastillness" name="InPatPastillness"></textarea>
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����ʷ:</div>
                        <div class="control">
                            <textarea id="InPatFamillness" name="InPatFamillness"></textarea>
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">��ϵ�˵�ַ:</div>
                        <div class="control">
                            <textarea id="NextOfKinAddr" name="NextOfKinAddr"></textarea>
                        </div>
                    </div>
                    <div class="fitem">
                        <div class="label">����ͨ�ŵ�ַ:</div>
                        <div class="control">
                            <textarea id="MailingAddress" name="MailingAddress"></textarea>
                        </div>
                    </div>
                   
                </form>
                <div class="ftitle"></div>
            </div>
        </div>
        <div data-options="region:'south'" style="height: 40px; background: #f2f2f2;">
            <!--��ť-->
            <div class="fsubmit">
                <%--��ƷԴ����ѡ��--%>
                <td style="width: 100px;">��ƷԴ����:</td>
                <input class="easyui-combobox" name="sampleSourceType" id="sampleSourceType" data-options="required:true,multiple:false,panelHeight: 'auto',prompt:'��ѡ����ƷԴ����'" />
                <a href="javascript:void(0)" id="linkbuttonSave" class="easyui-linkbutton" iconcls="icon-ok" onclick="saveForm()">����</a>
                <a href="javascript:void(0)" id="linkbuttonClear" class="easyui-linkbutton" iconcls="icon-back" onclick="clearForm();">���</a>
                <%--                <a href="javascript:void(0)" id="linkbuttonColse" class="easyui-linkbutton" iconcls="icon-cancel" onclick="$('#dlg').dialog('close');">�ر�</a>--%>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        ////�������
        //$(function ()
        //{
        //    alert(GetQueryString('basedata'));
        //    //alert(getdata);
        //    //var jsonData = $.parseJSON(data);
        //    //$("#frmAjax").form("load", jsonData);
        //})

        //��sampleSourceType�������ֵ
        $(function () {
            $('#sampleSourceType').combobox({
                editable: false,
                method: 'get',
                valueField: 'value',
                textField: 'text',
                url: '../../Fp_Ajax/PageConData.aspx?conMarc=ssType',
                panelHeight: 'auto',
                onChange: In_SSTypeChange
                //selectOnNavigation:$(this).is(':checked'),
                //onLoadSuccess: function (data) { //���ݼ�������¼�
                //    if (data) {
                //       // $('#sampleSourceType').combobox('setValue', data);
                //        //�����ݵ�ҳ��
                //    }
                //}
            })
        })

        function In_SSTypeChange() {
            var username = $.cookie('username');
            var ssType = $('#sampleSourceType').combobox('getValue');
            //���cookie
            $.cookie(username + "sampleSourceType", null);
            //��дcookie
            $.cookie(username + 'sampleSourceType', ssType, { expires: 7 });
        }

        /*��ճ���*/
        function clearForm() {
            $('#frmAjax').form('clear');
        }
        /*���������*/
        function saveForm() {
            //var frmAjax = $("#frmAjax").serializeArray();
            //var Tem;
            //if (frmAjax) { Tem = JSON.stringify(frmAjax); } else {
            //    return;
            //}
            var Parm = $('#frmAjax').serialize();
            var PatientId = $('#PatientId').val();
            var sampleSourceType = $('#sampleSourceType').combobox('getText');
            if (isEmptyStr(PatientId)) {
                ShowMsg("����Ψһ��Ϊ��"); return;
            }
            if (isEmptyStr(sampleSourceType)) {
                ShowMsg("��ѡ����ƷԴ����"); return;
            }
            var count = Math.random();
            var url = "../../Sever/OPListForSpecimen_handler.ashx" + "?count" + count;
            ajaxLoading();
            //$.ajax({
            //    type: "POST",
            //    url: "../../Sever/OPListForSpecimen_handler.ashx" + "?count" + count,
            //    data: {
            //        "mode": "ins",
            //        //"Parm": Parm,
            //        "pId": PatientId,
            //        "ssType": sampleSourceType
            //    },
            //    success: function (response) {
            //        ajaxLoadEnd();
            //        if (response) {
            //            var res = JSON.parse(response);
            //            if (res.success || res.message.indexOf('should be unique.') > -1) {
            //                ShowMsg("������Ϣ��" + "����ɹ�" + res.message);
            //            } else {
            //                ShowMsg("������Ϣ��" + "����ʧ��" + res.message);
            //            }
            //        }
            //        else { $.messager.alert('��ʾ', '��ѯ������ƷԴ', 'error'); }
            //    }
            //});
            $('#frmAjax').form('submit', {
                url: url,
                onSubmit: function (param) {
                    param.mode = 'ins';
                    param.pId = PatientId;
                    param.ssType = sampleSourceType;
                },
                success: function (response) {
                    ajaxLoadEnd();
                    if (response) {
                        try {
                            var res = JSON.parse(response);
                            if (res.success || res.message.indexOf('should be unique.') > -1) {
                                ShowMsg("������Ϣ��" + "����ɹ�" + res.message);
                            } else {
                                ShowMsg("������Ϣ��" + "����ʧ��" + res.message);
                            }
                        } catch (e) {
                            $.messager.alert('��ʾ', '������Ϣ�������ֶ����', 'error');
                        }
                        
                    }
                    else { $.messager.alert('��ʾ', '��ѯ������ƷԴ', 'error'); }
                }
            });
            ajaxLoadEnd();
        }
    </script>

</body>
</html>
