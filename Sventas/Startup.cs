using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Sventas.comun;
using Sventas.Data;
using Sventas.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sventas
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.Authority = "https://localhost:44388";
                //options.ClaimsIssuer = "myapi.com";
                //options.Audience = "myapi.com";
                options.SaveToken = true;
                options.TokenValidationParameters = new TokenValidationParameters
                {

                    ValidateAudience = true,
                    ValidAudience = "Audience",
                    ValidateIssuer = true,
                    ValidIssuer = "localhost:44388",
                    RequireExpirationTime = false,
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes("abcdefghi12345")),

                   
                };
                options.RequireHttpsMetadata = false;
            });

            services.AddSingleton<IConfiguration>(Configuration);
            Cglobal.ConnectionString = Configuration.GetConnectionString("dbEMPRESA");


            services.AddScoped<PuestosServ, PuestosDat>();
            services.AddScoped<MarcasServi, MarcasDat>();
            services.AddScoped<ClientesServi, ClientesData>();
            services.AddScoped<ProveedorServi, ProveedorDat>();
            services.AddScoped<ProductosServi, ProductosDat>();
            services.AddScoped<EmpleadosServi, EmpleadoDat>();
            services.AddScoped<VentasServi, VentasDat>();
            services.AddScoped<VentasDetalleServi, VentasDetalleDat>();
            services.AddScoped<ComprasServi, ComprasDat>();
            services.AddScoped<ComprasDetalleServi, ComprasDetalleDat>();
            services.AddScoped<LoginServi, LoginDat>();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            
            app.UseCors(
                options => options.SetIsOriginAllowed(x => _ = true).AllowAnyMethod().AllowAnyHeader().AllowCredentials()
            );

           

            app.UseHttpsRedirection();
           
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();


            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
