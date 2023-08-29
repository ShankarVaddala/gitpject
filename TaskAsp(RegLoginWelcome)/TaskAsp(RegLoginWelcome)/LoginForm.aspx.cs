using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml.Linq;

namespace TaskAsp_RegLoginWelcome_
{
    public partial class LoginForm : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultFocus = TxtUId.ClientID;

            LblMsg.Text = "";
        }
       
        protected void BtnLgn_Click(object sender, EventArgs e)
        {
            try
            {
                if (captchacode.Text.ToLower() == Session["sessionCaptcha"].ToString())
                {

                    cn.Open();
                    SqlCommand cmd = new SqlCommand("Proc_LoginUser2", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserID", TxtUId.Text);
                    cmd.Parameters.AddWithValue("@Password", TxtPwd.Text);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Session["userid"] = dr["UserID"].ToString();
                        Session["name"] = dr["Name"].ToString();

                        Response.Redirect("WelcomeForm.aspx");

                    }
                    else
                    {
                        LblMsg.Text = "Login Failed";
                    }
                    
                    cn.Close();
                }
                else
                {
                    LblMsg.Text = "Captcha code is incorrect.Please enter correct captcha code.";
                    LblMsg.ForeColor = System.Drawing.Color.Red;

                }
            }
            catch (Exception ex)
            {
                LblMsg.Text = ex.Message;
            }


        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBoxShow_Hide_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}