using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["tid"] != null)
        {
            if (!IsPostBack)
            {
                BindProductDetails();
                BindMessage();
            }
        }
        else
        {
            Response.Redirect("~/Products.aspx");
        }
    }
    /// <summary>
    /// 详细页面加载
    /// </summary>
    private void BindProductDetails()
    {
        Int64 tid = Convert.ToInt64(Request.QueryString["tid"]);

        String CS = ConfigurationManager.ConnectionStrings["cartoon111ConnectionString1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {
            using (SqlCommand cmd = new SqlCommand("select * from T_post where tid=" + tid + "", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProductDetails.DataSource = dt;
                    rptrProductDetails.DataBind();
                }

            }
            //观看次数自增
            using(SqlCommand cmd = new SqlCommand("update T_post set views=views+1 where tid ="+tid+"", con))
            {
                cmd.CommandType = CommandType.Text;
                con.Open();
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
            }
        }
    }
    /// <summary>
    /// 留言页面加载
    /// </summary>
    public void BindMessage()
    {
        Int64 tid = Convert.ToInt64(Request.QueryString["tid"]);
        String CS = ConfigurationManager.ConnectionStrings["cartoon111ConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);
        string sqlstr = "select*from T_message where tid = "+tid+"";
        SqlDataAdapter ad = new SqlDataAdapter(sqlstr, con);
        DataSet ds = new DataSet();
        con.Open();
        ad.Fill(ds);
        con.Close();
        DataList1.DataSource = ds.Tables[0].DefaultView;
        DataList1.DataBind();
    }

    /// <summary>
    /// 删除留言
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string mid = (((LinkButton)sender).CommandArgument.ToString()).ToString();
        String CS = ConfigurationManager.ConnectionStrings["cartoon111ConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);
        if (mid != "")
        {
            string sqlstr = "delete from T_message where mid=" + int.Parse(mid) + "";
            SqlCommand comm = new SqlCommand(sqlstr, con);
            con.Open();
            comm.ExecuteNonQuery();
            Response.Redirect("detail.aspx");
            comm.Dispose();
            con.Close();
        }
    }

    /// <summary>
    /// 回复留言
    /// </summary>
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string mid = (((LinkButton)sender).CommandArgument.ToString()).ToString();
        String CS = ConfigurationManager.ConnectionStrings["cartoon111ConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);
        if (mid != "")
        {
            string sqlstr = "update T_message set reply="+"1111"+" where mid=" + int.Parse(mid) + "";
            SqlCommand comm = new SqlCommand(sqlstr, con);
            con.Open();
            comm.ExecuteNonQuery();
            Response.Redirect("detail.aspx");
            comm.Dispose();
            con.Close();
        }
    }

    /// <summary>
    /// 发送留言
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Button1_Click(object sender, EventArgs e)
    {
        Int64 tid = Convert.ToInt64(Request.QueryString["tid"]);
        string str = text1.Value.ToString();
        string username = Session["USERNAME"].ToString();
        string email = Session["USEREMAIL"].ToString();
        string posttime = DateTime.Now.ToString();
        String CS = ConfigurationManager.ConnectionStrings["cartoon111ConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(CS);
        if (str != "" && username!="")
        {
            string sqlstr = "insert into T_message([tid],[username],[emali],[posttime],[content]) values("+tid+ ",'"+username+"','"+email+ "','"+posttime+ "','"+str+ "')";
            SqlCommand comm = new SqlCommand(sqlstr, con);
            con.Open();
            comm.ExecuteNonQuery();
            Response.Redirect("detail.aspx?tid="+tid);
            comm.Dispose();
            con.Close();
        }
        else
        {
            Response.Redirect("SignIn.aspx");
        }
    }
}