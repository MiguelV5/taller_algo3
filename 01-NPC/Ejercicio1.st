!classDefinition: #CarolinaLaCuranderaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeSkyrim class
	instanceVariableNames: 'frasesParaPersonajesPrometedores frasesParaPersonajesDesconocidos cantidadDeInteracciones almacenadorDeInteracciones'!

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'MV 9/28/2021 02:24:43'!
interactuarCon: unPersonajeJugador

	self incrementarInteraccionesPara: unPersonajeJugador .
	^self responderSegunCantidadDeInteraccionesCon: unPersonajeJugador.
! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'MV 9/30/2021 01:23:10'!
olvidar
	almacenadorDeInteracciones := Dictionary new.
	cantidadDeInteracciones := 1! !


!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MV 9/28/2021 02:24:43'!
incrementarInteraccionesPara: unPersonajeJugador

	| cantidadActualDeInteraccionesPorPersonaje |
	cantidadActualDeInteraccionesPorPersonaje := almacenadorDeInteracciones at: unPersonajeJugador ifAbsent: [0].
	almacenadorDeInteracciones at: unPersonajeJugador put: cantidadActualDeInteraccionesPorPersonaje + 1.! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MV 9/30/2021 01:33:09'!
responderSegunCantidadDeInteraccionesCon: unPersonajeJugador

	cantidadDeInteracciones  := almacenadorDeInteracciones at: unPersonajeJugador .
	
	cantidadDeInteracciones > 3 ifTrue: [
		CarolinaLaCuranderaDeSkyrim olvidar.
	]. 

	unPersonajeJugador indicarReputacionActual = 'prometedor' ifTrue: [
		^ frasesParaPersonajesPrometedores at: (cantidadDeInteracciones min: frasesParaPersonajesPrometedores size).	
	] 
	ifFalse: [
		cantidadDeInteracciones = 3 ifTrue: [
			Riverwood ascensoDeClasificacionParaForastero: unPersonajeJugador.	
			TreborElGuardiaDeSkyrim olvidar .
		].
		^ frasesParaPersonajesDesconocidos at: (cantidadDeInteracciones min: frasesParaPersonajesDesconocidos size)	
	].! !


!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'MV 9/30/2021 01:35:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPersonajesPrometedores := #('Salud aventurero!!' 'Toma esta p�cima que te har� crecer el pelo. Y cuando tengas una aflicci�n, ven a verme' ).
	frasesParaPersonajesDesconocidos := #('�Est�s enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicci�n, ven a verme' ).
	cantidadDeInteracciones := 1.
	almacenadorDeInteracciones := ((Dictionary new) add: (Hamilton->1); add: (Tirion->1); yourself).! !


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

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'MV 9/28/2021 02:43:00'!
definirReputacion: reputacionADefinir

	reputacion := reputacionADefinir.! !

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'MV 9/28/2021 01:58:32'!
indicarReputacionActual
	^reputacion .! !

!Hamilton class methodsFor: 'as yet unclassified' stamp: 'MV 9/30/2021 01:35:08'!
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
	
	Assert that: mensaje isEqualTo: '�Est�s enfermo forastero?'.! !

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
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '�Est�s enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '�Est�s enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '�Est�s enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '�Est�s enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.
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
	
	Assert that: mensaje isEqualTo: 'Toma esta p�cima que te har� crecer el pelo. Y cuando tengas una aflicci�n, ven a verme'.
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


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MV 9/28/2021 20:36:07'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	unPersonaje indicarReputacionActual = 'prometedor' ifTrue: [
		^ true.
	]
	ifFalse: [
		^ false.
	]! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MV 9/28/2021 02:37:56'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaLaCuranderaDeSkyrim olvidar .! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MV 9/28/2021 02:45:27'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Riverwood primeraClasificacionAlForastero: Hamilton .
	Riverwood  primeraClasificacionAlForastero: Tirion .! !

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
	
	Assert that: mensaje isEqualTo: '�Todo bien?'.! !

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
	
	Assert that: mensaje isEqualTo: '�Alg�n problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '�Alg�n problema?'.! !


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
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '�Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '�Alg�n problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '�Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '�Alg�n problema?'.
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

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MV 9/30/2021 01:01:33'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	Riverwood primeraClasificacionAlForastero: Hamilton .
	Riverwood  primeraClasificacionAlForastero: Tirion .! !

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

!Riverwood class methodsFor: 'ClasificacionDeReputaciones' stamp: 'MV 9/28/2021 03:05:45'!
ascensoDeClasificacionParaForastero: unPersonajeJugador

	(unPersonajeJugador = Hamilton) | (unPersonajeJugador = Tirion) ifTrue: [ 
		unPersonajeJugador  definirReputacion: 'prometedor'	.
	]
! !

!Riverwood class methodsFor: 'ClasificacionDeReputaciones' stamp: 'MV 9/28/2021 02:35:29'!
primeraClasificacionAlForastero: unPersonajeJugador

	(unPersonajeJugador = Hamilton) | (unPersonajeJugador = Tirion) ifTrue: [ 
		unPersonajeJugador  definirReputacion: 'desconocido'	.
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

!Tirion class methodsFor: 'as yet unclassified' stamp: 'MV 9/28/2021 01:52:01'!
definirReputacion: reputacionADefinir

	reputacion := reputacionADefinir.! !

!Tirion class methodsFor: 'as yet unclassified' stamp: 'MV 9/28/2021 01:58:48'!
indicarReputacionActual
	^reputacion .! !

!Tirion class methodsFor: 'as yet unclassified' stamp: 'MV 9/30/2021 01:35:08'!
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
	instanceVariableNames: 'frasesParaPersonajesPrometedores frasesParaPersonajesDesconocidos cantidadDeInteracciones almacenadorDeInteracciones'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MV 9/28/2021 01:04:29'!
interactuarCon: unPersonajeJugador

	self incrementarInteraccionesPara: unPersonajeJugador .
	^self responderSegunCantidadDeInteraccionesCon: unPersonajeJugador.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MV 9/30/2021 01:23:21'!
olvidar
	almacenadorDeInteracciones := Dictionary new.
	cantidadDeInteracciones := 1.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MV 9/28/2021 00:55:40'!
incrementarInteraccionesPara: unPersonajeJugador

	| cantidadActualDeInteraccionesPorPersonaje |
	cantidadActualDeInteraccionesPorPersonaje := almacenadorDeInteracciones at: unPersonajeJugador ifAbsent: [0].
	almacenadorDeInteracciones at: unPersonajeJugador put: cantidadActualDeInteraccionesPorPersonaje + 1.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MV 9/28/2021 04:03:59'!
responderSegunCantidadDeInteraccionesCon: unPersonajeJugador

	cantidadDeInteracciones  := (almacenadorDeInteracciones at: unPersonajeJugador).
	
	unPersonajeJugador indicarReputacionActual = 'prometedor' ifTrue: [
		^ frasesParaPersonajesPrometedores at: (cantidadDeInteracciones min: frasesParaPersonajesPrometedores size).	
	] 
	ifFalse: [
		^ frasesParaPersonajesDesconocidos at: (cantidadDeInteracciones min: frasesParaPersonajesDesconocidos size)	
	].! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'MV 9/30/2021 01:35:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaPersonajesPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	frasesParaPersonajesDesconocidos := #('Hola forastero' '�Todo bien?' '�Alg�n problema?' ).
	cantidadDeInteracciones := 1.
	almacenadorDeInteracciones := ((Dictionary new)).! !

CarolinaLaCuranderaDeSkyrim initializeAfterFileIn!
Hamilton initializeAfterFileIn!
Tirion initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!