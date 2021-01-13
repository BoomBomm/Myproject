using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Background : System.Web.UI.Page
{
    //业务类对象
    //绑定页面数据的全局变量
    Operation operation = new Operation();
    //string infoType = "";
    protected DataRowCollection drs = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["ROOTNAME"] == null)
        {
            Response.Redirect("BackgroundSignIn.aspx");
        }
        //infoType = Request.QueryString["id"];
        string opearID = null, opearCheckState = null;
        if ((opearID = Request.Form["opearID"]) != null && opearID != "")
        {
            opearCheckState = Request.Form["opearCheckState"];
            if (opearCheckState != "")
            {
                ChangeCheckState(int.Parse(opearID), opearCheckState);
                DataBind(Convert.ToInt32(this.CurPageIndex.Text));

            }
            else
            {
                Response.Redirect("BackgroundDetail.aspx?id=" + opearID);
            }
        }
        if (!IsPostBack)
        {
            DataBind(1);
        }
    }
    /// <summary>
    /// 绑定供求信息到GridViev控件
    /// </summary>
    /// <param name="type">供求信息类别</param>
    public void DataBind(int PageIndex)
    {
        int PageSize = 10;
        DataSet ds = operation.SelectInfo(PageIndex, PageSize);
        if (ds != null && ds.Tables.Count > 0)
        {
            int Count = 0;
            int.TryParse(ds.Tables[0].Rows[0][0].ToString(), out Count);
            drs = ds.Tables[1].Rows;
            int GetTotalPageIndex = (Count / PageSize) + ((Count % PageSize) > 0 ? 1 : 0);
            this.TotalPageIndex.Text = GetTotalPageIndex.ToString();
            this.CurPageIndex.Text = PageIndex.ToString();
            if (PageIndex == 1 && PageIndex == GetTotalPageIndex)
            {
                SetPageState(0);
            }
            else if (PageIndex == 1)
            {
                SetPageState(1);
            }
            else if (PageIndex == GetTotalPageIndex)
            {
                SetPageState(2);
            }
            else
            {
                SetPageState(3);
            }
        }
    }
    /// <summary>
    /// 上一页处理方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void UpPage_Click(object sender, EventArgs e)
    {
        int CurIndex = Convert.ToInt32(this.CurPageIndex.Text);
        CurIndex--;
        DataBind(CurIndex);
    }

    /// <summary>
    /// 下一页处理方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void DownPage_Click(object sender, EventArgs e)
    {
        int CurIndex = Convert.ToInt32(this.CurPageIndex.Text);
        CurIndex++;
        DataBind(CurIndex);
    }
    /// <summary>
    /// 设置分页样式
    /// </summary>
    /// <param name="SetIndex"></param>
    public void SetPageState(int SetIndex)
    {
        //根据不同的页码设置不同的样式
        if (SetIndex == 0)
        {

            this.UpPage.Style["color"] = "#808080";
            this.DownPage.Style["color"] = "#808080";
        }
        else if (SetIndex == 1)
        {

            this.UpPage.Style["color"] = "#808080";
            this.DownPage.Style["color"] = "#23527c";
        }
        else if (SetIndex == 2)
        {

            this.UpPage.Style["color"] = "#23527c";
            this.DownPage.Style["color"] = "#808080";
        }
        else
        {

            this.UpPage.Style["color"] = "#23527c";
            this.DownPage.Style["color"] = "#23527c";
        }
    }
    protected void ChangeCheckState(int ChangeID, string CheckState)
    {
        if (CheckState == "1")
        {
            operation.UpdateInfo(ChangeID, true);
        }
        else
        {
            operation.UpdateInfo(ChangeID, false);
        }
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session["ROOTNAME"] = null;
        Response.Redirect("~/BackgroundSignIn.aspx");
    }
}