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
    public partial class WelcomeForm : System.Web.UI.Page
    {
        DateTime now = DateTime.Now;
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                cn.Open();
                string userid = Session["userid"].ToString();
                string updated_lastseen = "";
                SqlCommand cmd1 = new SqlCommand("LastSeen", cn);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@UserID", userid);
              
                cmd1.Parameters.AddWithValue("LastLogin",updated_lastseen );
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.Read())
                {
                    updated_lastseen = dr[0].ToString();
                }
                dr.Close();


                if (!string.IsNullOrEmpty(updated_lastseen))
                {
                    LblMsg.Text = Session["name"].ToString();
                    LblLstSeenMsg.Text = "Last seen: " + updated_lastseen;
                }
                else
                {
                    LblMsg.Text = Session["name"].ToString();
                    string message = "You haven't logged in before.";
                    LblLstSeenMsg.Text = "Last seen: " + message ;
                   
                }


                //LblMsg.Text = Session["name"].ToString();
                //LblLstSeenMsg.Text = "Last seen : " + updated_lastseen;

                //Updating date with current login state
                SqlCommand cmd2 = new SqlCommand("LastSeenUpdate", cn);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@UserID", userid);
                cmd2.Parameters.AddWithValue("LastLogin", now.ToString());
                int result = cmd2.ExecuteNonQuery();
                if (result != 0)
                {
                    string name = Session["name"].ToString();
                    string lastseen = now.ToString();
                }
            }
            catch (Exception ex)
            {
                LblMsg.Text = ex.Message;
            }

        }
    }
}