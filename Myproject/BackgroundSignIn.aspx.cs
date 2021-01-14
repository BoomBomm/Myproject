using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackgroundSignIn : System.Web.UI.Page
{
    Operation operation = new Operation();
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        using (DataTable dt = operation.SelectSignIn("select * from T_power where name='" + UserName.Text + "' and pwd='" + Password.Text + "'"))
        {

            if (dt.Rows.Count != 0)
            {
                Session["ROOTID"] = dt.Rows[0]["pid"].ToString();

                Session["ROOTNAME"] = UserName.Text;
                Response.Redirect("~/Background.aspx");


            }
            else
            {
                lblError.Text = "Invalid Username or Password !";
            }
        }
    }
}