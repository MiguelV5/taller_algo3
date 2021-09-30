!classDefinition: #CarolinaLaCuranderaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeSkyrim class
	instanceVariableNames: 'frasesParaPersonajesPrometedores frasesParaPersonajesDesconocidos cantidadDeInteraccionesJugadorActual almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores'!

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'MV 9/30/2021 02:45:41'!
interactuarCon: unJugador

	self incrementarCantidadDeInteraccionesEnAlmacenadorPara: unJugador .
	^self responderSegunCantidadDeInteraccionesCon: unJugador.
! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'MV 9/30/2021 02:48:33'!
olvidar
	almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores := Dictionary new.
	cantidadDeInteraccionesJugadorActual := 1.! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'MV 9/30/2021 04:06:13'!
olvidarParaJugador: unJugador
	
	almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores at: unJugador put: 0 .! !


!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MV 9/30/2021 02:49:08'!
incrementarCantidadDeInteraccionesEnAlmacenadorPara: unJugador

	cantidadDeInteraccionesJugadorActual := almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores at: unJugador ifAbsent: [0].
	almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores at: unJugador put: cantidadDeInteraccionesJugadorActual + 1.! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MV 9/30/2021 04:08:28'!
responderSegunCantidadDeInteraccionesCon: unJugador

	cantidadDeInteraccionesJugadorActual  := almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores at: unJugador .
	
	unJugador indicarReputacionActual = 'prometedor' ifTrue: [
		^ frasesParaPersonajesPrometedores at: (cantidadDeInteraccionesJugadorActual min: frasesParaPersonajesPrometedores size).	
	] 
	ifFalse: [
		| cantidadDeInteraccionesPreviaAAscension |
		cantidadDeInteraccionesPreviaAAscension := cantidadDeInteraccionesJugadorActual .
		self verificacionDePosibleAscensoAPrometedor: unJugador .
		^ frasesParaPersonajesDesconocidos at: (cantidadDeInteraccionesPreviaAAscension min: frasesParaPersonajesDesconocidos size)	
	].! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MV 9/30/2021 04:06:59'!
verificacionDePosibleAscensoAPrometedor: unJugador

	cantidadDeInteraccionesJugadorActual = 3 ifTrue: [
			Riverwood ascensoDeClasificacionParaForastero: unJugador.	
		].! !


!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'MV 9/30/2021 04:10:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPersonajesPrometedores := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	frasesParaPersonajesDesconocidos := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	cantidadDeInteraccionesJugadorActual := 1.
	almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores := ((Dictionary new) add: (Hamilton->1); add: (Tirion->1); yourself).! !


!classDefinition: #Hamilton category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Hamilton
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Hamilton class' category: 'Ejercicio1-PNJ-Episodio2'!
Hamilton class
	instanceVariableNames: 'reputacion'!

!Hamilton class methodsFor: 'informacionPersonal' stamp: 'MV 9/28/2021 02:43:00'!
definirReputacion: reputacionADefinir

	reputacion := reputacionADefinir.! !

!Hamilton class methodsFor: 'informacionPersonal' stamp: 'MV 9/28/2021 01:58:32'!
indicarReputacionActual
	^reputacion .! !


!Hamilton class methodsFor: 'as yet unclassified' stamp: 'MV 9/30/2021 04:10:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	reputacion := 'desconocido'.! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'MV 9/28/2021 21:15:05'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'MV 9/28/2021 03:59:53'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'MV 9/28/2021 02:32:01'!
carolinaLaCurandera
	^CarolinaLaCuranderaDeSkyrim.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'MV 9/28/2021 02:32:10'!
hamilton
	^Hamilton .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'MV 9/28/2021 02:32:17'!
tirion
	^Tirion.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MV 9/30/2021 02:51:49'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^ unPersonaje indicarReputacionActual = 'prometedor' .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MV 9/28/2021 02:37:56'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaLaCuranderaDeSkyrim olvidar .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MV 9/30/2021 02:41:15'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Riverwood clasificarForasteroPorDefecto: Hamilton .
	Riverwood clasificarForasteroPorDefecto: Tirion .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MV 9/30/2021 01:02:07'!
hacerQueRiverwoodVeaPrometedorAHamilton
	Riverwood ascensoDeClasificacionParaForastero: Hamilton .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MV 9/30/2021 01:06:31'!
olvidarInteraccionesYOpiniones
	PruebasInteracionesConTreborElGuardia  hacerQueElGuardiaOlvideSusInteracciones .
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'MV 9/28/2021 00:22:42'!
hamilton
	^Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'MV 9/28/2021 00:25:08'!
tirion
	^Tirion.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MV 9/30/2021 02:41:26'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Riverwood clasificarForasteroPorDefecto: Hamilton .
	Riverwood  clasificarForasteroPorDefecto: Tirion .! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MV 9/30/2021 01:01:46'!
hacerQueRiverwoodVeaPrometedorAHamilton
	Riverwood ascensoDeClasificacionParaForastero: Hamilton .! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #Riverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Riverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Riverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
Riverwood class
	instanceVariableNames: ''!

!Riverwood class methodsFor: 'ClasificacionDeReputaciones' stamp: 'MV 9/30/2021 04:07:07'!
ascensoDeClasificacionParaForastero: unJugador

	(unJugador = Hamilton) | (unJugador = Tirion) ifTrue: [ 
		unJugador  definirReputacion: 'prometedor'	.
		TreborElGuardiaDeSkyrim olvidarParaJugador: unJugador .
		CarolinaLaCuranderaDeSkyrim olvidarParaJugador: unJugador .
	]
! !

!Riverwood class methodsFor: 'ClasificacionDeReputaciones' stamp: 'MV 9/30/2021 02:40:33'!
clasificarForasteroPorDefecto: unJugador

	(unJugador = Hamilton) | (unJugador = Tirion) ifTrue: [ 
		unJugador  definirReputacion: 'desconocido'	.
	]
! !


!classDefinition: #Tirion category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #Tirion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tirion class' category: 'Ejercicio1-PNJ-Episodio2'!
Tirion class
	instanceVariableNames: 'reputacion'!

!Tirion class methodsFor: 'informacionPersonal' stamp: 'MV 9/28/2021 01:52:01'!
definirReputacion: reputacionADefinir

	reputacion := reputacionADefinir.! !

!Tirion class methodsFor: 'informacionPersonal' stamp: 'MV 9/28/2021 01:58:48'!
indicarReputacionActual
	^reputacion .! !


!Tirion class methodsFor: 'as yet unclassified' stamp: 'MV 9/30/2021 04:10:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	reputacion := 'desconocido'.! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesParaPersonajesPrometedores frasesParaPersonajesDesconocidos cantidadDeInteraccionesJugadorActual almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MV 9/30/2021 02:28:10'!
interactuarCon: unJugador 
	
	self incrementarCantidadDeInteraccionesEnAlmacenadorPara: unJugador .
	^self responderSegunCantidadDeInteraccionesCon: unJugador.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MV 9/30/2021 02:18:44'!
olvidar
	almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores := Dictionary new.
	cantidadDeInteraccionesJugadorActual := 1.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MV 9/30/2021 04:05:59'!
olvidarParaJugador: unJugador
	
	almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores at: unJugador put: 0 .! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MV 9/30/2021 02:27:23'!
incrementarCantidadDeInteraccionesEnAlmacenadorPara: unJugador

	cantidadDeInteraccionesJugadorActual := almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores at: unJugador ifAbsent: [0].
	almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores at: unJugador put: cantidadDeInteraccionesJugadorActual + 1.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MV 9/30/2021 01:54:06'!
responderSegunCantidadDeInteraccionesCon: unJugador

	cantidadDeInteraccionesJugadorActual  := (almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores at: unJugador).
	
	unJugador indicarReputacionActual = 'prometedor' ifTrue: [
		^ frasesParaPersonajesPrometedores at: (cantidadDeInteraccionesJugadorActual min: frasesParaPersonajesPrometedores size).	
	] 
	ifFalse: [
		^ frasesParaPersonajesDesconocidos at: (cantidadDeInteraccionesJugadorActual min: frasesParaPersonajesDesconocidos size)	
	].! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'MV 9/30/2021 04:10:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPersonajesPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	frasesParaPersonajesDesconocidos := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	cantidadDeInteraccionesJugadorActual := 1.
	almacenadorDeCantidadDeInteraccionesDeTodosLosJugadores := ((Dictionary new)).! !

CarolinaLaCuranderaDeSkyrim initializeAfterFileIn!
Hamilton initializeAfterFileIn!
Tirion initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!