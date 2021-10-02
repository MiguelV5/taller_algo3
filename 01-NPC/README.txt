
▒▒▒▒▒▒▒▒▒▒▒▒  Notas adicionales de decisiones de diseño - EJERCICIO 1 _ NPC  ▒▒▒▒▒▒▒▒▒▒▒▒

    
    ▒▒▒▒  Acerca de colaboradores externos "unJugador"  ▒▒▒▒

        Decidimos elegir nombar al colaborador "unJugador" en los distintos metodos que lo reciben
        por encima de "unPersonajeJugador" tal como se había realizado una primera propuesta en clase ya que al
        momento de nombrar colaboradores internos relacionados a los personajes JUGABLES (JugadorHamilton, JugadorTirion)
        resultaban con nombres del tipo: 'almacenadorDeCantidadDeInteraccionesDeTodosLosPersonajesJugadores',
        lo cuál nos parecía demasiado largo y podia llegar a confundir, sabiendo que se podría abreviar a los personajes
        jugables directamente como "Jugadores", refiriendose a los Personajes Jugables de una manera concisa.
        
        Además recordando su caracteristica principal como "Jugador" decidimos no nombrarlo "Personaje" ya que se requiere
        una distinción entre los personajes no jugables (NPCS, como Trebor y Carolina) de los personajes jugables (Hamilton, Tirion). 

    ▒▒▒▒  Pruebas adicionales caseras por las dudas :)  ▒▒▒▒

        Usamos las siguientes pruebas en el workspace al finalizar todos los cambios que considerabamos necesarios.

        (CarolinaLaCuranderaDeSkyrim interactuarCon: JugadorHamilton) = '¿Estás enfermo forastero?' .
        (CarolinaLaCuranderaDeSkyrim interactuarCon: JugadorHamilton) = 'Ah, solo quieres conversar' . 

        (CarolinaLaCuranderaDeSkyrim interactuarCon: JugadorTirion ) = '¿Estás enfermo forastero?'. 

        (CarolinaLaCuranderaDeSkyrim interactuarCon: JugadorHamilton) = 'Cuando tengas una aflicción, ven a verme' . 
        JugadorHamilton indicarReputacionActual = 'prometedor'. 

        (CarolinaLaCuranderaDeSkyrim interactuarCon: JugadorTirion)='Ah, solo quieres conversar' .
        (CarolinaLaCuranderaDeSkyrim interactuarCon: JugadorHamilton)= 'Salud aventurero!'.
        (CarolinaLaCuranderaDeSkyrim interactuarCon: JugadorHamilton)= 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
        (CarolinaLaCuranderaDeSkyrim interactuarCon: JugadorTirion)= 'Cuando tengas una aflicción, ven a verme'.
        JugadorTirion indicarReputacionActual = 'prometedor'.	