using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VISTA.MODELO;

namespace CONTROLADOR
{
    public class ControladorEmpresa
    {
        private static ControladorEmpresa _instance;

        private ControladorEmpresa() { }

        public static ControladorEmpresa GetInstance()
        {
            if (_instance == null)
            {
                _instance = new ControladorEmpresa();
            }
            return _instance;
        }

        #region Clientes
        public void AgregarCliente(Cliente cliente)
        {
            //Cliente es una entidad (clase de entidad)

            EmpresaContext.GetInstance().Container.ClienteSet.Add(cliente);

            //Clase - conexion con la db - obtengo datos de la db - tabla db - Agrego obj
            /*Obj de la db (cliente, cat, etc) son entidades. Las entidades tienen todos los datos que se relacionan
            //con ese objeto*/

            EmpresaContext.GetInstance().Container.SaveChanges();   //Guarda el cliente
        }

        public void EliminarCliente(Cliente cliente)
        {
            EmpresaContext.GetInstance().Container.ClienteSet.Remove(cliente);
            EmpresaContext.GetInstance().Container.SaveChanges();
        }

        public void ModificarCliente(Cliente cliente)
        {
            EmpresaContext.GetInstance().Container.SaveChanges();
        }

        public List<Cliente> GetClientes()
        {
            return EmpresaContext.GetInstance().Container.ClienteSet.ToList();
        }
        #endregion Clientes

        #region Empleados

        public void AgregarEmpleado(Empleado empleado)
        {
            EmpresaContext.GetInstance().Container.EmpleadoSet.Add(empleado);
            EmpresaContext.GetInstance().Container.SaveChanges();
        }

        public void EliminarEmpleado(Empleado empleado)
        {
            EmpresaContext.GetInstance().Container.EmpleadoSet.Remove(empleado);
            EmpresaContext.GetInstance().Container.SaveChanges();
        }

        public void ModificarEmpleado(Empleado empleado)
        {
            EmpresaContext.GetInstance().Container.SaveChanges();
        }

        public List<Empleado> GetEmpleados()
        {
            return EmpresaContext.GetInstance().Container.EmpleadoSet.ToList();
        }

        #endregion
        public Empresa GetEmpresa()
        {
            return EmpresaContext.GetInstance().Container.EmpresaSet.First(x => x.Id == 1);
        }
    }
}
