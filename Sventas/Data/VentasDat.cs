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
    public class VentasDat : VentasServi
    {
        VentasMod _oventa = new VentasMod();
        List<VentasMod> _oventas = new List<VentasMod>();
        public string Delete(int idventa)
        {
            string mensaje = "";

            try
            {
                _oventa = new VentasMod()
                {
                    idVenta = idventa
                };

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var venta = con.Query<VentasMod>("SP_VENTAS", this.SetParameters(_oventa, (int)OpcionSP.Delete),
                        commandType: CommandType.StoredProcedure);

                    mensaje = "Registro Eliminado";
                }

            }
            catch (Exception ex)
            {

                mensaje = ex.Message;
            }

            return mensaje;
        }

        public VentasMod Get(int idventa)
        {
            _oventa = new VentasMod();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();
                var query = ("SELECT *FROM VENTAS WHERE idVenta = " + idventa);

                var oventas = con.Query<VentasMod>(query).ToList();

                if (oventas != null && oventas.Count() > 0)
                {
                    _oventa = oventas.SingleOrDefault();
                }
            }
            return _oventa;
        }

        public List<VentasMod> Gets()
        {
            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var query = "SELECT *FROM VENTAS";

                var oventas = con.Query<VentasMod>(query).ToList();

                if (oventas != null && oventas.Count() > 0)
                {
                    _oventas = oventas;
                }
            }
            return _oventas;
        }

        public VentasMod Save(VentasMod oVenta)
        {
            _oventa = new VentasMod();
            try
            {
                int opcSP = Convert.ToInt32(oVenta.idVenta == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var oventas = con.Query<VentasMod>("SP_VENTAS", this.SetParameters(oVenta, opcSP),

                        commandType: CommandType.StoredProcedure);

                    if (oventas != null && oventas.Count() > 0)
                    {
                        _oventa = oventas.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {


            }
            return _oventa;
        }

        private DynamicParameters SetParameters(VentasMod oventa, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@idVenta", oventa.idVenta);
            parameters.Add("@nofactura", oventa.nofactura);
            parameters.Add("@serie", oventa.serie);
            parameters.Add("@fechafactura", oventa.fechafactura);
            parameters.Add("@idCliente", oventa.idCliente);
            parameters.Add("@idEmpleado", oventa.idEmpleado);
            parameters.Add("@fechaingreso", oventa.fechaingreso);
            parameters.Add("@estadoVenta", oventa.estadoVenta);
            parameters.Add("@OPC", opcSP);
          
            return parameters;
        }
    }
}
