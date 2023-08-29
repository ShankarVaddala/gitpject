using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;

namespace TaskAsp_RegLoginWelcome_
{
    public partial class RecoveryForm : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultFocus = TxtUId.ClientID;

            LblMsg.Text = "";
        }

        protected void TxtOPwd_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnSbmt_Click(object sender, EventArgs e)
        {
            try
            {
                // string userId = Session["UserID"].ToString(); // Retrieve UserID from session
                // string oldPassword = TxtOPwd.Text;

                string newPassword = TxtNPwd.Text;
                string confirmPassword = TxtCNPwd.Text;

                string securityquestion = DropDownList1.SelectedItem.ToString();
                string answer = TxtAnswer.Text;
                string userid = TxtUId.Text;


                // Perform password change only if new password matches confirm password

                if (newPassword == confirmPassword)
                {
                    
                    cn.Open();
                    SqlCommand cmd1 = new SqlCommand("Get_UserDetails", cn);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@UserID", TxtUId.Text);
                    SqlDataReader dr = cmd1.ExecuteReader();
                    string dbPwd="";
                    string dbQuestion = "";
                    string dbAnswer="";

                    if(dr.Read())
                    {
                        dbQuestion = dr[0].ToString();
                        dbAnswer = dr[1].ToString();
                        dbPwd = dr[2].ToString();

                    }
                    else
                    {
                        LblMsg.Text = "UserId Invalid..!";
                        return;
                    }
                    dr.Close();
                    if(dbQuestion==securityquestion && dbAnswer != answer)
                    {
                            LblMsg.Text = "Please Enter Correct Answer For Security Question";
                        return;
                    }
                    if(dbPwd == newPassword)
                    {
                        LblMsg.Text = "Please Don't Use Same Password";
                        return;
                    }
                   
                    SqlCommand cmd = new SqlCommand("Proc_ChangePassword5", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserID", TxtUId.Text);
                    cmd.Parameters.AddWithValue("@SecurityQuestion", securityquestion);
                    cmd.Parameters.AddWithValue("@Answers", answer);
                    cmd.Parameters.AddWithValue("@Password", newPassword);
                    cmd.Parameters.AddWithValue("@NewPassword", confirmPassword);

                    int result = cmd.ExecuteNonQuery();

                    if (result != 0)
                    {
                        LblMsg.Text = "Password changed successfully.";
                    }
                    else
                    {
                        LblMsg.Text = "Failed to change password. Please check your information";
                    }
                    cn.Close();
                    TxtUId.Text = "";
                    DropDownList1.SelectedIndex = 0;
                    TxtAnswer.Text = "";
                    TxtNPwd.Text = "";
                    TxtCNPwd.Text = "";
                }
                else
                {
                    LblMsg.Text = "New password and confirm password do not match.";
                }
            }
            catch (Exception ex)
            {
                LblMsg.Text = ex.Message;
            }
        }
    }
}