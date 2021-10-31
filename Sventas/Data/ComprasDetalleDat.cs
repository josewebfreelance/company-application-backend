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
    public class ComprasDetalleDat : ComprasDetalleServi
    {
        ComprasDetalleMod _compradetalle = new ComprasDetalleMod();
        List<ComprasDetalleMod> _comprasdetalles = new List<ComprasDetalleMod>();
        public string Delete(int idcompradetalle)
        {
            //string mensaje = "";

            try
            {
                _compradetalle = new ComprasDetalleMod()
                {
                    idCompra_detalle = idcompradetalle
                };

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var compradetalle = con.Query<ComprasDetalleMod>("SP_COMPRAS_DETALLE", this.SetParameters(_compradetalle, (int)OpcionSP.Delete),
                        commandType: CommandType.StoredProcedure);

                    //mensaje = "Registro Eliminado";
                }

            }
            catch (Exception ex)
            {

                //mensaje = ex.Message;
            }

            return null;
        }

        public ComprasDetalleMod Get(int idcompradetalle)
        {
            _compradetalle = new ComprasDetalleMod();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();
                var query = ("SELECT *FROM COMPRAS_DETALLE WHERE idCompra_detalle = " + idcompradetalle);

                var ocomprasdetalle = con.Query<ComprasDetalleMod>(query).ToList();

                if (ocomprasdetalle != null && ocomprasdetalle.Count() > 0)
                {
                    _compradetalle = ocomprasdetalle.SingleOrDefault();
                }
            }
            return _compradetalle;
        }

        public List<ComprasDetalleMod> Gets()
        {
            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var query = "SELECT *FROM COMPRAS_DETALLE";

                var ocomprasdetalle = con.Query<ComprasDetalleMod>(query).ToList();

                if (ocomprasdetalle != null && ocomprasdetalle.Count() > 0)
                {
                    _comprasdetalles = ocomprasdetalle;
                }
            }
            return _comprasdetalles;
        }

        public List<ComprasDetalleMod> Getscom(int idcom)
        {
            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var query = ("select *from COMPRAS_DETALLE where idCompra=" + idcom);

                var ocomprasdetalle = con.Query<ComprasDetalleMod>(query).ToList();

                if (ocomprasdetalle != null && ocomprasdetalle.Count() > 0)
                {
                    _comprasdetalles = ocomprasdetalle;
                }
            }
            return _comprasdetalles;
        }

        public ComprasDetalleMod Save(ComprasDetalleMod oComprasDetalleMod)
        {
            _compradetalle = new ComprasDetalleMod();
            try
            {
                int opcSP = Convert.ToInt32(oComprasDetalleMod.idCompra_detalle == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var ocomprasdetalles = con.Query<ComprasDetalleMod>("SP_COMPRAS_DETALLE", this.SetParameters(oComprasDetalleMod, opcSP),

                        commandType: CommandType.StoredProcedure);

                    if (ocomprasdetalles != null && ocomprasdetalles.Count() > 0)
                    {
                        _compradetalle = ocomprasdetalles.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {


            }
            return _compradetalle;
        }
        private DynamicParameters SetParameters(ComprasDetalleMod ocompradetalle, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@idCompra_detalle", ocompradetalle.idCompra_detalle);
            parameters.Add("@idCompra", ocompradetalle.idCompra);
            parameters.Add("@idProducto", ocompradetalle.idProducto);
            parameters.Add("@cantidad", ocompradetalle.cantidad);
            parameters.Add("@precio_costo_unitario", ocompradetalle.precio_costo_unitario);
            parameters.Add("@OPC", opcSP);
            parameters.Add("@mensaje", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);


            var mensaje = parameters.Get<string>("mensaje");

            return parameters;
        }
    }
}
