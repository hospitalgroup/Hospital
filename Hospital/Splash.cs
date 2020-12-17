﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Hospital
{
    public partial class Splash : Form
    {
        private int contador = 0;

        public Splash()
        {
            InitializeComponent();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            progressBar1.Increment(1);
            contador++;
            lbProgreso.Text = "" + contador + "%";
            if (progressBar1.Value == 100)
            {
                timer1.Stop();
                Form empezar = new Medico();
                empezar.Show();
               
            }
        }
    }
}
