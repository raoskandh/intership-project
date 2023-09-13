using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

public partial class LOGIN : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    string ConnectionString = "server=localhost\\SQLSERVER;database=first;uid=sa;pwd=1234;Trusted_Connection=No;";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Fpass(object sender, EventArgs e)
    {
        Response.Redirect("FORGOT_PASS.aspx");
    }
    protected void hello(object sender, EventArgs e)
    {
        Response.Redirect("REG_FORM.aspx");
    }
   
    protected void log(object sender, EventArgs e)
    {
        get_LOGIN(em.Value.ToString(), pass.Value.ToString());

        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["em"] = em.Value.ToString();
            Response.Redirect("REPORT_CARD.aspx");

        }
    }
     

    public void get_LOGIN(string em,string pass)
    {

        SqlConnection sqlConnection = new SqlConnection(ConnectionString);
        sqlConnection.Open();
        object[] text = new object[] { "SELECT EMAIL from [regform] where email='" + em + "'" + " and pass=" + "'" + pass + "'" };
        string str1 = string.Concat(text);
        SqlCommand command = new SqlCommand(str1, sqlConnection);
        SqlDataAdapter da = new SqlDataAdapter(command);
        (new SqlCommand(str1, sqlConnection)).ExecuteNonQuery();
        da.Fill(ds);
        sqlConnection.Close();
    }
    
}
