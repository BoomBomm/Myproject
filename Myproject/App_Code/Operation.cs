using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// Operation 网站业务流程类（封装所有业务方法）
/// </summary>
public class Operation
{
    public Operation()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    DataBase data = new DataBase();
    #region  查询供求信息

    /// <summary>
    /// 按类型进行分页查询供求信息
    /// </summary>
    /// <param name="type">供求信息类型</param>
    /// <param name="PageIndex">页面索引序号</param>
    /// <param name=" PageSize">每一页显示的记录数量</param>
    /// <param name="StartIndex">每一页显示的记录的起始索引序号</param>
    /// <param name="EndIndex">每一页显示的记录的终止索引序号</param>
    /// <returns>返回查询结果DataSet数据集</returns>
    public DataSet SelectInfo(int PageIndex, int PageSize)
    {
        int StartIndex = ((PageIndex - 1) * PageSize) + 1;
        int EndIndex = PageIndex * PageSize;
        return data.RunProcReturn("select count(1) from T_post;"+
            "select * from (SELECT tid, ftype, uid, subject, isaudit, addtime, Row_Number() over (ORDER BY addtime DESC) as rowIndex " +
            "From T_post join T_type on T_post.fid=T_type.fid) as Tab "+
            "where rowIndex between "+ StartIndex + " and "+ EndIndex,"T_post");
    }
    /// <summary>
    /// 后台查看详细信息界面
    /// </summary>
    /// <param name="id">帖子id</param>
    /// <returns></returns>
    public DataSet SelectBGDetail(int id)
    {
        return data.RunProcReturn(
            "select * from (SELECT tid,T_post.fid,image,ftype,subject,contant,addtime,uname " +
            "From (T_post join T_type on T_post.fid=T_type.fid) join T_user on T_post.uid=T_user.uid) as Tab " +
            "where tid="+id,"T_post");
    }
    #endregion
    #region  修改供求信息 
    /// <summary>
    /// 修改供求信息的审核状态
    /// </summary>
    /// <param name="id">信息ID</param>
    /// <param name="state">原来的信息状态</param>
    public void UpdateInfo(int id, bool state)
    {
        if (state==true)
        {
            data.RunProc("UPDATE T_post SET isaudit = '0' WHERE (tid=" + id + ")");
        }
        else
        {
            data.RunProc("UPDATE T_post SET isaudit = '1' WHERE (tid=" + id + ")");

        }



    }
    #endregion
    /// <summary>
    /// 发布信息选择框的绑定
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public DataTable SelectType(string str)
    {
        return data.RunProcReturnTable(str);
    }
    /// <summary>
    /// 登录认证
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public DataTable SelectSignIn(string str)
    {
        return data.RunProcReturnTable(str);
    }
}