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
                   // GridViewAssetList.AutoGenerateColumns = true;
                    GridViewAssetList.DataBind();
                    
                }
            }
            catch (Exception e)
            {
                Response.Write(e);
            }
        }

        void SearchAsset()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "select AssetId,AssetName,VendorName,Cost from Asset where AssetName like '%' + @AssetName + '%'";
                    // SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("select AssetId,AssetName,VendorName,Cost from Asset where AssetName like'%' '"+TextBoxVendorSearch.Text+ "%'", con);
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@AssetName", TextBoxVendorSearch.Text.Trim());
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                    DataSet dataSet = new DataSet();
                    sqlDataAdapter.Fill(dataSet);

                    GridViewAssetList.DataSource = dataSet;
                    // GridViewAssetList.AutoGenerateColumns = true;
                    
                    GridViewAssetList.DataBind();
                }
            }
            catch (Exception e)
            {
               Response.Write(e);
            }
        }

        void linkDelete_Click(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            AssetListGridView();

            
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewAssetList.PageIndex = e.NewPageIndex;
            this.SearchAsset();
        }
        protected void ButtonVendorSearch_Click(object sender, EventArgs e)
        {
            this.SearchAsset();
        }

        protected void TextBoxVendorSearch_TextChanged(object sender, EventArgs e)
        {

           /* if (!this.IsPostBack)
            {
                if (TextBoxVendorSearch.Text.Length == 0)
                {
                    this.AssetListGridView();
                }
            }*/
        }
    }
}