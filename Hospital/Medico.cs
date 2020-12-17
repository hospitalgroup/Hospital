using System;
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
    public partial class Medico : Form
    {
        Conexion conexion;

        public Medico()
        {
            InitializeComponent();
            conexion = new Conexion();
        }

        private void btnInsertar_Click(object sender, EventArgs e)
        {
            this.conexion.InsertarMedico(txtNombre.Text,txtApellido.Text,txtEspecialidad.Text);
            MessageBox.Show("Has Insertado un Registro Exitosamente!", "", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.conexion.ActualizarMedico(txtId.Text, txtNombre.Text, txtApellido.Text, txtEspecialidad.Text);
            MessageBox.Show("Has Actualizado un Registro Exitosamente!", "", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string valor = MessageBox.Show("Seguro que quiere eliminar el Registro?", "", MessageBoxButtons.YesNo, MessageBoxIcon.Warning).ToString();
            if (valor == "Yes")
            {
                this.conexion.EliminarMedico(txtId.Text);
                MessageBox.Show("Has Eliminado este Registro Exitosamente!");
            }
            
           
        }
    }
}
