using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VISTA.MODELO
{
    public class EmpresaContext
    {
        private static EmpresaContext _instance;

        private static EmpresaDBContainer _container;   //una db
        private EmpresaContext() { }

        public static EmpresaContext GetInstance()
        {
            if (_instance == null)
            {
                _instance = new EmpresaContext();
                _container = new EmpresaDBContainer();
            }
            return _instance;
        }

        public EmpresaDBContainer Container
        {
            get { return _container; }
        }
    }
}
