﻿using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Data.Entity;
using Model;
using RuRo.Model;
using System.Data;
using System.Data.SqlClient;
namespace DAL
{
    /// <summary>
    /// fp扩展系统扩展数据库操作类
    /// 1、保存导入数据记录（包括样本源）
    /// 2、回发数据给His的记录
    /// 3、判断数据是否需要回发
    /// </summary>
    public class FpExtendDatabaseHelper
    {

        //FpExtendEntities fpExtendEntities = new FpExtendEntities();
        //01.样本源数据记录（包括样本源）——此数据数据库中只保存30天
        //a、读取——查询导入记录
        //b、写入——保存数据到数据库
        //02.回发数据记录
        //a、SpecimenRtLog执行回发的数据、回发之后的状态
        //b、SpecimenRt保存回发成功的完整样本信息数据
        //c、SpecimenRtLog保存有当前用户最后一次执行回发的日期——读取当前用户最后一次回发的日期

        #region 添加回发记录
        /// <summary>
        /// 添加回发记录
        /// </summary>
        /// <param name="specimenRtLog">回发记录</param>
        public bool AddToSpecimenRtLog(SpecimenRtLog specimenRtLog)
        {
            try
            {
                using (FpExtendEntities fpExtendEntities = new FpExtendEntities())
                {
                    fpExtendEntities.SpecimenRtLog.Add(specimenRtLog);
                    fpExtendEntities.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region 根据用户名查询此用户最后一次回发的时间DateTime + public DateTime GetSpecimenRtLogLastPostBackDate(string specimenRtLogUserName)
        /// <summary>
        /// 根据用户名查询此用户最后一次回发的时间DateTime
        /// </summary>
        /// <param name="specimenRtLogUserName">当前用户名</param>
        /// <returns>最后回发时间</returns>
        public DateTime GetSpecimenRtLogLastPostBackDate(string specimenRtLogUserName)
        {
            //查询当前用户最后一次添加纪录的时间（当前用户时间最大项）
            DateTime date = new DateTime();
            using (FpExtendEntities fpExtendEntities = new FpExtendEntities())
            {
                SpecimenRtLog specimenRtLog = fpExtendEntities.SpecimenRtLog.Where<SpecimenRtLog>(a => a.username == specimenRtLogUserName).OrderByDescending(a => a.PostBackDate).First<SpecimenRtLog>();
                date = specimenRtLog.PostBackDate.Value;
            }
            return date;
        }

        public DateTime GetSpecimenRtLogLastPostBackforDate(string username) 
        {
            string sqlstr = "SELECT TOP 1 PostBackDate  FROM SpecimenRtLog WHERE username='" + username + "'ORDER BY PostBackDate desc";
            DateTime dt=(DateTime)Maticsoft.DBUtility.DbHelperSQL.GetSingle(sqlstr);
            return dt;
        }
        public DataSet GetSpecimenRtLogGetdata(string username)
        {
            string sqlstr = "SELECT TOP 300 *  FROM SpecimenRtLog WHERE username='" + username + "'ORDER BY id desc";
            DataSet ds = Maticsoft.DBUtility.DbHelperSQL.Query(sqlstr);
            return ds;
        }

        #endregion

        #region  添加SpecimenRt +  public void AddToSpecimenRt(SpecimenRt specimenRt)
        /// 添加SpecimenRt
        /// </summary>
        /// <param name="specimenRt">回发数据完整信息</param>
        public bool AddToSpecimenRt(SpecimenRt specimenRt)
        {
            try
            {
                using (FpExtendEntities fpExtendEntities = new FpExtendEntities())
                {
                    fpExtendEntities.SpecimenRt.Add(specimenRt);
                    fpExtendEntities.SaveChanges();//执行保存操作
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        #endregion

        #region 更新SpecimenRt +  public void UpdateToSpecimenRt(SpecimenRt specimenRt)
        /// <summary>
        /// 更新SpecimenRt
        /// </summary>
        /// <param name="specimenRt">需要更新的SpecimenRt</param>
        public bool UpdateToSpecimenRt(SpecimenRt specimenRt)
        {
            try
            {
                using (FpExtendEntities fpExtendEntities = new FpExtendEntities())
                {
                    SpecimenRt s = fpExtendEntities.SpecimenRt.Where(a => a.SampleId == specimenRt.SampleId).FirstOrDefault();
                    s.OtherInfo = specimenRt.OtherInfo;
                    s.PatientId = specimenRt.PatientId;
                    s.PatientName = specimenRt.PatientName;
                    s.SampleName = specimenRt.SampleName;
                    s.VisitId = specimenRt.VisitId;
                    fpExtendEntities.SaveChanges();//执行更新操作
                    return true;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        #endregion

        #region 根据样本Id查询数据库中是否存在当前id的样本 + public SpecimenRt SelectSpecimenRtBySampleId(string SampleId)
        /// <summary>
        /// 根据样本Id查询数据库中是否存在当前id的样本
        /// </summary>
        /// <param name="SampleId">样本id</param>
        /// <returns>返回根据当前id查询到的数据的第一个（只可能最多一个）</returns>
        public SpecimenRt SelectSpecimenRtBySampleId(string SampleId)
        {
            using (FpExtendEntities fpExtendEntities = new FpExtendEntities())
            {
                SpecimenRt specimenRt = fpExtendEntities.SpecimenRt.Where(a => a.SampleId == SampleId).FirstOrDefault();
                return specimenRt;
            }
        }
        #endregion
    }
}
