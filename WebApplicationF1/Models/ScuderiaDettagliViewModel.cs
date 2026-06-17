using System.ComponentModel.DataAnnotations;

namespace WebApplicationF1.Models
{
    public class ScuderiaDettagliViewModel
    {
        // Dati della scuderia principale
        public int IdScuderia { get; set; }
        public string NomeScuderia { get; set; }

        public int IdPilota1 { get; set; }
        public int IdPilota2 { get; set; }

        public Pilota Pilota1 { get; set; }
        public Pilota Pilota2 { get; set; }

        public int GpFatti { get; set; }
        public double Punti { get; set; }
        public int Podi { get; set; }
        public int Vittorie { get; set; }
        public int PolePosition { get; set; }
        public int CampioniDelMondo { get; set; }
    }
}