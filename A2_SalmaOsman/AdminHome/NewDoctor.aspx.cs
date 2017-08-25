using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace A2_SalmaOsman
{
    public partial class WebForm4 : System.Web.UI.Page
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
        /*
        protected void btnLookup_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtID.Text);

            using(SqlConnection conn = new SqlConnection(GlobalVariables.CS))
            {
                string query = "select * from doctors where id = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtID.Text = Convert.ToString(id);
                    txtFrstN.Text = reader["firstname"].ToString();
                    txtLastN.Text = reader["lastname"].ToString();
                    txtSpeciality.Text = reader["specialty"].ToString();
                   
                } else
                {
                    lblError.Text = "No record with id " + Convert.ToInt32(id) + " was found";
                }
                conn.Close();

            }
        } */

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string firstname = txtFrstN.Text;
            string lastname = txtLastN.Text.ToString();
            string speciality = txtSpeciality.Text.ToString();

            string query = "insert into doctors values (@first, @last, @specialty);";

            using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@first", firstname);
                cmd.Parameters.AddWithValue("@last", lastname);
                cmd.Parameters.AddWithValue("@specialty", speciality);

                conn.Open();

                int rowsInserted = cmd.ExecuteNonQuery();

                if (rowsInserted == 1)
                {
                    lblError.Text = "Doctor information inserted succesfully!";
                    lblError.ForeColor = Color.Green;
                }
                else
                {
                    lblError.Text = "Doctor information was not inserted succesfully!";
                    lblError.ForeColor = Color.Red;
                }

            }
        }
        
       

    }
}