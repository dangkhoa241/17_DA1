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
    public partial class Form2 : Form
    {
        public string connectString;
        SqlConnection conn;
        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(connectString);
            conn.Open();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            conn.Close();
            this.Close();
            Form1 f1 = new Form1();
            f1.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string madh = textBox1.Text;
            string makh = textBox2.Text;
            DateTime ngaylap = dateTimePicker1.Value;
            string tongtien = textBox3.Text;
            try
            {
                string sqlexec1 = "EXEC SP_THEM_HOADON '" + madh + "', N'" + makh + "', '" + ngaylap + "', '" + tongtien  + "'";
                SqlCommand cmd1 = new SqlCommand(sqlexec1, conn);
                cmd1.ExecuteNonQuery();
                MessageBox.Show("Thêm hóa đơn thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.Close();
                Form1 f1 = new Form1();
                f1.Show();
            }
            catch (SqlException error)
            {
                string errorStr = error.ToString();
                string[] arrStr0 = errorStr.Split(':');
                string[] arrStr = arrStr0[1].Split('\n');
                MessageBox.Show(arrStr[0].ToString() + "\nThêm hóa đơn không thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
