using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using GeneratorLogger.Database;

namespace GeneratorLogger.Controllers
{
    public class LoggerController : ApiController
    {
        [System.Web.Http.HttpPost]
        public IHttpActionResult Log(long GID, int Temprature)
        {

            using (var db = new HeatMonitorLoggerEntities())
            {
                db.GeneratorLogs.Add(new GeneratorLog() {
                    FK_GeneratorId=GID,
                    Temprature=Temprature,
                    Logging_date=DateTime.Now
                });
                db.SaveChanges();
            }
            return Ok("Logged");
        }
    }
}
