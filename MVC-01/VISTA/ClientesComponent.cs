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
    public partial class ClientesComponent : UserControl
    {
        private List<Cliente> clientes = new List<Cliente>();
        public ClientesComponent()
        {
            InitializeComponent();
            ListarClientes();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            Cliente cliente = new Cliente()
            {
                nombre = txtNombre.Text,
                edad = nudEdad.Text,
                telefono = txtTelefono.Text
            };

            cliente.Empresa = ControladorEmpresa.GetInstance().GetEmpresa();

            ControladorEmpresa.GetInstance().AgregarCliente(cliente);
            ListarClientes();
        }

        private void ListarClientes()
        {
            dgvCliente.DataSource = null;
            clientes = ControladorEmpresa.GetInstance().GetClientes();
            dgvCliente.DataSource = clientes;
            dgvCliente.Columns.Remove("Empresa");
        }
        
    }
}
