using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TaskAsp_RegLoginWelcome_
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultFocus = TxtName.ClientID;

            TxtUId.ReadOnly = true;
            cn.Open();
            string query = "select max(UserID) from registrationform";
            SqlCommand cmd = new SqlCommand(query, cn);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            int uid = Convert.ToInt32(dr[0]);
            uid++;
            TxtUId.Text =uid.ToString();
            cn.Close();


            if (!IsPostBack)
            {
                DropDownList1.SelectedValue = "";
                LblMsg.Text = "";
            }

            
        }

        protected void BtnReg_Click(object sender, EventArgs e)
        {
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("Proc_RegUsr2", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", TxtName.Text);
                cmd.Parameters.AddWithValue("@Mobile", TxtNumber.Text);
                cmd.Parameters.AddWithValue("@UserID", TxtUId.Text);
                cmd.Parameters.AddWithValue("@Password", TxtPwd.Text);
               
                cmd.Parameters.AddWithValue("@SecurityQuestion", DropDownList1.SelectedItem.ToString()); ;
                cmd.Parameters.AddWithValue("@Answers", TxtAnswer.Text);
             
                int res = cmd.ExecuteNonQuery();
                if (res != 0)
                {
                    LblMsg.Text = "Registration Successfully";
                    TxtName.Text = "";
                    TxtNumber.Text = "";
                    TxtUId.Text = "";
                    TxtPwd.Text = "";
                    TxtCPwd.Text = "";
                    DropDownList1.SelectedValue="Select" ; // Reset dropdown to the first item
                    TxtAnswer.Text = "";
                }
                cn.Close();


            }
            catch (Exception ex)
            {
                LblMsg.Text = ex.Message;
            }
        }

        protected void TxtSquestion_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}