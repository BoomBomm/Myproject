using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["USERNAME"] != null)
        {
            btnSignOut.Visible = true;
            btnSignin.Visible = false;
            btnSignup.Visible = false;
            UserStatus.Visible = true;
            Label1.Text = Session["USERNAME"].ToString();
        }
        else
        {
            btnSignOut.Visible = false;
            btnSignin.Visible = true;
            btnSignup.Visible = true;
            UserStatus.Visible = true;
            Label1.Text = "未登录";
        }
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session["USERNAME"] = null;
        Label1.Text = "未登录";
        Response.Redirect("~/Default.aspx");
    }

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SignIn.aspx");
    }
}
