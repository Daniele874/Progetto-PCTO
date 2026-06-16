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

        public async Task<IActionResult> Index()
        {
            try
            {
                var notizie = await _repo.GetNotiziAsync();
                return View(notizie);
            }
            catch (System.Exception ex)
            {
                try { System.IO.File.WriteAllText(System.IO.Path.Combine(System.AppContext.BaseDirectory, "notizie_error.txt"), ex.ToString()); } catch { }
                return Content("Errore interno: controlla notizie_error.txt");
            }
        }
        public async Task<IActionResult> Notizia(int id)
        {
            try
            { 
                var notizie = (await _repo.GetNotiziAsync()).OrderBy(n => n.IdNotizia).ToList();
                var notizia = notizie.FirstOrDefault(n => n.IdNotizia == id);
                if (notizia == null) return Content("Notizia non trovata.");
                return View(notizia);
            }
            catch (System.Exception ex)
            {
                try { System.IO.File.WriteAllText(System.IO.Path.Combine(System.AppContext.BaseDirectory, "notizia_error.txt"), ex.ToString()); } catch { }
                return Content("Errore interno: controlla notizia_error.txt");
            }
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

        public async Task<IActionResult> StoricoPilota(int id)
        {
            try
            {
                var pilots = await _repo.GetPilotiAsync();
                var pil = pilots.FirstOrDefault(p => p.IdPilota == id);
                if (pil == null) return Content("Pilota non trovato.");

                var storicoList = (await _repo.GetStoricoByPilotaAsync(id))?.ToList() ?? new List<StoricoPilota>();
                System.Diagnostics.Debug.WriteLine($"DEBUG: Storico count for Id {id}: {storicoList.Count}");
                foreach (var s in storicoList)
                {
                    System.Diagnostics.Debug.WriteLine($"DEBUG: Storico -> IdPilota:{s.IdPilota}, Podi:{s.Podi}, Punti:{s.Punti}");
                }

                var model = new PilotaStoricoViewModel
                {
                    Pilota = pil,
                    Storico = storicoList
                };

                return View(model);
            }
            catch (System.Exception ex)
            {
                try { System.IO.File.WriteAllText(System.IO.Path.Combine(System.AppContext.BaseDirectory, "storico_pilota_error.txt"), ex.ToString()); } catch { }
                return Content("Errore interno: controlla storico_pilota_error.txt nella cartella dell'app");
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

        public async Task<IActionResult> ScuderiaDetails(int id)
        {
            try
            {
                // 1. Recupera tutte le scuderie e cerca quella cliccata
                var scuderie = await _repo.GetScuderieAsync();
                var sc = scuderie.FirstOrDefault(s => s.IdScuderia == id);
                if (sc == null) return Content("Scuderia non trovata.");
                var piloti = await _repo.GetPilotiAsync();
                var storiciScuderie = await _repo.GetStoricoScuderieAsync(); 

                // 3. Estrai i dati specifici per questa scuderia
                var pilota1 = piloti.FirstOrDefault(p => p.IdPilota == sc.IdPilota1);
                var pilota2 = piloti.FirstOrDefault(p => p.IdPilota == sc.IdPilota2);
                var storico = storiciScuderie.FirstOrDefault(st => st.IdScuderia == id);

                var modelCompleto = new ScuderiaDettagliViewModel
                {
                    IdScuderia = sc.IdScuderia,
                    NomeScuderia = sc.Nome,
                    Pilota1 = pilota1,
                    Pilota2 = pilota2,
                    GpFatti = storico?.GpFatti ?? 0,
                    Punti = storico?.Punti ?? 0,
                    Podi = storico?.Podi ?? 0,
                    Vittorie = storico?.Vittorie ?? 0,
                    PolePosition = storico?.PolePosition ?? 0,
                    CampioniDelMondo = storico?.CampioniDelMondo ?? 0
                };

                return View(modelCompleto);
            }
            catch (System.Exception ex)
            {
                try { System.IO.File.WriteAllText(System.IO.Path.Combine(System.AppContext.BaseDirectory, "scuderia_details_error.txt"), ex.ToString()); } catch { }
                return Content("Errore interno: controlla scuderia_details_error.txt nella cartella dell'app");
            }
        }

        public async Task<IActionResult> StoricoScuderia(int id)
        {
            var storici = await _repo.GetStoricoScuderieAsync();
            var storicoSingolo = storici.FirstOrDefault(st => st.IdScuderia == id);

            if (storicoSingolo == null) return Content("Dati storici non trovati per questa scuderia.");

            return View(storicoSingolo);
        }

        public async Task<IActionResult> Sponsor(string name)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(name)) return Content("Sponsor non specificato.");
                var sponsor = await _repo.GetSponsorByNameAsync(name);
                if (sponsor == null) return Content("Sponsor non trovato nel database.");
                return View(sponsor);
            }
            catch (System.Exception ex)
            {
                try { System.IO.File.WriteAllText(System.IO.Path.Combine(System.AppContext.BaseDirectory, "sponsor_error.txt"), ex.ToString()); } catch { }
                return Content("Errore interno: controlla sponsor_error.txt nella cartella dell'app");
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
