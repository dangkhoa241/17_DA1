﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace _17_DA1
{
    public partial class Form1 : Form
    {
        public string connectString;
        SqlConnection conn;
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form2 f2 = new Form2();
            f2.connectString = connectString;
            this.Hide();
            f2.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form3 f3 = new Form3();
            f3.connectString = connectString;
            this.Hide();
            f3.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form4 f4 = new Form4();
            f4.connectString = connectString;
            this.Hide();
            f4.Show();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            connectString = @"Data Source=KHOA\SQLEXPRESS;Initial Catalog=QLBH;Integrated Security=True";
            conn = new SqlConnection(connectString);
            conn.Open();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            conn.Close();
            Application.Exit();
        }
    }
}
