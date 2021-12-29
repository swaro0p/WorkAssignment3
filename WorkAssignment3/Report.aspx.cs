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
        string constr = ConfigurationManager.ConnectionStrings["AssetRegister"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)//Loads Report gridview with data and calculates cost at startup
        {
            LabelRowCount.Text = GridViewReport.Rows.Count.ToString();
            DisplayReport();
            CalculateCost();
        }

        void DisplayReport(string sortExpression = null)//Loads asset table values in gridview
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

        void CalculateCost()//Calculates cost of all values
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

        //Searches values in Asset table using asset name
        protected void TextBoxReportSearch_TextChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select AssetID,AssetName,VendorName,PurchaseDate,Cost from Asset where AssetName like '" + TextBoxReportSearch.Text + "%' OR VendorName like '"+ TextBoxReportSearch.Text + "%'" , con);
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

    }
}
