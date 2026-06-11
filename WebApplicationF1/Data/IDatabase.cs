using System.Collections.Generic;
using System.Threading.Tasks;

namespace WebApplicationF1.Data
{
    public interface IDatabase
    {
        Task<IEnumerable<T>> QueryAsync<T>(string sql, object? param = null);
        Task<T?> QueryFirstOrDefaultAsync<T>(string sql, object? param = null);
        Task<int> ExecuteAsync(string sql, object? param = null);
        Task<T> QuerySingleAsync<T>(string sql, object? param = null);
    }
}
