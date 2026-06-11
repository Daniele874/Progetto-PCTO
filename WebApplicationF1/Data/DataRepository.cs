using WebApplicationF1.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace WebApplicationF1.Data
{
    public class DataRepository
    {
        private readonly IDatabase _db;
        public DataRepository(IDatabase db)
        {
            _db = db;
        }

        // Pilota methods
        public async Task<IEnumerable<Pilota>> GetPilotiAsync()
        {
            return await _db.QueryAsync<Pilota>("SELECT idPilota AS IdPilota, nome AS Nome, cognome AS Cognome, dataDiNascita AS DataDiNascita, nazionalita AS Nazionalita FROM dbo.pilota");
        }

        public async Task AddPilotaAsync(Pilota pilota)
        {
            await _db.ExecuteAsync("INSERT INTO dbo.pilota (nome, cognome, dataDiNascita, nazionalita) VALUES (@Nome, @Cognome, @DataDiNascita, @Nazionalita)", pilota);
        }

        public async Task UpdatePilotaAsync(Pilota pilota)
        {
            await _db.ExecuteAsync("UPDATE dbo.pilota SET nome=@Nome, cognome=@Cognome, dataDiNascita=@DataDiNascita, nazionalita=@Nazionalita WHERE idPilota=@IdPilota", pilota);
        }

        // Future: add methods for other entities here
    }
}
