using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A2_SalmaOsman
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if the user hasn't logged in, then the session variable 
            //will be null and they will be redirected to the login page
            if (Session["logged_in"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string firstname = txtFirstName.Text;
            string lastname = txtLastname.Text.ToString();
            int age = Convert.ToInt32(txtAge.Text);
            int ohip = Convert.ToInt32(txtOHIP.Text);

            string query = "insert into patients values (@first, @last, @age, @ohip);";

            using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@first", firstname);
                cmd.Parameters.AddWithValue("@last", lastname);
                cmd.Parameters.AddWithValue("@age", age);
                cmd.Parameters.AddWithValue("@ohip", ohip);

                conn.Open();

                int rowsInserted = cmd.ExecuteNonQuery();

                if (rowsInserted == 1)
                {
                    lblMsg.Text = "Patient information inserted succesfully!";
                    lblMsg.ForeColor = Color.Green;
                }
                else
                {
                    lblMsg.Text = "Patient information was not inserted succesfully!";
                    lblMsg.ForeColor = Color.Red;
                }

            }
        }
    }
}