using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
/*
login page verifies username and password
the users's status is stored in the users table
the user's status us pulled and 
if status = admin > then the user is routed to the admin page
otherwise, the user is sent to the (regular) user page  
*/
namespace A2_SalmaOsman
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        string usersTable = "users";
        string colFirstN = "firstname";
        string colLastN = "lastname";
        string colStatus = "status";
        

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cs = @"Data Source=localhost\SQLSERVER2008;Initial Catalog=HospitalAdmin;Integrated Security=True";
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            using(SqlConnection conn = new SqlConnection(cs))
            {
                string sql = "select * from "+ usersTable + " where username = @username and password = @password";
                SqlCommand cmd = new SqlCommand(sql,conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);

                //open connection & execute query
                conn.Open();
                SqlDataReader reader =  cmd.ExecuteReader();

                if (reader.Read())
                {
                    //set session variable to user's status: admin or regular user
                    Session.Timeout = 60;
                    Session["status"] = reader[colStatus].ToString();
                    Session["name"] = reader[colFirstN].ToString() +" " + reader[colLastN].ToString();
                    Session["logged_in"] = true;

                    //determine id user is Admin or regular user
                    if (Session["status"].Equals("admin"))
                    {
                        Response.Redirect("AdminHome/AdminHome.aspx");
                    } else
                    {
                        Response.Redirect("UserHome/UserHome.aspx");
                    }
                    
                } else
                {
                    lblLoginErr.Text = "Username or password entered wrong";
                    lblLoginErr.ForeColor = Color.Red;
                }
                conn.Close();
            }
        }

       

    }
}