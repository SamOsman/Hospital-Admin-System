using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
/*
when page intially loaded, the only field validator enabled is the id.
reason: so user can enter the id of the dotor without getting the field 
required for the other fields.

Once the user retrieves an exisitng record, the rest of the validators are enabled
*/
namespace A2_SalmaOsman.AdminHome
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                disableValidators();
                lblMsg.Text = "";

           
        }

        protected void btnGetRecord_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtID.Text);

            string query = "select * from doctors where id= @id";

            using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtID.Text = reader["id"].ToString();
                    txtFirst.Text = reader["firstname"].ToString();
                    txtLastname.Text = reader["lastname"].ToString();
                    txtSpecialty.Text = reader["specialty"].ToString();

                    valFirstN.Enabled = true;
                    valLastN.Enabled = true;
                    valSpec.Enabled = true;
                    btnDelete.Enabled = true;
                    btnUpdate.Enabled = true;
 
                }
                else
                {
                    lblMsg.Text = "No doctor with an ID of " + id + " was found";
                    lblMsg.ForeColor = Color.Red;
                }

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
           
                int id = Convert.ToInt32(txtID.Text);
                string firstname = txtFirst.Text;
                string lastname = txtLastname.Text.ToString();
                string speciality = txtSpecialty.Text.ToString();

                string query = "UPDATE doctors SET firstname = @firstname, " +
                               "lastname = @lastname , specialty = @specialty " +
                               " WHERE id = @id";

                using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@firstname", firstname);
                    cmd.Parameters.AddWithValue("@lastname", lastname);
                    cmd.Parameters.AddWithValue("@specialty", speciality);

                    conn.Open();
                    int rowsInserted = cmd.ExecuteNonQuery();

                    if (rowsInserted == 1)
                    {
                        lblMsg.Text = "Doctor information updated successfully";
                        lblMsg.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = "Doctor information ws not  updated";
                        lblMsg.ForeColor = Color.Red;
                    }
                
            }
            clearFields();
            disableValidators();
            //refresh the page to reflect changes in data
            Response.Redirect("~/AdminHome/EditDoctor.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            /***
            BUG: ON delete cascade does not work and patients
                    who are associated with a visit will not be deleted and 
                    throw an excpetion
            ***/
            int id = Convert.ToInt32(txtID.Text.ToString());

            string query = "delete from doctors where id = @id";

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
                        lblMsg.Text = "Doctor with id " + id + " was removed from records";
                        lblMsg.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblMsg.Text = "Something went wrong, doctor with id: " + id + " was not removed";
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
            Response.Redirect("~/AdminHome/EditDoctor.aspx");
        }


        protected void clearFields()
        {
            txtID.Text = "";
            txtFirst.Text = "";
            txtLastname.Text = "";
            txtSpecialty.Text = "";
        }

        protected void disableValidators()
        {
            valID.Enabled = true;
            valFirstN.Enabled = false;
            valLastN.Enabled = false;
            valSpec.Enabled = false;

            btnDelete.Enabled = false;
            btnUpdate.Enabled = false;
        }
    }
}