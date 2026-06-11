using Microsoft.Data.SqlClient;
using Dapper;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace WebApplicationF1.Data
{
    public class Database : IDatabase
    {
        private readonly string _connStr;

        public Database(IConfiguration configuration)
        {
            _connStr = configuration.GetConnectionString("DefaultConnection") ?? "Server=.;Database=F1Db;Trusted_Connection=True;";
        }

        public async Task<IEnumerable<T>> QueryAsync<T>(string sql, object? param = null)
        {
            using var conn = new SqlConnection(_connStr);
            return await conn.QueryAsync<T>(sql, param);
        }

        public async Task<T?> QueryFirstOrDefaultAsync<T>(string sql, object? param = null)
        {
            using var conn = new SqlConnection(_connStr);
            return await conn.QueryFirstOrDefaultAsync<T>(sql, param);
        }

        public async Task<int> ExecuteAsync(string sql, object? param = null)
        {
            using var conn = new SqlConnection(_connStr);
            return await conn.ExecuteAsync(sql, param);
        }

        public async Task<T> QuerySingleAsync<T>(string sql, object? param = null)
        {
            using var conn = new SqlConnection(_connStr);
            return await conn.QuerySingleAsync<T>(sql, param);
        }
    }
}
