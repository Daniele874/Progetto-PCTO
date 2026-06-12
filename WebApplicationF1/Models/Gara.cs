namespace WebApplicationF1.Models
{
    public class Gara
    {
        public int IdGara { get; set; }
        public int? IdCampionato { get; set; }
        public string? Nome { get; set; }
        public string? DataGara { get; set; }
        public string? Stato { get; set; }
        public int? NumeroSponsor { get; set; }
        public string? Nazione { get; set; }
        public double? LunghezzaTracciato { get; set; }
        public int? NumeroGiri { get; set; }
        public string? Colore { get; set; }

        // Winner information (from GaraPiloti where piazzamento = 1)
        public int? WinnerId { get; set; }
        public string? WinnerNome { get; set; }
        public string? WinnerCognome { get; set; }
        public int? WinnerPiazzamento { get; set; }
    }
}