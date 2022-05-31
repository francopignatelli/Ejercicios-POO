using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CONTROLADOR;
using VISTA.MODELO;

namespace VISTA
{
    public partial class EmpleadosComponent : UserControl
    {
        private List<Empleado> empleados = new List<Empleado>();
        public EmpleadosComponent()
        {
            InitializeComponent();
            ListarEmpleados();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            Empleado empleado = new Empleado()
            {
                nombre = txtNombre.Text,
                edad = nudEdad.Text,
                salario = txtSaldo.Text,
                categoria = cbCategoria.Text
            };

            empleado.Empresa = ControladorEmpresa.GetInstance().GetEmpresa();

            ControladorEmpresa.GetInstance().AgregarEmpleado(empleado);
            ListarEmpleados();
        }

        private void ListarEmpleados()
        {
            dgvEmpleados.DataSource = null;
            empleados = ControladorEmpresa.GetInstance().GetEmpleados();
            dgvEmpleados.DataSource = empleados;
            dgvEmpleados.Columns.Remove("Empresa");
        }
    }
}
