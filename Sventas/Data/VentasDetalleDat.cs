using System;
using System.Collections.Generic;
using System.Linq;
using Sventas.Servicios;
using System.Threading.Tasks;
using Sventas.Modelos;
using System.Data;
using System.Data.SqlClient;
using Sventas.comun;
using Dapper;
using static Sventas.comun.OpcionesSP;

namespace Sventas.Data
{
    public class VentasDetalleDat : VentasDetalleServi
    {
        VentasDetalleMod _ventadetalle = new VentasDetalleMod();
        List<VentasDetalleMod> _oventasdetalles = new List<VentasDetalleMod>();
        public string Delete(int idventadetalle)
        {
            //string mensaje = "";

            try
            {
                _ventadetalle = new VentasDetalleMod()
                {
                    idVenta_detalle = idventadetalle
                };

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var ventadetalle = con.Query<VentasDetalleMod>("SP_VENTAS_DETALLE", this.SetParameters(_ventadetalle, (int)OpcionSP.Delete),
                        commandType: CommandType.StoredProcedure);

                   // mensaje = "Registro Eliminado";
                }

            }
            catch (Exception ex)
            {

               // mensaje = ex.Message;
            }

            return null;
        }

        public VentasDetalleMod Get(int idventadetalle)
        {
            _ventadetalle = new VentasDetalleMod();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();
                var query = ("SELECT *FROM VENTAS_DETALLE WHERE idVenta_detalle = " + idventadetalle);

                var oventasdetalles = con.Query<VentasDetalleMod>(query).ToList();

                if (oventasdetalles != null && oventasdetalles.Count() > 0)
                {
                    _ventadetalle = oventasdetalles.SingleOrDefault();
                }
            }
            return _ventadetalle;
        }

        public List<VentasDetalleMod> Gets()
        {
            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var query = "SELECT *FROM VENTAS_DETALLE";

                var oventasdetalle = con.Query<VentasDetalleMod>(query).ToList();

                if (oventasdetalle != null && oventasdetalle.Count() > 0)
                {
                    _oventasdetalles = oventasdetalle;
                }
            }
            return _oventasdetalles;
        }

        public List<VentasDetalleMod> Getsventa(int idvdetalle)
        {
            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var query = ("select *from VENTAS_DETALLE where idVenta="+idvdetalle);

                var oventasdetalle = con.Query<VentasDetalleMod>(query).ToList();

                if (oventasdetalle != null && oventasdetalle.Count() > 0)
                {
                    _oventasdetalles = oventasdetalle;
                }
            }
            return _oventasdetalles;
        }

        public VentasDetalleMod Save(VentasDetalleMod oventasdetalle)
        {
            
            _ventadetalle = new VentasDetalleMod();
            try
            {
                int opcSP = Convert.ToInt32(oventasdetalle.idVenta_detalle == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var oventasdetalles = con.Query<VentasDetalleMod>("SP_VENTAS_DETALLE", this.SetParameters(oventasdetalle, opcSP),

                        commandType: CommandType.StoredProcedure);

                    if (oventasdetalles != null && oventasdetalles.Count() > 0)
                    {
                        _ventadetalle = oventasdetalles.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {

                
            }
            return _ventadetalle;
        }
        private DynamicParameters SetParameters(VentasDetalleMod oventadetalle, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@idVenta_detalle", oventadetalle.idVenta_detalle);
            parameters.Add("@idVenta", oventadetalle.idVenta);
            parameters.Add("@idProducto", oventadetalle.idProducto);
            parameters.Add("@cantidad", oventadetalle.cantidad);
            parameters.Add("@precio_unitarui", oventadetalle.precio_unitarui);
            parameters.Add("@OPC", opcSP);
            parameters.Add("@mensaje", dbType: DbType.String, direction: ParameterDirection.Output, size: 100);
            

            var mensaje = parameters.Get<string>("mensaje");

            return parameters;
        }
    }
}
