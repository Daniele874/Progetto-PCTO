using WebApplicationF1.Models;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

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
            try
            {
                return await _db.QueryAsync<Pilota>("SELECT idPilota AS IdPilota, nome AS Nome, cognome AS Cognome, dataDiNascita AS DataDiNascita, nazionalita AS Nazionalita, colore AS Colore FROM dbo.pilota");
            }
            catch (Microsoft.Data.SqlClient.SqlException ex) when (ex.Number == 207)
            {
                // Column 'colore' missing - fallback to query without it to avoid crashing at runtime.
                var list = await _db.QueryAsync<Pilota>("SELECT idPilota AS IdPilota, nome AS Nome, cognome AS Cognome, dataDiNascita AS DataDiNascita, nazionalita AS Nazionalita FROM dbo.pilota");
                // Ensure Colore is null for all
                return list.Select(p => { p.Colore = null; return p; });
            }
        }

        public async Task AddPilotaAsync(Pilota pilota)
        {
                    await _db.ExecuteAsync("INSERT INTO dbo.pilota (nome, cognome, dataDiNascita, nazionalita, colore) VALUES (@Nome, @Cognome, @DataDiNascita, @Nazionalita, @Colore)", pilota);
        }

        public async Task UpdatePilotaAsync(Pilota pilota)
        {
                    await _db.ExecuteAsync("UPDATE dbo.pilota SET nome=@Nome, cognome=@Cognome, dataDiNascita=@DataDiNascita, nazionalita=@Nazionalita, colore=@Colore WHERE idPilota=@IdPilota", pilota);
        }

        // Future: add methods for other entities here

        public async Task<IEnumerable<Scuderia>> GetScuderieAsync()
        {
            try
            {
                return await _db.QueryAsync<Scuderia>("SELECT s.idScuderia AS IdScuderia, s.nome AS Nome, p.idPilota AS IdPilota, p.nome AS PilotaNome, p.cognome AS PilotaCognome FROM dbo.Scuderia s LEFT JOIN dbo.Pilota p ON s.idPilota = p.idPilota");
            }
            catch (Microsoft.Data.SqlClient.SqlException)
            {
                return new List<Scuderia>();
            }
        }

        public async Task<IEnumerable<Campionato>> GetCampionatiAsync()
        {
            try
            {
                return await _db.QueryAsync<Campionato>("SELECT idCampionato AS IdCampionato, anno AS Anno, numeroGare AS NumeroGare, numeroScuderie AS NumeroScuderie, colore AS Colore FROM dbo.Campionato");
            }
            catch (Microsoft.Data.SqlClient.SqlException ex) when (ex.Number == 207)
            {
                // Column 'colore' might be missing in older DBs: fallback to query without it.
                var list = await _db.QueryAsync<Campionato>("SELECT idCampionato AS IdCampionato, anno AS Anno, numeroGare AS NumeroGare, numeroScuderie AS NumeroScuderie FROM dbo.Campionato");
                return list.Select(c => { c.Colore = null; return c; });
            }
            catch (Microsoft.Data.SqlClient.SqlException)
            {
                return new List<Campionato>();
            }
        }

        public async Task<IEnumerable<Gara>> GetGareByCampionatoAsync(int idCampionato)
        {
            try
            {
                // Select gare and left-join winner (piazzamento = 1) info from GaraPiloti and Pilota
                var sql = @"SELECT g.idGara AS IdGara,
                                    g.idCampionato AS IdCampionato,
                                    g.nome AS Nome,
                                    g.dataGara AS DataGara,
                                    g.stato AS Stato,
                                    g.numeroSponsor AS NumeroSponsor,
                                    g.nazione AS Nazione,
                                    g.lunghezzaTracciato AS LunghezzaTracciato,
                                    g.numeroGiri AS NumeroGiri,
                                    g.colore AS Colore,
                                    gp.idPilota AS WinnerId,
                                    p.nome AS WinnerNome,
                                    p.cognome AS WinnerCognome,
                                    gp.piazzamento AS WinnerPiazzamento
                             FROM dbo.Gara g
                             LEFT JOIN dbo.GaraPiloti gp ON g.idGara = gp.idGara AND gp.piazzamento = 1
                             LEFT JOIN dbo.Pilota p ON gp.idPilota = p.idPilota
                             WHERE g.idCampionato = @IdCampionato";

                return await _db.QueryAsync<Gara>(sql, new { IdCampionato = idCampionato });
            }
            catch (Microsoft.Data.SqlClient.SqlException)
            {
                return new List<Gara>();
            }
        }

        public async Task<IEnumerable<GaraRisultato>> GetRisultatiByCampionatoAsync(int idCampionato)
        {
            try
            {
                var sql = @"SELECT g.idGara AS IdGara,
                                   gp.idPilota AS IdPilota,
                                   p.nome AS Nome,
                                   p.cognome AS Cognome,
                                   gp.piazzamento AS Piazzamento,
                                   p.colore AS Colore,
                                   p.nazionalita AS Nazionalita,
                                   p.dataDiNascita AS DataDiNascita,
                                   gp.giroPiuVeloce AS GiroPiuVeloce
                            FROM dbo.Gara g
                            INNER JOIN dbo.GaraPiloti gp ON g.idGara = gp.idGara
                            LEFT JOIN dbo.Pilota p ON gp.idPilota = p.idPilota
                            WHERE g.idCampionato = @IdCampionato";

                return await _db.QueryAsync<GaraRisultato>(sql, new { IdCampionato = idCampionato });
            }
            catch (Microsoft.Data.SqlClient.SqlException)
            {
                return new List<GaraRisultato>();
            }
        }

        // Get single gara with its risultati
        public async Task<GaraWithResults> GetGaraConRisultatiAsync(int idGara)
        {
            try
            {
                var sqlGara = @"SELECT idGara AS IdGara, idCampionato AS IdCampionato, nome AS Nome, dataGara AS DataGara, stato AS Stato, numeroSponsor AS NumeroSponsor, nazione AS Nazione, lunghezzaTracciato AS LunghezzaTracciato, numeroGiri AS NumeroGiri, colore AS Colore FROM dbo.Gara WHERE idGara = @IdGara";
                var gara = (await _db.QueryAsync<Gara>(sqlGara, new { IdGara = idGara })).FirstOrDefault();
                if (gara == null) return null;

                var sqlRes = @"SELECT gp.idPilota AS IdPilota, p.nome AS Nome, p.cognome AS Cognome, gp.piazzamento AS Piazzamento, p.colore AS Colore, p.nazionalita AS Nazionalita, p.dataDiNascita AS DataDiNascita, gp.giroPiuVeloce AS GiroPiuVeloce FROM dbo.GaraPiloti gp LEFT JOIN dbo.Pilota p ON gp.idPilota = p.idPilota WHERE gp.idGara = @IdGara";
                var risultati = (await _db.QueryAsync<GaraRisultato>(sqlRes, new { IdGara = idGara })).ToList();

                return new GaraWithResults { Gara = gara, Risultati = risultati, CampionatoColore = gara?.Colore };
            }
            catch (Microsoft.Data.SqlClient.SqlException)
            {
                return null;
            }
        }
    }
}
