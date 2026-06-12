using System.Collections.Generic;

namespace WebApplicationF1.Models
{
    public class GaraWithResults
    {
        public Gara Gara { get; set; } = new Gara();
        public List<GaraRisultato> Risultati { get; set; } = new List<GaraRisultato>();
        // Campionato color to style the gara box (may be null)
        public string? CampionatoColore { get; set; }
    }
}