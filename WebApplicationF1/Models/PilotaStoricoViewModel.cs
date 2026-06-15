using System.Collections.Generic;
using System.Linq;

namespace WebApplicationF1.Models
{
    public class PilotaStoricoViewModel
    {
        public Pilota Pilota { get; set; } = null!;
        public IEnumerable<StoricoPilota> Storico { get; set; } = new List<StoricoPilota>();

        public bool HasStorico => Storico != null && Storico.Any();
        public StoricoPilota? LatestSeason => Storico?.FirstOrDefault();
    }
}
