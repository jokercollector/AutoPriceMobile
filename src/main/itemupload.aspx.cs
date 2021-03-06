﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.Text;

namespace AutoPriceMobile.src.main
{
    public partial class itemupload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null || Session["userID"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
        }

        protected void submitbtn_ServerClick(object sender, EventArgs e)
        {
            double parseValue = 0;
            bool parsed = Double.TryParse(add_itemPrice.Text, out parseValue);

            int parseValue2 = 0;
            bool parsed2 = Int32.TryParse(add_itemQty.Text, out parseValue2);

            if(!add_itemImg.HasFile)
            {
                lblText.Text = "Please add a photo of the item!";
                lblText.ForeColor = System.Drawing.Color.Red;
            }
            else if(add_itemDesc.Text == "" || add_itemName.Text == "")
            {
                lblText.Text = "Please add a name and description for the item!";
                lblText.ForeColor = System.Drawing.Color.Red;
            }
            else if(add_itemPrice.Text == "" || add_itemQty.Text == "")
            {
                lblText.Text = "Please add a price and quantity for the item!";
                lblText.ForeColor = System.Drawing.Color.Red;
            }
            else if(!parsed)
            {
                lblText.Text = "Please enter a valid input for the price (numbers only)!";
                lblText.ForeColor = System.Drawing.Color.Red;
            }
            else if(!parsed2)
            {
                lblText.Text = "Please enter a valid input for the quantity (numbers only)!";
                lblText.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                int status = 0;

                HttpPostedFile postedFile = add_itemImg.PostedFile;
                string fileExtension = Path.GetExtension(postedFile.FileName);
                SqlConnection conn = new SqlConnection(Shared.SqlConnString);

                if (add_itemStatus.SelectedValue == "Global")
                {
                    status = 1;
                }
                else
                {
                    status = 0;
                }

                using (conn)
                {
                    try
                    {
                        conn.Open();
                        if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png")
                        {
                            Stream stream = postedFile.InputStream;
                            BinaryReader reader = new BinaryReader(stream);
                            byte[] imgByte = reader.ReadBytes((int)stream.Length);

                            SqlCommand cmd = new SqlCommand("INSERT INTO dbo.[ItemSale](StockName, StockImage, StockDescription, UserID, UserName, Quantity, Price, Time, Status) VALUES (@StockName, @StockImage, @StockDescription, @UserID, @UserName, @Quantity, @Price, @Time, @Status)", conn);
                            cmd.Parameters.AddWithValue("@StockName", add_itemName.Text);
                            cmd.Parameters.Add("@StockImage", SqlDbType.VarBinary).Value = imgByte;
                            cmd.Parameters.AddWithValue("@StockDescription", add_itemDesc.Text);
                            cmd.Parameters.AddWithValue("@UserID", Session["userID"].ToString());
                            cmd.Parameters.AddWithValue("@UserName", Session["username"].ToString());
                            cmd.Parameters.AddWithValue("@Quantity", add_itemQty.Text);
                            cmd.Parameters.AddWithValue("@Price", add_itemPrice.Text);
                            cmd.Parameters.AddWithValue("@Time", DateTime.Now.ToString("HH:mm:ss tt"));
                            cmd.Parameters.AddWithValue("@Status", status);
                            cmd.ExecuteNonQuery();
                            lblText.Text = "Item Successfully Added.";
                        }
                        else
                        {
                            lblText.Text = "Incorrect Image File Type! Please make sure the image is in .jpg or .png format!";
                            lblText.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    catch (Exception ex)
                    {
                    Response.Write(ex.Message);
                    }
                }
            }
        }

    }
}