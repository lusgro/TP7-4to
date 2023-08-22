using Microsoft.AspNetCore.Mvc;
using TP7.Models;

namespace TP7.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.Categorias = Juego.ObtenerCategorias();
        ViewBag.Dificultades = Juego.ObtenerDificultades();
        return View();
    }

    public IActionResult Comenzar(string usuario, int dificultad, int categoria)
    {
        Juego.CargarPartida(usuario, dificultad, categoria);
        if (Juego.ObtenerProximaPregunta() != null)
        {
            return RedirectToAction("Jugar");
        }
        else
        {
            return RedirectToAction("ConfigurarJuego");
        }
    }

    public IActionResult Jugar()
    {
        if (Juego.ObtenerProximaPregunta() != null)
        {
            ViewBag.Pregunta = Juego.ObtenerProximaPregunta();
            ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.Pregunta.IdPregunta);
            ViewBag.CatFoto = Juego.ObtenerFotoCategoria(ViewBag.Pregunta.IdCategoria);
            ViewBag.Puntaje = Juego.ObtenerPuntaje();
            return View("Juego");
        }
        else
        {
            Juego.ActualizarRanking();
            ViewBag.Usuario = Juego.ObtenerNombreUsuario();
            ViewBag.Puntaje = Juego.ObtenerPuntaje();
            ViewBag.Ranking = Juego.ObtenerRanking();
            return View("Fin");
        }
    }

    [HttpPost]
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        if (Juego.VerificarRespuesta(idPregunta, idRespuesta))
        {
            ViewBag.Conclusion = "Correcta";
            ViewBag.Mensaje = "Sumaste 10 puntos";
            ViewBag.Color = "#065535";
        }
        else
        {
            ViewBag.Conclusion = "Incorrecta";
            ViewBag.Mensaje = $"La respuesta correcta era: {Juego.ObtenerRespuestaCorrecta(idPregunta)}";
            ViewBag.Color = "#cc0000";
        }
        return View("Respuesta");
    }
}
