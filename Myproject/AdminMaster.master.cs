using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERNAME"] != null)
        {
            UserStatus.Visible = true;
            Label1.Text = Session["USERNAME"].ToString();
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    protected void BtAdminLogout_Click(object sender, EventArgs e)
    {
        Session["USERNAME"] = null;
        UserStatus.Visible = false;
        Label1.Text = "未登录";
        Response.Redirect("~/Default.aspx");
    }
}
