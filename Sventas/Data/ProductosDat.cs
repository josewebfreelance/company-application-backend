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
    public class ProductosDat : ProductosServi
    {
        ProductosMod _oproducto = new ProductosMod();
        List<ProductosMod> _oproductos = new List<ProductosMod>();
        public string Delete(int idproducto)
        {
            //string mensaje = "";

            try
            {
                _oproducto = new ProductosMod()
                {
                    idProducto = idproducto                };

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var oproducto = con.Query<ProductosMod>("SP_PRODUCTOS", this.SetParameters(_oproducto, (int)OpcionSP.Delete),
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

        public ProductosMod Get(int idproducto)
        {
            _oproducto = new ProductosMod();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();
                var query = ("SELECT *FROM PRODUCTOS WHERE idProducto = " + idproducto);

                var oproductos = con.Query<ProductosMod>(query).ToList();

                if (oproductos != null && oproductos.Count() > 0)
                {
                    _oproducto = oproductos.SingleOrDefault();
                }
            }
            return _oproducto;
        }

        public List<ProductosMod> Gets()
        {
            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var query = "SELECT *FROM PRODUCTOS";

                var oproductos = con.Query<ProductosMod>(query).ToList();

                if (oproductos != null && oproductos.Count() > 0)
                {
                    _oproductos = oproductos;
                }
            }
            return _oproductos;
        }

        public ProductosMod Save(ProductosMod oProductos)
        {
            _oproducto = new ProductosMod();
            try
            {
                int opcSP = Convert.ToInt32(oProductos.idProducto == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var oproductos = con.Query<ProductosMod>("SP_PRODUCTOS", this.SetParameters(oProductos, opcSP),

                        commandType: CommandType.StoredProcedure);

                    if (oproductos != null && oproductos.Count() > 0)
                    {
                        _oproducto = oproductos.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {


            }
            return _oproducto;
        }
        private DynamicParameters SetParameters(ProductosMod oproducto, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@idProducto", oproducto.idProducto);
            parameters.Add("@producto", oproducto.producto);
            parameters.Add("@idMarca", oproducto.idMarca);
            parameters.Add("@descripcion", oproducto.descripcion);
            parameters.Add("@imagen", oproducto.imagen);
            parameters.Add("@precio_costo", oproducto.precio_costo);
            parameters.Add("@precio_venta", oproducto.precio_venta);
            parameters.Add("@existencia", oproducto.existencia);
            parameters.Add("@fecha_ingreso", oproducto.fecha_ingreso);
            parameters.Add("@OPC", opcSP);
            parameters.Add("@cMensaje", opcSP);
            return parameters;
        }
    }
}
