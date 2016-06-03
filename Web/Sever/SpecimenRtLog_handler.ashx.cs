//���������ɿƷ�EasyUi����������v3.5(build 20140519)��������������,��Ѱ��Զ����Ӱ�Ȩע��,�뱣����Ȩ��Ϣ�����������Ͷ��ɹ��������и��õĽ����뷢�����䣺843330160@qq.com
using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Collections.Generic;
using System.Text;
using BLL;
namespace RuRo
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class SpecimenRtLog_handler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (context.Request["mode"] != null)
            {
                string mode = context.Request["mode"].ToString();
                switch (mode)
                { 
                    case "inf":/*��ѯʵ����*/
                        InfoData(context);
                        break;
                    case "ins":/*����*/
                        SaveData(context);
                        break;
                    case "upd":/*�޸�*/
                        SaveData(context);
                        break;
                    case "del":/*ɾ��*/
                        DeleteData(context);  
                        break;
                    case "qry":/*��ѯ*/
                        QueryData(context,false);
                        break;
                    case "exp":/*����*/
                        QueryData(context,true);
                        break;
                }
            }
            if (context.Request.Params["action"] == "respondhis")
            {
                StarRespond();
            }
        }

        public void StarRespond()
        {
            Respond respond = new Respond();
            respond.RespondHis();
        }


        /// <summary>
        /// ��ѯinfo����ʵ����
        /// </summary>
        /// <param name="context"></param>
        private static void InfoData(HttpContext context)
        {
            //BLL.SpecimenRtLog_BLL bll_SpecimenRtLog = new BLL.SpecimenRtLog_BLL();
            //Model.SpecimenRtLog model_SpecimenRtLog = new Model.SpecimenRtLog();
            //DataTable dt = new DataTable();
            //if (context.Request["pk"] != null)
            //{
            //    int pk = int.Parse(context.Request["pk"]);
            //    model_SpecimenRtLog = bll_SpecimenRtLog.GetModel(pk);
            //    bll_SpecimenRtLog.GetModel(ref dt, pk);
            //}
            //string strJson = JSONHelper.DataTable2Json(dt, true);
            //context.Response.Write(strJson);
        }

        /// <summary>
        /// ��������
        /// </summary>
        /// <param name="context"></param>
        private static void SaveData(HttpContext context)
        {
            //result rlt = new result(); 
            //try
            //{
            //    //��ȡ���淽ʽ
            //    string mode = context.Request["mode"].ToString();
            //    int strPk = 0;
            //    if (mode == "upd")
            //    {
            //        strPk = int.Parse(context.Request["pk"].ToString());
            //    }
            //    BLL.SpecimenRtLog_BLL bll_SpecimenRtLog = new BLL.SpecimenRtLog_BLL();
            //    Model.SpecimenRtLog model_SpecimenRtLog = new Model.SpecimenRtLog(); 
            //    #region ʵ���ำֵ
            //    if (mode == "ins")
            //    {
            //        //��������Max��ȡ����ע�������ֶγ���
            //        model_SpecimenRtLog._id = bll_SpecimenRtLog.GetMax_id();//������ֵ
            //    }

            //    if(context.Request["username"]!=null)
            //        model_SpecimenRtLog._username = context.Request["username"];

            //    if(context.Request["patiendid"]!=null)
            //        model_SpecimenRtLog._patiendid = context.Request["patiendid"];

            //    if(context.Request["sampleid"]!=null)
            //        model_SpecimenRtLog._sampleid = context.Request["sampleid"];

            //    if(context.Request["postbackstatus"]!=null)
            //        model_SpecimenRtLog._postbackstatus = context.Request["postbackstatus"];

            //    if(context.Request["postbackdate"]!=null)
            //        model_SpecimenRtLog._postbackdate = Convert.ToDateTime(context.Request["postbackdate"]);

            //    #endregion
            //    if (mode == "ins")
            //    {
            //        if (bll_SpecimenRtLog.Insert(model_SpecimenRtLog))
            //        {
            //            rlt.success = true;
            //            rlt.msg = "��������ɹ�";
            //        }
            //        else
            //        {
            //            rlt.success = false;
            //            rlt.msg = "��������ʧ��:" + DbError.getErrorMsg();
            //        }
            //    }

            //    if (mode == "upd")
            //    {
            //        if (bll_SpecimenRtLog.Update(model_SpecimenRtLog, strPk))
            //        {
            //            rlt.success = true;
            //            rlt.msg = "�޸ı���ɹ�";
            //        }
            //        else
            //        {
            //            rlt.success = false;
            //            rlt.msg = "�޸ı���ʧ��:" + DbError.getErrorMsg();
            //        }
            //    }
            //}
            //catch(Exception exception)
            //{
            //    rlt.success = false;
            //    rlt.msg = exception.Message;
            //}
            //context.Response.Write(JSONHelper.Convert2Json(rlt)); 
        }

        /// <summary>
        /// ɾ������
        /// </summary>
        /// <param name="context"></param>
        private static void DeleteData(HttpContext context)
        {
            //result rlt = new result();
            //if (context.Request["pk"] != null)
            //{
            //    string pk = context.Request["pk"];
            //    string[] ArrayPk = pk.Split(',');
            //    BLL.SpecimenRtLog_BLL bll_SpecimenRtLog = new BLL.SpecimenRtLog_BLL();
            //    int successNumber = 0;
            //    string  errorMessage = "";
            //    foreach (string strPk in ArrayPk)
            //    {
            //        if (bll_SpecimenRtLog.Delete(int.Parse(strPk)))
            //        {
            //            successNumber += 1;
            //        }
            //    }
            //    rlt.success = true;
            //    rlt.msg = "�ɹ�ɾ��[" + successNumber.ToString() + "/" + ArrayPk.Length.ToString() + "]������;" + errorMessage; 
            //}
            //else
            //{
            //    rlt.success = false;
            //    rlt.msg = "PK�ֶ�ΪNull";
            //}
            //context.Response.Write(JSONHelper.Convert2Json(rlt));
        }

        /// <summary>
        /// ��ѯ����
        /// </summary>
        /// <param name="context"></param>
        /// <param name="export">�Ƿ񵼳�Excel�ļ�</param>
        private static void QueryData(HttpContext context, bool export)
        {
            #region ��ȡJquery�ش�Server��ҳҳ���ÿҳ����
            //int page, rows;
            //if (context.Request["page"] != null)
            //    page = int.Parse(context.Request["page"]);
            //else
            //    page = 1;
            //if (context.Request["rows"] != null)
            //    rows = int.Parse(context.Request["rows"]);
            //else
            //    rows = 10;
            #endregion

            #region ��ȡJquery�ش���ѯ��������
            //string strWhere = " 1=1 ";
            //if (context.Request["so_keywords"] != null)
            //{
            //    string strKeywords = context.Request["so_keywords"];
            //    if (strKeywords.Length > 0)
            //    {
            //        strWhere += " and (";
            //        strWhere += " id like '%" + strKeywords + "%'";
            //        strWhere += " or username like '%" + strKeywords + "%'";
            //        strWhere += " or patiendid like '%" + strKeywords + "%'";
            //        strWhere += " or sampleid like '%" + strKeywords + "%'";
            //        strWhere += " or postbackstatus like '%" + strKeywords + "%'";
            //        strWhere += ")";
            //    }
            //}
            #endregion

            #region �ֶ�����
            //string sort = "id";
            //string order = "asc";
            //if (context.Request["sort"] != null)
            //    sort = context.Request["sort"];
            //if (context.Request["order"] != null)
            //    order = context.Request["order"];
            #endregion

            #region ��ҳ����
            //DataTable m_dtTable = new DataTable();
            //PageAction pageAction = new PageAction();
            //pageAction.CurPage = page;
            //pageAction.PageSize = rows;
            //pageAction.TabName = "SpecimenRtLog";
            //pageAction.Fields = "*";
            //pageAction.PkField = "id";
            //pageAction.Condition = strWhere;
            //pageAction.Sort = sort + " " + order;
            //DbHelper.FillDataTable(pageAction, m_dtTable); 
            #endregion 


            /*����󶨴�����KFEasyUiMaker���ݱ����ֶζ����Զ�����,���δ����������ܣ�
             ���������ݽ�������£��ɸ���ʵ���������Ϊ���Ȳ�����������ٱ�����ֵ��*/
            #region ���������б��������datagrid��ʾֵ
            //for (int i = 0; i < m_dtTable.Rows.Count; i++)
            //{
            //}

            #endregion 
            //if (export)
            //{
            //    DataTable export_dataTable = new DataTable();
            //    pageAction.Fields = "id as ������,username as �ط������ݵ��û�,patiendid as �ط��Ļ���Ψһ��ʶ,sampleid as �ط�������id,postbackstatus as �ط����״̬,postbackdate as �ط�ʱ��";
            //    DbHelper.GetTable(pageAction.Sql, ref export_dataTable);
            //    commExcel._ExportExcel(export_dataTable, "�ط����ݼ�¼�浵");
            //    result rlt = new result();
            //    rlt.success = true;
            //    rlt.msg = commExcel._Url("�ط����ݼ�¼�浵");
            //    context.Response.Write(JSONHelper.Convert2Json(rlt));
            //}
            //else
            //{
            //    string strJson = JSONHelper.CreateJsonParameters(m_dtTable, true, pageAction.RdCount);
            //    context.Response.Write(strJson);
            //}
            DataSet ds = Respond.GetSpecimenRtLogGetdata();
            string strJson = FpUtility.Fp_Common.FpJsonHelper.ObjectToJsonStr(ds);
            context.Response.Write(strJson);
        }
        /// <summary>
        /// FusionChartͳ��ͼ��ʽ���ַ���
        /// </summary>
        /// <param name="context"></param>
        private static void ChartData(HttpContext context)
        {
            //ͳ��ͼdome����==========================Begin
            //ͳ��ͼ�����ʵ��ҵ�����������SQLͳ��ʵ����ʵ������ʾ
            //string swf = "Column3D";
            //if (context.Request["swf"] != null)
            //    swf = context.Request["swf"];
            //StringBuilder xmlData = new StringBuilder();
            //xmlData.Append("<chart caption='IT��ҵ�������' subCaption='2014��' xAxisName='����' yAxisName='����' showValues='0' formatNumberScale='0' showBorder='1'  logoURL='/images/login_banquan.gif'  logoPosition='BR' logoAlpha='20'>");
            //xmlData.Append("<set label='�ɶ�' value='5120' />");
            //xmlData.Append("<set label='�Ϻ�' value='9800' />");
            //xmlData.Append("<set label='����' value='9800' />");
            //xmlData.Append("<set label='���' value='6300' />");
            //xmlData.Append("<set label='����' value='10080' />");
            //xmlData.Append("</chart>");
            //string ChartHtml = FusionCharts.RenderChartHTML("../js/FusionCharts/" + swf + ".swf","", xmlData.ToString(), "myChart", "600", "350", false);
            //result rlt = new result();
            //rlt.success = true;
            //rlt.msg = ChartHtml;
            //context.Response.Write(JSONHelper.Convert2Json(rlt));
            //ͳ��ͼdome����==========================End



//            string swf = "Column3D";
//            if (context.Request["swf"] != null)
//                swf = context.Request["swf"];
//            string strSql = @"select �ֶ���,count(*) records from specimenrtlog group by �ֶ���";
//            DataTable dt = new DataTable();
//            DbHelper.GetTable(strSql, ref dt);

//            StringBuilder xmlData = new StringBuilder();
//            xmlData.AppendFormat(@"<chart caption='{0}' 
//                                    subCaption='{1}' 
//                                    xAxisName='{2}' 
//                                    yAxisName='{3}' 
//                                    showValues='0' 
//                                    formatNumberScale='0' 
//                                    showBorder='1'  
//                                    logoURL='/images/login_banquan.gif'  
//                                    logoPosition='BR' 
//                                    logoAlpha='20'>",
//                                    "ͳ��ͼ","ͳ��ͼ������","X�������","����");
//            for (int i = 0; i < dt.Rows.Count; i++)
//            {
//                xmlData.AppendFormat("<set label='{0}' value='{1}' />",dt.Rows[i]["�ֶ���"],dt.Rows[i]["records"]);  
//            }
//            xmlData.Append("</chart>");
//            string ChartHtml = FusionCharts.RenderChartHTML("../js/FusionCharts/" + swf + ".swf","", xmlData.ToString(), "myChart", "600", "350", false);
//            result rlt = new result();
//            rlt.success = true;
//            rlt.msg = ChartHtml;
//            context.Response.Write(JSONHelper.Convert2Json(rlt));

        }

        #region JSONʵ�巵���ඨ��
        /// <summary>
        /// ʵ��Ajax������
        /// </summary>
        public class result
        {
            bool _success = false;
            string _msg = "";
            public bool success 
            {
                set { _success = value; }
                get { return _success; }
            }
            public string msg
            {
                set { _msg = value; }
                get { return _msg; } 
            }
        }
        #endregion
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}

