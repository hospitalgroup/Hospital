using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Hospital
{
    class Conexion
    {

        public SqlConnection conexion = new SqlConnection("Data Source=JANSER-PC\\SQLEXPRESS; Initial Catalog=Hospital; Integrated Security=True");


        public bool InsertarMedico(string nombre, string apellido, string especialidad){

            conexion.Open();
            SqlCommand cmd = new SqlCommand("insert into tMedico (nombre,apellido,especialidad) values (@nombre,@apellido,@especialidad)",conexion);
            cmd.Parameters.AddWithValue("@nombre", nombre);
            cmd.Parameters.AddWithValue("@apellido", apellido);
            cmd.Parameters.AddWithValue("@especialidad", especialidad);
            int FilasAfectadas = cmd.ExecuteNonQuery();
            conexion.Close();
            if (FilasAfectadas > 0)
            {
                return true;
            }
            else { return false; }

        }

        public bool ActualizarMedico(string id, string nombre, string apellido, string especialidad) {

            conexion.Open();
            SqlCommand cmd = new SqlCommand(string.Format("update tMedico set nombre = '{0}', apellido = '{1}', especialidad = '{2}' where idMedico = {3}", new string[] { nombre, apellido, especialidad, id}), conexion);
            int FilasAfectadas = cmd.ExecuteNonQuery();
            conexion.Close();
            if (FilasAfectadas > 0)
            {
                return true;
            }
            else { return false; }
        }

        public bool EliminarMedico(string id) {

            conexion.Open();
            SqlCommand cmd = new SqlCommand(string.Format("delete from tMedico where idMedico =  {0}", id), conexion);
            int FilasAfectadas = cmd.ExecuteNonQuery();
            conexion.Close();
            if (FilasAfectadas > 0)
            {
                return true;
            }
            else { return false; }
        }


    }
}
