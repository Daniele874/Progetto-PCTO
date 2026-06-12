namespace WebApplicationF1.Models
{
    public class Scuderia
    {
        public int IdScuderia { get; set; }
        public string? Nome { get; set; }

        // two pilots per scuderia
        public int? IdPilota1 { get; set; }
        public int? IdPilota2 { get; set; }

        public string? Pilota1Nome { get; set; }
        public string? Pilota1Cognome { get; set; }
        public string? Pilota1Colore { get; set; }

        public string? Pilota2Nome { get; set; }
        public string? Pilota2Cognome { get; set; }
        public string? Pilota2Colore { get; set; }
    }
}