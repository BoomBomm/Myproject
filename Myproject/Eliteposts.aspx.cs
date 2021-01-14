using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Eliteposts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
        if (!IsPostBack)
        {
            bindElite();
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
    /// <summary>
    /// 页面数据绑定
    /// </summary>
    private void bindElite()
    {
        String CS = ConfigurationManager.ConnectionStrings["cartoon111ConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from T_post where iselite='1' and isaudit='1'", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataSet dt = new DataSet();
                    sda.Fill(dt);
                    DataList1.DataSource = dt;
                    DataList1.DataBind();
                }

            }
        }
    }
}