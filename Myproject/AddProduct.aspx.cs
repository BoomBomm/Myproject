using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class AddProduct : System.Web.UI.Page
{
    Operation operation = new Operation();
    public static String CS = ConfigurationManager.ConnectionStrings["cartoon111ConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindType();
        }
    }

    private void bindType()
    {
        //类型选择栏的绑定
        using (DataTable dt = operation.SelectType("select * from T_type"))
        {
            //SqlCommand cmd = new SqlCommand("select * from T_type", con);
            //con.Open();
            //SqlDataAdapter sda = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                ddlType.DataSource = dt;
                ddlType.DataTextField = "ftype";
                ddlType.DataValueField = "fid";
                ddlType.DataBind();
                ddlType.Items.Insert(0, new ListItem("-Select-", "0"));
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlCommand cmd = new SqlCommand("insert into T_post([fid],[uid],[subject],[contant],[addtime],[iselite]) values(@fid,@uid,@subject,@contant,@addtime,@iselite)",con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@subject", txtPName.Text);
            cmd.Parameters.AddWithValue("@fid", ddlType.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@contant", txtDetail.Text);
            cmd.Parameters.AddWithValue("@addtime", DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@uid",Convert.ToInt64(Session["USERID"]));
            if (elite.Checked == true)
            {
                cmd.Parameters.AddWithValue("@iselite", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@iselite", 0.ToString());
            }
            con.Open();
            cmd.ExecuteNonQuery();
            //上传图片
            if (fuImg01.HasFile)
            {
                string id = ddlType.SelectedItem.Value;
                string SavePath = Server.MapPath("~/Images/ProductImages/0")+id;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                fuImg01.SaveAs(SavePath + "\\" + txtPName.Text.ToString().Trim() + "0"+id + Extention);

                string pathname = txtPName.Text.ToString().Trim() + "0" + id + Extention;
                SqlCommand cmd1 = new SqlCommand("update T_post set image ='"+ pathname+ "' where tid=(select max(tid) from T_post)", con);
                cmd1.ExecuteNonQuery();
                Response.Redirect("Default.aspx");
                Response.Write("<script>alert('上传成功!')</script>");
            }
        }
    }
}