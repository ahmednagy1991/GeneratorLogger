using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GeneratorLogger.Database;

namespace GeneratorLogger.Controllers
{
    public class GeneratorLogsController : Controller
    {
        private HeatMonitorLoggerEntities db = new HeatMonitorLoggerEntities();

        // GET: GeneratorLogs
        public ActionResult Index()
        {
            var generatorLogs = db.GeneratorLogs.Include(g => g.Generator);
            return View(generatorLogs.ToList());
        }

        // GET: GeneratorLogs/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GeneratorLog generatorLog = db.GeneratorLogs.Find(id);
            if (generatorLog == null)
            {
                return HttpNotFound();
            }
            return View(generatorLog);
        }

        // GET: GeneratorLogs/Create
        public ActionResult Create()
        {
            ViewBag.FK_GeneratorId = new SelectList(db.Generators, "Id", "GeneratorName");
            return View();
        }

        // POST: GeneratorLogs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Temprature,FK_GeneratorId,Logging_date")] GeneratorLog generatorLog)
        {
            if (ModelState.IsValid)
            {
                db.GeneratorLogs.Add(generatorLog);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.FK_GeneratorId = new SelectList(db.Generators, "Id", "GeneratorName", generatorLog.FK_GeneratorId);
            return View(generatorLog);
        }

        // GET: GeneratorLogs/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GeneratorLog generatorLog = db.GeneratorLogs.Find(id);
            if (generatorLog == null)
            {
                return HttpNotFound();
            }
            ViewBag.FK_GeneratorId = new SelectList(db.Generators, "Id", "GeneratorName", generatorLog.FK_GeneratorId);
            return View(generatorLog);
        }

        // POST: GeneratorLogs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Temprature,FK_GeneratorId,Logging_date")] GeneratorLog generatorLog)
        {
            if (ModelState.IsValid)
            {
                db.Entry(generatorLog).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FK_GeneratorId = new SelectList(db.Generators, "Id", "GeneratorName", generatorLog.FK_GeneratorId);
            return View(generatorLog);
        }

        // GET: GeneratorLogs/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GeneratorLog generatorLog = db.GeneratorLogs.Find(id);
            if (generatorLog == null)
            {
                return HttpNotFound();
            }
            return View(generatorLog);
        }

        // POST: GeneratorLogs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            GeneratorLog generatorLog = db.GeneratorLogs.Find(id);
            db.GeneratorLogs.Remove(generatorLog);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
