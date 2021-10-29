using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Sventas.comun;
using Sventas.Data;
using Sventas.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
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

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
