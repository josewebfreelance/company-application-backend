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
    public class MarcasDat : MarcasServi
    {
        MarcasMod _omarca = new MarcasMod();
        List<MarcasMod> _omarcas = new List<MarcasMod>();
        public string Delete(int idMarca)
        {
            
            try
            {
                _omarca = new MarcasMod()
                {
                    idmarca = idMarca
                };

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var omarcas = con.Query<MarcasMod>("SP_MARCAS", this.SetParameters(_omarca, (int)OpcionSP.Delete),
                        commandType: CommandType.StoredProcedure);

                   
                }

            }
            catch (Exception ex)
            {

                
            }

            return null;
        }

        public MarcasMod Get(int idMarca)
        {
            _omarca = new MarcasMod();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var omarcas = con.Query<MarcasMod>("SELECT *FROM MARCAS WHERE idMarca = " + idMarca).ToList();

                if (omarcas != null && omarcas.Count() > 0)
                {
                    _omarca = omarcas.SingleOrDefault();
                }
            }
            return _omarca;
        }

        public List<MarcasMod> Gets()
        {
            _omarcas = new List<MarcasMod>();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var omarcas = con.Query<MarcasMod>("SELECT *FROM MARCAS").ToList();

                if (omarcas != null && omarcas.Count() > 0)
                {
                    _omarcas = omarcas;
                }
            }
            return _omarcas;
        }

        public MarcasMod Save(MarcasMod oMarca)
        {
            _omarca = new MarcasMod();
            try
            {
                int opcSP = Convert.ToInt32(oMarca.idmarca == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var omarcas = con.Query<MarcasMod>("SP_MARCAS", this.SetParameters(oMarca, opcSP),

                        commandType: CommandType.StoredProcedure);

                    if (omarcas != null && omarcas.Count() > 0)
                    {
                        _omarca = omarcas.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {

                
            }
            return _omarca;
        }

        private DynamicParameters SetParameters(MarcasMod omarca, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@idmarca", omarca.idmarca);
            parameters.Add("@marca", omarca.marca);
            parameters.Add("@OPC", opcSP);
            return parameters;
        }
    }
}
