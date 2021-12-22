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
    public partial class AssetList : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["AssectRegister"].ConnectionString;
        void AssetListGridView()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select * from Asset",con);
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);
                    GridViewAssetList.DataSource = dataSet;
                    GridViewAssetList.DataBind();                    
                }
            }
            catch (Exception e)
            {
                Response.Write(e);
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            AssetListGridView();
        }


        protected void TextBoxVendorSearch_TextChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select AssetId,AssetName,VendorName,Cost from Asset where AssetName like '" + TextBoxVendorSearch.Text + "%'", con);
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);
                    GridViewAssetList.DataSource = dataSet;
                    GridViewAssetList.DataBind();                  
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);            }
              
        }

        protected void GridViewAssetList_RowEditing(object sender, GridViewEditEventArgs e)
        {
           
        }
    }
}