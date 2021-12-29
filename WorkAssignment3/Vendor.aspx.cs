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
    public partial class Vendor : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["AssectRegister"].ConnectionString;

        void PopulateVendorGridview()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                   con.Open();
                    SqlCommand command = new SqlCommand("select v.VendorId , v.VendorName,v.VendorEmail,v.Contact,c.CityName  from Vendor as v ,City as c where v.CityId=c.CityId", con);
                    SqlDataReader dataReader = command.ExecuteReader();
                    if (dataReader.HasRows == true)
                    {
                        GridViewVendor.DataSource = dataReader;
                        GridViewVendor.DataBind();
                    }
                }
            }
            catch (Exception e)
            {
                Response.Write(e);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            PopulateVendorGridview();
        }

        void UpdateVendor()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        protected void GridViewVendor_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewVendor_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        con.Open();
                        DropDownList DropDownList1 = (e.Row.FindControl("DropDownList1") as DropDownList);
                        SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select CityName from City", con);
                        DataSet dataSet = new DataSet();
                        sqlDataAdapter.Fill(dataSet);

                        for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                        {
                            DropDownList1.Items.Add(dataSet.Tables[0].Rows[i][0].ToString());
                        }
                    
                        string selectedCity = DataBinder.Eval(e.Row.DataItem, "CityName").ToString();
                        DropDownList1.Items.FindByValue(selectedCity).Selected = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void GridViewVendor_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewVendor.EditIndex = -1;
            PopulateVendorGridview();
        }

        protected void GridViewVendor_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewVendor.EditIndex = e.NewEditIndex;
            PopulateVendorGridview();
        }
    }
}