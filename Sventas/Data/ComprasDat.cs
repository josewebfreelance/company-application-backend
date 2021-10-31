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
    public class ComprasDat : ComprasServi
    {
        ComprasMod _ocompra = new ComprasMod();
        List<ComprasMod> _ocompras = new List<ComprasMod>();
        public string Delete(int idcompra)
        {
            //string mensaje = "";

            try
            {
                _ocompra = new ComprasMod()
                {
                    idCompra = idcompra                };

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var compra = con.Query<ComprasMod>("SP_COMPRAS", this.SetParameters(_ocompra, (int)OpcionSP.Delete),
                        commandType: CommandType.StoredProcedure);

                    //mensaje = "Registro Eliminado";
                }

            }
            catch (Exception ex)
            {

               // mensaje = ex.Message;
            }

            return null;
        }

        public ComprasMod Get(int idcompra)
        {
            _ocompra = new ComprasMod();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();
                var query = ("SELECT *FROM COMPRAS WHERE idCompra = " + idcompra);

                var ocompras = con.Query<ComprasMod>(query).ToList();

                if (ocompras != null && ocompras.Count() > 0)
                {
                    _ocompra = ocompras.SingleOrDefault();
                }
            }
            return _ocompra;
        }

        public List<ComprasMod> Gets()
        {
            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var query = "SELECT *FROM COMPRAS";

                var ocompras = con.Query<ComprasMod>(query).ToList();

                if (ocompras != null && ocompras.Count() > 0)
                {
                    _ocompras = ocompras;
                }
            }
            return _ocompras;
        }

        public ComprasMod Save(ComprasMod oCompra)
        {
            _ocompra = new ComprasMod();
            try
            {
                int opcSP = Convert.ToInt32(oCompra.idCompra == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var ocompras = con.Query<ComprasMod>("SP_COMPRAS", this.SetParameters(oCompra, opcSP),

                        commandType: CommandType.StoredProcedure);

                    if (ocompras != null && ocompras.Count() > 0)
                    {
                        _ocompra = ocompras.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {


            }
            return _ocompra;
        }
        private DynamicParameters SetParameters(ComprasMod ocompra, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@idCompra", ocompra.idCompra);
            parameters.Add("@no_orden_compra", ocompra.no_orden_compra);
            parameters.Add("@idProveedor", ocompra.idProveedor);
            parameters.Add("@fecha_orden", ocompra.fecha_orden);
            parameters.Add("@fechaingreso", ocompra.fechaingreso);
            parameters.Add("@estadoCompra", ocompra.estadoCompra);
            parameters.Add("@OPC", opcSP);

            return parameters;
        }
    }
}
