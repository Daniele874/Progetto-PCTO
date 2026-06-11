using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebApplicationF1.Models;

namespace WebApplicationF1.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Piloti()
        {
            return View();
        }

        public IActionResult Scuderie()
        {
            return View();
        }

        public IActionResult Campionati()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
