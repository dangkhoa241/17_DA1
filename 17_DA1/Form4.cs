using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace _17_DA1
{
    public partial class Form4 : Form
    {
        public string connectString;
        SqlConnection conn;
        public Form4()
        {
            InitializeComponent();
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(connectString);
            conn.Open();

            string sqlexec1 = "EXEC SP_THONGKE_DOANHTHU";
            SqlCommand cmd1 = new SqlCommand(sqlexec1, conn);
            cmd1.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();

            da.Fill(dt);
            dataGridView1.DataSource = dt;
            //dataGridView1.Columns["NgayLap"].Width = 20; 
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            conn.Close();
            this.Close();
            Form1 f1 = new Form1();
            f1.Show();
        }
    }
}
