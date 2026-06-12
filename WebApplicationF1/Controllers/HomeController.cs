using System.Diagnostics;
using System.Linq;
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
            try
            {
                var pilots = await _repo.GetPilotiAsync();
                return View(pilots);
            }
            catch (System.Exception ex)
            {
                try { System.IO.File.WriteAllText(System.IO.Path.Combine(System.AppContext.BaseDirectory, "piloti_error.txt"), ex.ToString()); } catch {}
                return Content("Errore interno: controlla piloti_error.txt nella cartella dell'app");
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddPilota(Pilota pilota)
        {
            if (!ModelState.IsValid)
                return RedirectToAction("Piloti");

            // Sanitize color before saving
            await _repo.AddPilotaAsync(pilota);
            return RedirectToAction("Piloti");
        }

        [HttpPost]
        public async Task<IActionResult> UpdatePilota(Pilota pilota)
        {
            if (!ModelState.IsValid)
                return RedirectToAction("Piloti");

            // Sanitize color before updating
            await _repo.UpdatePilotaAsync(pilota);
            return RedirectToAction("Piloti");
        }

        public async Task<IActionResult> Scuderie()
        {
            try
            {
                var scuderie = await _repo.GetScuderieAsync();
                return View(scuderie);
            }
            catch (System.Exception ex)
            {
                try { System.IO.File.WriteAllText(System.IO.Path.Combine(System.AppContext.BaseDirectory, "scuderie_error.txt"), ex.ToString()); } catch { }
                return Content("Errore interno: controlla scuderie_error.txt nella cartella dell'app");
            }
        }

        public async Task<IActionResult> Campionati()
        {
            try
            {
                var campionati = await _repo.GetCampionatiAsync();
                return View(campionati);
            }
            catch (System.Exception ex)
            {
                try { System.IO.File.WriteAllText(System.IO.Path.Combine(System.AppContext.BaseDirectory, "campionati_error.txt"), ex.ToString()); } catch { }
                return Content("Errore interno: controlla campionati_error.txt nella cartella dell'app");
            }
        }

        public async Task<IActionResult> Risultato(int id)
        {
            try
            {
                var gare = (await _repo.GetGareByCampionatoAsync(id)).ToList();
                var risultati = (await _repo.GetRisultatiByCampionatoAsync(id)).ToList();
                var camp = (await _repo.GetCampionatiAsync()).FirstOrDefault(c => c.IdCampionato == id);
                var campColor = camp?.Colore;

                var model = gare.Select(g => new GaraWithResults
                {
                    Gara = g,
                    Risultati = risultati.Where(r => r.IdGara == g.IdGara).OrderBy(r => r.Piazzamento).ToList(),
                    CampionatoColore = campColor
                }).ToList();

                return View(model);
            }
            catch (System.Exception ex)
            {
                try { System.IO.File.WriteAllText(System.IO.Path.Combine(System.AppContext.BaseDirectory, "risultato_error.txt"), ex.ToString()); } catch { }
                return Content("Errore interno: controlla risultato_error.txt nella cartella dell'app");
            }
        }

        public async Task<IActionResult> RisultatoGara(int id)
        {
            try
            {
                var model = await _repo.GetGaraConRisultatiAsync(id);
                if (model == null) return Content("Gara non trovata.");
                return View(model);
            }
            catch (System.Exception ex)
            {
                try { System.IO.File.WriteAllText(System.IO.Path.Combine(System.AppContext.BaseDirectory, "risultatogara_error.txt"), ex.ToString()); } catch { }
                return Content("Errore interno: controlla risultatogara_error.txt nella cartella dell'app");
            }
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
