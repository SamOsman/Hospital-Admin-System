using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace A2_SalmaOsman.AdminHome
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                disableValidators();
                lblMsg.Text = "";
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtID.Text);
            string query = "select * from patients where id= @id";

            using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtFirst.Text = reader["firstname"].ToString();
                    txtLast.Text = reader["lastname"].ToString();
                    txtUserAge.Text = reader["age"].ToString();
                    txtOhip.Text = reader["OHIP"].ToString();

                    //enable the rest of the validators
                    valFirst.Enabled = true;
                    valLast.Enabled = true;
                    valUserAge.Enabled = true;
                    valOhip.Enabled = true;
                    btnUpdate.Enabled = true;
                    btnDelete.Enabled = true;

                } else
                {
                    lblMsg.Text = "No Patient Record with ID " + id +" was found";
                    lblMsg.ForeColor = Color.Red;
                }

                conn.Close();
            }

        } //end of btnSearch method


        protected void disableValidators()
        {
            valID.Enabled = true;
            valFirst.Enabled = false;
            valLast.Enabled = false;
            valUserAge.Enabled = false;
            valOhip.Enabled = false;

            btnDelete.Enabled = false;
            btnUpdate.Enabled = false;

        }

        protected void clearFields()
        {
            txtID.Text = "";
            txtFirst.Text = "";
            txtLast.Text = "";
            txtUserAge.Text = "";
            txtOhip.Text = "";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtID.Text);
            string firstname = txtFirst.Text;
            string lastname = txtLast.Text;
            int age = Convert.ToInt32(txtUserAge.Text);
            int ohip = Convert.ToInt32(txtOhip.Text);

            string query = "UPDATE patients SET firstname = @firstname, " +
                           "lastname = @lastname , age = @age, OHIP= @ohip " +
                           " WHERE id = @id";

            using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@firstname", firstname);
                cmd.Parameters.AddWithValue("@lastname", lastname);
                cmd.Parameters.AddWithValue("@age", age);
                cmd.Parameters.AddWithValue("@ohip", ohip);


                conn.Open();
                int rowsInserted = cmd.ExecuteNonQuery();

                if (rowsInserted == 1)
                {
                    lblMsg.Text = "Patient information updated successfully";
                    lblMsg.ForeColor = Color.Green;
                }
                else
                {
                    lblMsg.Text = "Patient information ws not updated";
                    lblMsg.ForeColor = Color.Red;
                }

            }
            clearFields();
            disableValidators();
            //refresh the page to reflect changes in data
            Response.Redirect("~/AdminHome/EditPatient.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            /***
            BUG: ON delete cascade does not work and patients
                    who are associated with a visit will not be deleted and 
                    throw an excpetion
            ***/
            int id = Convert.ToInt32(txtID.Text);
           
            string query = "delete from patients where id = @id";

            using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);
               

                conn.Open();
                try
                {
                    int rowDeleted = cmd.ExecuteNonQuery();

                    if (rowDeleted == 1)
                    {
                        lblMsg.Text = "Patient with id " + id + " was removed from records";
                        lblMsg.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = "Something went wrong, patient with id: " + id + " was not removed";
                        lblMsg.ForeColor = Color.Red;
                    }
                }
                catch (SqlException ex)
                {
                    lblMsg.Text = "SqlExpetion: " + ex.ToString();
                    lblMsg.ForeColor = Color.Red;
                }
                
            }
            clearFields();
            disableValidators();
            //refresh the page to reflect changes in data
            Response.Redirect("~/AdminHome/EditPatient.aspx");
        }
    }
}