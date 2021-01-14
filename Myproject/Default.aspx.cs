using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //验证是否登录
        if (Session["USERNAME"] != null)
        {
            btnSignup.Visible = false;
            btnSignin.Visible = false;
            btnSignOut.Visible = true;
            UserStatus.Visible = true;
            Label1.Text = Session["USERNAME"].ToString();
        }
        else
        {
            btnSignup.Visible = true;
            btnSignin.Visible = true;
            btnSignOut.Visible = false;
            UserStatus.Visible = false;
            Label1.Text = "未登录";

        }
    }
    /// <summary>
    /// 退出登录
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session["USERNAME"] = null;
        UserStatus.Visible = false;
        Label1.Text = "未登录";
        Response.Redirect("~/Default.aspx");
    }
}