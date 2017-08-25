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
    public partial class WebForm7 : System.Web.UI.Page
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
            GridViewRow row = GridViewVisits.SelectedRow;
            int visitId = Convert.ToInt32(row.Cells[1].Text);
            string query = "update visits set visit_end = GETDATE() where id = @id";
            
            using (SqlConnection conn = new SqlConnection(GlobalVariables.CS))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", visitId);

                conn.Open();

                int inserted = cmd.ExecuteNonQuery();

                if (inserted == 1)
                {
                    lblMsg.Text = "Patient with visit ID of " + visitId + " has been discharged";
                    lblMsg.ForeColor = Color.Green;
                    //refreshes page to display updates
                    Response.Redirect("~/AdminHome/DischargePatient.aspx");
                   
                } else
                {
                    lblMsg.Text = "Something went wrong! Patient with visit ID of " + visitId + " was not discharged";
                    lblMsg.ForeColor = Color.Red;
                }
                conn.Close();
            }

        }
    }
}