using Dapper;
using Sventas.comun;
using Sventas.Modelos;
using Sventas.Servicios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using static Sventas.comun.OpcionesSP;

namespace Sventas.Data
{
    public class ProveedoresDat : ProveedoresServi
    {
        ProveedoresMod _oproveedor = new ProveedoresMod();
        List<ProveedoresMod> _opreveedores = new List<ProveedoresMod>();
        public string Delete(int idProveedor)
        {
            try
            {
                _oproveedor = new ProveedoresMod()
                {
                    idproveedor = idProveedor
                };

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var oproveedor = con.Query<ProveedoresMod>("SP_PROVEEDORES", this.SetParameters(_oproveedor, (int)OpcionSP.Delete),
                        commandType: CommandType.StoredProcedure);


                }

            }
            catch (Exception ex)
            {


            }

            return null;
        }

        public ProveedoresMod Get(int idProveedor)
        {
            _oproveedor = new ProveedoresMod();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var oproveedor = con.Query<MarcasMod>("SELECT *FROM PROVEEDORES WHERE idProveedor = " + idProveedor).ToList();

                if (oproveedor != null && oproveedor.Count() > 0)
                {
                    _ = oproveedor.SingleOrDefault();
                }
            }
            return _oproveedor;
        }

        public List<ProveedoresMod> Gets()
        {
            _opreveedores = new List<ProveedoresMod>();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var oproveedores = con.Query<ProveedoresMod>("SELECT *FROM PROVEEDORES").ToList();

                if (oproveedores != null && oproveedores.Count() > 0)
                {
                    _opreveedores = oproveedores;
                }
            }
            return _opreveedores;
        }

        public ProveedoresMod Save(ProveedoresMod omProveedor)
        {
            _oproveedor = new ProveedoresMod();
            try
            {
                int opcSP = Convert.ToInt32(omProveedor.idproveedor == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var oproveedores = con.Query<ProveedoresMod>("SP_PROVEEDORES", this.SetParameters(omProveedor, opcSP),

                        commandType: CommandType.StoredProcedure);

                    if (oproveedores != null && oproveedores.Count() > 0)
                    {
                        _oproveedor = oproveedores.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {


            }
            return _oproveedor;
        }

        private DynamicParameters SetParameters(ProveedoresMod oproveedor, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@idproveedor", oproveedor.idproveedor);
            parameters.Add("@proveedor", oproveedor.proveedor);
            parameters.Add("@nit", oproveedor.nitp);
            parameters.Add("@direccion", oproveedor.direccionp);
            parameters.Add("@telefono", oproveedor.telefonop);
            parameters.Add("@OPC", opcSP);
            return parameters;
        }
    }
}
