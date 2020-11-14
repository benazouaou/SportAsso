using first_site_web.dal;
using first_site_web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace first_site_web.Controllers
{
    public class DisciplineController : Controller
    {
        // GET: Discipline
        public ActionResult Index()
        {

            using (var context = new Model1Context())
            {
                List<Discipline> disciplineList = context.Disciplines.ToList();
                ViewBag.Disciplines = disciplineList;
            }

            return View();
        }
    }
}