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
    public class GeneratorsController : Controller
    {
        private HeatMonitorLoggerEntities db = new HeatMonitorLoggerEntities();

        // GET: Generators
        public ActionResult Index()
        {
            return View(db.Generators.ToList());
        }

        // GET: Generators/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Generator generator = db.Generators.Find(id);
            if (generator == null)
            {
                return HttpNotFound();
            }
            return View(generator);
        }

        // GET: Generators/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Generators/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,GeneratorName,Latitude,longitude")] Generator generator)
        {
            if (ModelState.IsValid)
            {
                db.Generators.Add(generator);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(generator);
        }

        // GET: Generators/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Generator generator = db.Generators.Find(id);
            if (generator == null)
            {
                return HttpNotFound();
            }
            return View(generator);
        }

        // POST: Generators/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,GeneratorName,Latitude,longitude")] Generator generator)
        {
            if (ModelState.IsValid)
            {
                db.Entry(generator).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(generator);
        }

        // GET: Generators/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Generator generator = db.Generators.Find(id);
            if (generator == null)
            {
                return HttpNotFound();
            }
            return View(generator);
        }

        // POST: Generators/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            Generator generator = db.Generators.Find(id);
            db.Generators.Remove(generator);
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
