using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WorkAssignment3
{
    public partial class Report : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["AssectRegister"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayReport();
            CalculateCost();
        }

        void DisplayReport()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from Asset", con);
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);
                    GridViewReport.DataSource = dataSet;
                    GridViewReport.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        void CalculateCost()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select sum(Cost) as TotalCost from Asset", con);
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);

                    LabelSum.Text = dataSet.Tables[0].Rows[0][0].ToString();

                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}
