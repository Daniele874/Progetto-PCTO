namespace WebApplicationF1.Models
{
    public class GaraRisultato
    {
        public int IdGara { get; set; }
        public int? IdPilota { get; set; }
        public string? Nome { get; set; }
        public string? Cognome { get; set; }
        public int? Piazzamento { get; set; }
        public string? Colore { get; set; }
        public string? Nazionalita { get; set; }
        public string? DataDiNascita { get; set; }
        public double? GiroPiuVeloce { get; set; }
    }
}