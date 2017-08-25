using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
/*
all patients are retrieved and their name and id are displayed
all docotors are also displayed beside the patient table.

 user must select doctor before admitting a patient

When patient is admitted a system time stamp is stored along with the choosen docotor
data is stored in the visits table
*/
namespace A2_SalmaOsman
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if the user hasn't logged in, then the session variable 
            //will be null and they will be redirected to the login page
            if (Session["logged_in"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            lblMsg.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            string strdoctorId = txtDoctorId.Text;

            if (strdoctorId.Equals(""))
            {
                lblMsg.Text = "Please choose a doctor id";
                lblMsg.ForeColor = Color.Red;

            } else
            {
                GridViewRow row = GridViewPatientData.SelectedRow;
                int id = Convert.ToInt32(row.Cells[1].Text);
                string query = "insert into visits (patient_id, doctor_id, visit_start) values (@id, @doctorID, GETDATE())";
                int doctorID = Convert.ToInt32(strdoctorId);

                using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@doctorID", doctorID);
                    conn.Open();
                    int inserted = cmd.ExecuteNonQuery();

                    if (inserted == 1)
                    {
                        lblMsg.Text = "Patient with id " + row.Cells[1].Text +
                                    " was admitted succesfully.";
                        lblMsg.ForeColor = Color.Green;


                    }
                    else
                    {
                        lblMsg.Text = "Patient with id " + row.Cells[1].Text +
                                    " was admitted succesfully.";
                        lblMsg.ForeColor = Color.Red;
                    }
                    conn.Close();

                }
            }
            
        }
    }
}