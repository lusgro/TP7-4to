using System.Data.SqlClient;
using Dapper;
namespace TP7.Models;

public static class BD
{
    private static string _connectionString { get; set; } = @"Server=localhost;DataBase=PreguntadORT;Trusted_Connection=True;";

    public static List<Categoria> ObtenerCategorias()
    {
        string query = "SELECT * FROM Categoria";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.Query<Categoria>(query).ToList();
        }
    }

    public static List<Dificultad> ObtenerDificultades() 
    {
        string query = "SELECT * FROM Dificultad";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.Query<Dificultad>(query).ToList();
        }
    }

    public static string ObtenerFotoCategoria(int IdCategoria)
    {
        string query = "SELECT Foto FROM Categoria WHERE IdCategoria = @IdCategoria";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.Query<string>(query, new { IdCategoria = IdCategoria }).FirstOrDefault();
        }
    }

    public static List<Pregunta> ObtenerPreguntas(int? dificultad, int? categoria) {
        dificultad = dificultad == -1 ? null : dificultad;
        categoria = categoria == -1 ? null : categoria;
        string query = "SELECT * FROM Pregunta WHERE ((@Dificultad IS NULL OR IdDificultad = @Dificultad) AND (@Categoria IS NULL OR IdCategoria = @Categoria))";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.Query<Pregunta>(query, new { Dificultad = dificultad, Categoria = categoria}).ToList();
        }
    }

    // REVISAR RETURN
    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas) {
        List<Respuesta> respuestas = new List<Respuesta>();
        string query = "SELECT * FROM Respuesta WHERE IdPregunta = @IdPregunta";
        foreach (Pregunta pregunta in preguntas)
        {
            using(SqlConnection connection = new SqlConnection(_connectionString))
            {
                respuestas.AddRange(connection.Query<Respuesta>(query, new { IdPregunta = pregunta.IdPregunta }).ToList());
            }
        }
        return respuestas;
    }

    public static void ActualizarRanking(string usuario, int puntaje)
    {
        string query = "INSERT INTO Ranking (Nombre, Puntaje) VALUES (@Usuario, @Puntaje)";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            connection.Execute(query, new { Usuario = usuario, Puntaje = puntaje });
        }
    }

    public static List<Usuario> ObtenerRanking() {
        string query = "SELECT TOP 5 * FROM Ranking ORDER BY Puntaje DESC";
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            return connection.Query<Usuario>(query).ToList();
        }
    }
}