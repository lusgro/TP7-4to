namespace TP7.Models
{
    public static class Juego
    {
        public static string username {get; set;}
        private static int _puntajeActual {get; set;}
        private static int _cantidadPreguntasCorrectas {get; set;}
        private static List<Pregunta> _preguntas {get; set;}
        private static List<Respuesta> _respuestas {get; set;}

        public static void InicializarJuego()
        {
            username = "";
            _puntajeActual = 0;
            _cantidadPreguntasCorrectas = 0;
            _preguntas = new List<Pregunta>();
            _respuestas = new List<Respuesta>();
        }

        public static List<Categoria> ObtenerCategorias()
        {
            return BD.ObtenerCategorias();
        }

        public static List<Dificultad> ObtenerDificultades()
        {
            return BD.ObtenerDificultades();
        }

        public static string ObtenerFotoCategoria(int IdCategoria)
        {
            return BD.ObtenerFotoCategoria(IdCategoria);
        }

        public static void CargarPartida(string usuario, int dificultad, int categoria)
        {
            username = usuario;
            _preguntas = BD.ObtenerPreguntas(dificultad, categoria);
            _respuestas = BD.ObtenerRespuestas(_preguntas);
        }

        public static Pregunta? ObtenerProximaPregunta()
        {
            if (_preguntas.Count == 0) return null;
            else {
            Random random = new Random();
            int index = random.Next(0, _preguntas.Count);
            return _preguntas[index];
            }
        }
        
        public static List<Respuesta> ObtenerProximasRespuestas(int IdPregunta)
        {
            List<Respuesta> proximasRespuestas = new List<Respuesta>();
            foreach (Respuesta respuesta in _respuestas)
            {
                if (respuesta.IdPregunta == IdPregunta)
                {
                    proximasRespuestas.Add(respuesta);
                }
            }
            return proximasRespuestas;
        }

        public static int ObtenerPuntaje()
        {
            return _puntajeActual;
        }

        public static string ObtenerNombreUsuario()
        {
            return username;
        }

        public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
        {
            foreach (Respuesta respuesta in _respuestas)
            {
                if (respuesta.IdPregunta == idPregunta && respuesta.IdRespuesta == idRespuesta)
                {
                    _preguntas.Remove(_preguntas.Find(pregunta => pregunta.IdPregunta == idPregunta));
                    if (respuesta.Correcta)
                    {
                        _puntajeActual += 10;
                        _cantidadPreguntasCorrectas++;
                        return true;
                    }
                    else return false;
                }
            }
            return false;
        }

        public static string ObtenerRespuestaCorrecta(int idPregunta)
        {
            foreach (Respuesta respuesta in _respuestas)
            {
                if (respuesta.IdPregunta == idPregunta && respuesta.Correcta)
                {
                    _preguntas.Remove(_preguntas.Find(pregunta => pregunta.IdPregunta == idPregunta));
                    return respuesta.Contenido;
                }
            }
            return null;
        }

        public static void ActualizarRanking()
        {
            BD.ActualizarRanking(username, _puntajeActual);
        }

        public static List<Usuario> ObtenerRanking()
        {
            return BD.ObtenerRanking();
        }
    }
}