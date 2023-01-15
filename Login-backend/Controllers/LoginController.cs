using Login_backend.Models;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace Login_backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly string connectionString;
        private readonly string MESSAGE_NOT_FOUND = "User Not Registered.";

        public LoginController(IConfiguration configuration)
        {
            _configuration = configuration;
            connectionString = _configuration.GetValue<string>("ConnectionStrings:dbConn");
        }

        [HttpPost]        
        [Route("Login")]
        public string Login(Login login)
        {
            string msg = string.Empty;

            using (var conn = new NpgsqlConnection(connectionString))
            {
                conn.Open();
                var sql = "SELECT username FROM public.login l INNER JOIN public.users u ON l.id = u.loginid " +
                    "WHERE l.username = '" + login.Username + "' " +
                    "AND l.password = '" + login.Password + "'";
               
                try
                {
                    var cmd = new NpgsqlCommand(sql, conn);
                    var dataReader = cmd.ExecuteReader();

                    while (dataReader.Read())
                    {
                        msg = dataReader.GetString(0) + " welcome back!";
                    }
                }
                catch (Exception ex)
                {
                    msg = ex.Message;
                }                
            }
            return string.IsNullOrEmpty(msg) ? MESSAGE_NOT_FOUND : msg;
        }
    }
}
