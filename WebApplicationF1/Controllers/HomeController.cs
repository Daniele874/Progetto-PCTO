using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebApplicationF1.Models;
using WebApplicationF1.Data;

namespace WebApplicationF1.Controllers
{
    public class HomeController : Controller
    {
        private readonly DataRepository _repo;

        public HomeController(DataRepository repo)
        {
            _repo = repo;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public async Task<IActionResult> Piloti()
        {
            var pilots = await _repo.GetPilotiAsync();
            return View(pilots);
        }

        [HttpPost]
        public async Task<IActionResult> AddPilota(Pilota pilota)
        {
            if (!ModelState.IsValid)
                return RedirectToAction("Piloti");

            await _repo.AddPilotaAsync(pilota);
            return RedirectToAction("Piloti");
        }

        [HttpPost]
        public async Task<IActionResult> UpdatePilota(Pilota pilota)
        {
            if (!ModelState.IsValid)
                return RedirectToAction("Piloti");

            await _repo.UpdatePilotaAsync(pilota);
            return RedirectToAction("Piloti");
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
