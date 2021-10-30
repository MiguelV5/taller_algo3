!classDefinition: #MarsRoverTest category: 'Ejercicio-05-MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 01:03:58'!
setUp
	
	marsRover := MarsRover with: 0@0 facingTowards: #North .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 03:22:37'!
test01StartingPointsAreNotModifiedIfThereIsNoCommandSent
	"chequear si es relevante"
	|expectedStartingPlacementPoint expectedStartingCardinalPoint |
	expectedStartingPlacementPoint:= (0@0).
	expectedStartingCardinalPoint :=#North.
	self assert:expectedStartingPlacementPoint equals:(marsRover currentPlacementPoint).
	self assert: expectedStartingCardinalPoint equals:(marsRover currentCardinalPoint).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 03:24:39'!
test02ifCommandBeginsWithInvalidCharacterMarsRoverRemainsInPlace

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	command := ' h'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	expectedCurrentCardinalPoint := #North.
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 03:25:46'!
test03failsIfCommandIsEmpty

	self  should: [marsRover processCommand: ''] 
		raise: Error  
		withExceptionDo: [:anError | self assert: anError messageText equals: 	MarsRover emptyCommandErrorDescription ].
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 03:28:58'!
test04ifOnlyOneValidCommandOfMovementIsSentMarsRoverMoves

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	command := 'f'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@1).
	expectedCurrentCardinalPoint := #North.
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .
	! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 03:30:07'!
test05ifManyValidCommandsOfMovementAreSentMarsRoverMoves

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	command := 'bf'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	expectedCurrentCardinalPoint := #North.
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 03:30:41'!
test06ifOnlyOneValidCommandOfRotationIsSentMarsRoverRotates

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	command := 'l'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	expectedCurrentCardinalPoint := #West.
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 03:31:47'!
test07ifManyValidCommandsOfRotationAreSentMarsRoverRotates

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	command := 'rlrlrl'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	expectedCurrentCardinalPoint := #North.
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .! !


!classDefinition: #MarsRover category: 'Ejercicio-05-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentCardinalPoint currentPlacementPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 01:12:25'!
currentCardinalPoint
	
	^currentCardinalPoint! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 02:28:12'!
currentPlacementPoint
	
	^currentPlacementPoint ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 03:18:49'!
executeActionAccordingTo: aOneCharacterString
	
	aOneCharacterString = 'f' 
	ifTrue: [currentPlacementPoint := currentPlacementPoint + (0@1)].
	
	aOneCharacterString = 'b' 
	ifTrue: [currentPlacementPoint :=currentPlacementPoint - (0@1)]. 
	
	aOneCharacterString = 'l' 
	ifTrue: [
		currentCardinalPoint = #North
		ifTrue:[^currentCardinalPoint :=#West].
		
		currentCardinalPoint = #West
		ifTrue:[^currentCardinalPoint := #South].
		
		currentCardinalPoint = #South
		ifTrue:[^currentCardinalPoint := #East].
		
		currentCardinalPoint = #East
		ifTrue:[^currentCardinalPoint := #North]].
	
	aOneCharacterString = 'r' 
	ifTrue: [currentCardinalPoint = #North
		ifTrue:[^currentCardinalPoint := #East].
		
		currentCardinalPoint = #West
		ifTrue:[^currentCardinalPoint := #North].
		
		currentCardinalPoint = #South
		ifTrue:[^currentCardinalPoint := #West].
		
		currentCardinalPoint = #East
		ifTrue:[^currentCardinalPoint := #South]].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 01:00:53'!
initializeWith: aStartingPoint andFacingTowards: aCardinalPoint

	currentCardinalPoint:= aCardinalPoint .
	currentPlacementPoint:=aStartingPoint .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 02:55:05'!
processCommand: aString 

	|currentIndex|
	
	aString ifEmpty:[ self error: self class emptyCommandErrorDescription].
	currentIndex:=1.
	aString size timesRepeat: [
		(self verifyIfCommandIn: aString isValidIn: currentIndex )
		ifTrue:[self executeActionAccordingTo: (aString at: currentIndex) asString ] 
		ifFalse:[^self].
		currentIndex := currentIndex+1
		]! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 02:46:36'!
verifyIfCommandIn: aString isValidIn: anIndex

	^(((aString at: anIndex ) asString =  'f') | ((aString at: anIndex ) asString = 'b' )| ((aString at: anIndex ) asString ='l') | (( aString at: anIndex )asString ='r'))! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-05-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'pb 10/30/2021 00:58:40'!
with: aStartingPoint facingTowards: aCardinalPoint

	^self new initializeWith: aStartingPoint andFacingTowards: aCardinalPoint .
! !


!MarsRover class methodsFor: 'errors' stamp: 'pb 10/30/2021 01:29:54'!
emptyCommandErrorDescription
	 
	^'El comando recibido es vacio'! !
