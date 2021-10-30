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
   
    
    public class LoginDat : LoginServi
    {

        LoginMod _login = new LoginMod();
        public LoginMod Save(LoginMod oLogin)
        {
            _login = new LoginMod();
            try
            {
                int opcSP = Convert.ToInt32(oLogin.idUsuario == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var ologin = con.Query<LoginMod>("SP_LOGIN", this.SetParameters(oLogin, opcSP),

                        commandType: CommandType.StoredProcedure);

                    if (ologin != null && ologin.Count() > 0)
                    {
                        _login = ologin.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {


            }
            return _login;
        }
        private DynamicParameters SetParameters(LoginMod ologin, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            
            parameters.Add("@usuario", ologin.usuario);
            parameters.Add("@contraseña", ologin.contraseña);
            parameters.Add("@OPC", opcSP);
            return parameters;
        }
    }
}
