using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplicationF1.Models
{
    public class StoricoScuderia
    {
        public int IdScuderia { get; set; }

        public int GpFatti { get; set; }
        public double Punti { get; set; } 
        public int Podi { get; set; }
        public int Vittorie { get; set; }
        public int PolePosition { get; set; }
        public int CampioniDelMondo { get; set; }
    }
}