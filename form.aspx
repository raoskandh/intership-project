using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

public partial class REG_FORM : System.Web.UI.Page
{
    string ConnectionString = "server=localhost\\SQLSERVER;database=first;uid=sa;pwd=1234;Trusted_Connection=No;";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void insert_data()
    {

        SqlConnection sqlConnection = new SqlConnection(ConnectionString);
        sqlConnection.Open();
        object[] text = new object[] { "Insert into regform(NAME,PASS,EMAIL,MOBILENUMBER,ADDRESS) values(" + "'" + fn.Value.ToString() + "'" + "," + "'" + ln.Value.ToString() + "'" + "," + "'" + em.Value.ToString() + "'" + "," + "'" + mn.Value.ToString() + "'" + "," + "'" + ad.Value.ToString() + "'" + ")" };
        string str1 = string.Concat(text);
        (new SqlCommand(str1, sqlConnection)).ExecuteNonQuery();
        sqlConnection.Close();
    }
    protected void bt1(object sender, EventArgs e)
    {
        insert_data();
    }
}
