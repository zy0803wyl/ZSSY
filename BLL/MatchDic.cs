using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RuRo.BLL
{
    public class MatchDic
    {
        public static Dictionary<string, string> Match_For_SampleSource()
        {
            Dictionary<string, string> Match_For_SampleSource = new Dictionary<string, string>();
            Match_For_SampleSource.Add("唯一标识号", "PatientId");
            Match_For_SampleSource.Add("住院号", "InpNO");
            Match_For_SampleSource.Add("就诊号", "VisitId");
            Match_For_SampleSource.Add("姓名", "Name");
            Match_For_SampleSource.Add("姓名拼音", "NamePhonetic");
            Match_For_SampleSource.Add("性别", "Sex");
            Match_For_SampleSource.Add("出生日期", "DateOfBirth");
            Match_For_SampleSource.Add("年龄", "DateOfAge");
            Match_For_SampleSource.Add("行政区名称", "BirthPlace");
            Match_For_SampleSource.Add("国家简称", "Citizenship");
            Match_For_SampleSource.Add("名族", "Nation");
            Match_For_SampleSource.Add("身份证号", "IDNO");
            Match_For_SampleSource.Add("工作身份", "Identity");
            Match_For_SampleSource.Add("收费类别", "ChargeType");
            Match_For_SampleSource.Add("永久通信地址", "MailingAddress");
            Match_For_SampleSource.Add("邮政编码", "ZipCode");
            Match_For_SampleSource.Add("家庭电话号码", "PhoneNumberHome");
            Match_For_SampleSource.Add("单位电话号码", "PhoneNumbeBusiness");
            Match_For_SampleSource.Add("亲属姓名", "NextOfKin");
            Match_For_SampleSource.Add("亲属关系", "RelationShip");
            Match_For_SampleSource.Add("联系人地址", "NextOfKinAddr");
            Match_For_SampleSource.Add("联系人邮政编码", "NextOfKinZipCode");
            Match_For_SampleSource.Add("联系人电话号码", "NextOfKinPhome");
            Match_For_SampleSource.Add("当前科室代码@名称", "DeptCode");
            Match_For_SampleSource.Add("病人所住床号", "BedNO");
            Match_For_SampleSource.Add("入院日期及时间", "AdmissionDateTime");
            Match_For_SampleSource.Add("主治医生工号@姓名", "DoctorInCharge");
            Match_For_SampleSource.Add("手术id号", "ScheduleId");
            Match_For_SampleSource.Add("主要诊断", "DiagBeforeOperation");
            Match_For_SampleSource.Add("预约进行该次手术的日期及时间", "ScheduledDateTime");
            Match_For_SampleSource.Add("手术室代码@名称", "OperatingRoom");
            Match_For_SampleSource.Add("手术医师工号@姓名", "Surgeon");
            Match_For_SampleSource.Add("现病史", "InPatPreillness");
            Match_For_SampleSource.Add("既往史", "InPatPastillness");
            Match_For_SampleSource.Add("家族史", "InPatFamillness");
            Match_For_SampleSource.Add("病例id", "PathologyId");
            Match_For_SampleSource.Add("病理结果", "ResultContent");
            Match_For_SampleSource.Add("申请科室", "ApplyDept");
            Match_For_SampleSource.Add("报告日期", "ReportDateTime");
            return Match_For_SampleSource;
        }
    }
}
