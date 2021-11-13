!classDefinition: #MarsRoverTest category: 'Ejercicio-05-MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!MarsRoverTest methodsFor: 'setUp/tearDown' stamp: 'pb 10/30/2021 01:03:58'!
setUp
	
	marsRover := MarsRover with: 0@0 facingTowards: #North .! !


!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 02:35:30'!
test01FailsIfCommandBeginsWithInvalidCharacter
	
	self  should: [marsRover processCommand: ' hfbrl'] 
		raise: Error  
		withExceptionDo: [:anError | self assert: anError messageText equals: 	MarsRover invalidCommandErrorDescription ].! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 02:36:36'!
test02FailsIfCommandIsEmpty

	self  should: [marsRover processCommand: ''] 
		raise: Error  
		withExceptionDo: [:anError | self assert: anError messageText equals: 	MarsRover invalidCommandErrorDescription ].
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 02:36:43'!
test03FailsIfGroupOfCommandsContainsInvalidCommandAfterSomeValidCommands
	
	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	
	command := 'ffrr x blr'.
	expectedCurrentPlacementPoint := (0@2).
	expectedCurrentCardinalPoint := #South.
	
	self  should: [marsRover processCommand: command] 
		raise: Error  
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: 	MarsRover invalidCommandErrorDescription. 
			self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
			self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .
		].

	
		
		! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 02:36:50'!
test04IfOnlyOneValidCommandOfMovementIsSentMarsRoverMoves

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	command := 'f'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@1).
	expectedCurrentCardinalPoint := #North.
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 02:36:57'!
test05IfManyValidCommandsOfMovementAreSentMarsRoverMoves

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	command := 'bf'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	expectedCurrentCardinalPoint := #North.
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 02:37:07'!
test06IfOnlyOneValidCommandOfRotationIsSentMarsRoverRotates

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	command := 'l'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	expectedCurrentCardinalPoint := #West.
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 02:37:14'!
test07IfManyValidCommandsOfRotationAreSentMarsRoverRotatesCorrectly

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	command := 'rrrl'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	expectedCurrentCardinalPoint := #South.
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 02:37:23'!
test08IfEnoughValidCommandsOfRotationAreSentForA360RotationMarsRoverRotatesCorrectly

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	
	command := 'rrrr'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	expectedCurrentCardinalPoint := #North.
	
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .
	
	command := 'llll'.
	marsRover processCommand: command .
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 02:37:32'!
test09IfManyCombinedCommandsAreSentMarsRoverActsAsExpected

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	
	command := 'ffrrblr'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@3).
	expectedCurrentCardinalPoint := #South.
	
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .
! !


!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 02:36:05'!
atest01StartingPointsAreNotModifiedIfThereIsNoCommandSent
	"chequear si es relevante"
	|expectedStartingPlacementPoint expectedStartingCardinalPoint |
	expectedStartingPlacementPoint:= (0@0).
	expectedStartingCardinalPoint :=#North.
	self assert:expectedStartingPlacementPoint equals:(marsRover currentPlacementPoint).
	self assert: expectedStartingCardinalPoint equals:(marsRover currentCardinalPoint).! !


!classDefinition: #Command category: 'Ejercicio-05-MarsRover'!
Object subclass: #Command
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!Command methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 03:22:30'!
evaluateA: aMarsRover accordingTo: aString

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: 'Ejercicio-05-MarsRover'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 03:44:10'!
verifyIfEmpty: aString

	self subclassResponsibility .
! !


!classDefinition: #EmptyCommand category: 'Ejercicio-05-MarsRover'!
Command subclass: #EmptyCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!EmptyCommand methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 03:48:51'!
evaluateA: aMarsRover accordingTo: aString

	aMarsRover proccessIfCommandIsIEmpty.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyCommand class' category: 'Ejercicio-05-MarsRover'!
EmptyCommand class
	instanceVariableNames: ''!

!EmptyCommand class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 03:44:10'!
verifyIfEmpty: aString

	^aString isEmpty = true .! !


!classDefinition: #NotEmptyCommand category: 'Ejercicio-05-MarsRover'!
Command subclass: #NotEmptyCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!NotEmptyCommand methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 03:48:32'!
evaluateA: aMarsRover accordingTo: aString

	aMarsRover proccessIfCommandIsNotEmpty: aString.
	
! !

!NotEmptyCommand methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 04:04:00'!
evaluateA: aMarsRover accordingTo: aString atIndex: anIndex

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyCommand class' category: 'Ejercicio-05-MarsRover'!
NotEmptyCommand class
	instanceVariableNames: ''!

!NotEmptyCommand class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 04:10:41'!
canHandle: aString atIndex: anIndex

	self subclassResponsibility ! !

!NotEmptyCommand class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 03:44:10'!
verifyIfEmpty: aString

	^aString isEmpty = false.
! !


!classDefinition: #NotEmptyInvalidCommand category: 'Ejercicio-05-MarsRover'!
NotEmptyCommand subclass: #NotEmptyInvalidCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!NotEmptyInvalidCommand methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 04:05:08'!
evaluateA: aMarsRover accordingTo: aString atIndex: anIndex

	aMarsRover proccessIfCommandIsInvalid.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyInvalidCommand class' category: 'Ejercicio-05-MarsRover'!
NotEmptyInvalidCommand class
	instanceVariableNames: ''!

!NotEmptyInvalidCommand class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 04:10:58'!
canHandle: aString atIndex: anIndex

	^( ((aString at: anIndex ) asString =  'f') | ((aString at: anIndex ) asString = 'b' )| ((aString at: anIndex ) asString ='l') | (( aString at: anIndex )asString ='r') ) = false.! !


!classDefinition: #NotEmptyValidCommand category: 'Ejercicio-05-MarsRover'!
NotEmptyCommand subclass: #NotEmptyValidCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!NotEmptyValidCommand methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 04:04:55'!
evaluateA: aMarsRover accordingTo: aString atIndex: anIndex

	aMarsRover proccessIfCommandIsValid: aString at: anIndex .

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyValidCommand class' category: 'Ejercicio-05-MarsRover'!
NotEmptyValidCommand class
	instanceVariableNames: ''!

!NotEmptyValidCommand class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 04:11:10'!
canHandle: aString atIndex: anIndex

	^( ((aString at: anIndex ) asString =  'f') | ((aString at: anIndex ) asString = 'b' )| ((aString at: anIndex ) asString ='l') | (( aString at: anIndex )asString ='r') ) = true.! !


!classDefinition: #MarsRover category: 'Ejercicio-05-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentCardinalPoint currentPlacementPoint ffff currentCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'MV 11/13/2021 03:47:26'!
initializeWith: aStartingPoint andFacingTowards: aCardinalPoint

	currentCardinalPoint:= aCardinalPoint .
	currentPlacementPoint:=aStartingPoint .
	currentCommand := EmptyCommand new.
! !


!MarsRover methodsFor: 'command proccesing - public' stamp: 'MV 11/13/2021 03:59:52'!
processCommand: aString 

	currentCommand := (Command subclasses detect: [:commandSubclass | commandSubclass verifyIfEmpty: aString ]) new.
	
	currentCommand evaluateA: self accordingTo: aString. 													"chan"
	
! !


!MarsRover methodsFor: 'accesing' stamp: 'pb 10/30/2021 01:12:25'!
currentCardinalPoint
	
	^currentCardinalPoint! !

!MarsRover methodsFor: 'accesing' stamp: 'pb 10/30/2021 02:28:12'!
currentPlacementPoint
	
	^currentPlacementPoint ! !


!MarsRover methodsFor: 'command proccessing - private' stamp: 'MV 11/13/2021 02:17:35'!
executeActionAccordingTo: aOneCharacterString
	
	aOneCharacterString = 'f' 
	ifTrue: [
		currentCardinalPoint = #North
		ifTrue:[^currentPlacementPoint := currentPlacementPoint + (0@1)].
		
		currentCardinalPoint = #West
		ifTrue:[^currentPlacementPoint := currentPlacementPoint - (1@0)].
		
		currentCardinalPoint = #South
		ifTrue:[^currentPlacementPoint := currentPlacementPoint - (0@1)].
		
		currentCardinalPoint = #East
		ifTrue:[^currentPlacementPoint := currentPlacementPoint + (1@0)].
	].
	
	aOneCharacterString = 'b' 
	ifTrue: [
		currentCardinalPoint = #North
		ifTrue:[^currentPlacementPoint := currentPlacementPoint - (0@1)].
		
		currentCardinalPoint = #West
		ifTrue:[^currentPlacementPoint := currentPlacementPoint + (1@0)].
		
		currentCardinalPoint = #South
		ifTrue:[^currentPlacementPoint := currentPlacementPoint + (0@1)].
		
		currentCardinalPoint = #East
		ifTrue:[^currentPlacementPoint := currentPlacementPoint - (1@0)].	
	]. 
	
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
	ifTrue: [
		currentCardinalPoint = #North
		ifTrue:[^currentCardinalPoint := #East].
		
		currentCardinalPoint = #West
		ifTrue:[^currentCardinalPoint := #North].
		
		currentCardinalPoint = #South
		ifTrue:[^currentCardinalPoint := #West].
		
		currentCardinalPoint = #East
		ifTrue:[^currentCardinalPoint := #South]].! !

!MarsRover methodsFor: 'command proccessing - private' stamp: 'pb 10/30/2021 02:46:36'!
verifyIfCommandIn: aString isValidIn: anIndex

	^(((aString at: anIndex ) asString =  'f') | ((aString at: anIndex ) asString = 'b' )| ((aString at: anIndex ) asString ='l') | (( aString at: anIndex )asString ='r'))! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 03:48:51'!
proccessIfCommandIsIEmpty

	self error: self class invalidCommandErrorDescription! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 03:58:24'!
proccessIfCommandIsInvalid

	self error: self class invalidCommandErrorDescription

! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 04:11:50'!
proccessIfCommandIsNotEmpty: aString

	| currentIndex |
	
	currentIndex:=1.
	aString size timesRepeat: [
		currentCommand := (NotEmptyCommand subclasses detect: [:notEmptyCommandSubclass | notEmptyCommandSubclass canHandle: aString atIndex: currentIndex ]) new.
		currentCommand evaluateA: self accordingTo: aString atIndex: currentIndex.
		currentIndex := currentIndex+1
		].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 03:57:47'!
proccessIfCommandIsValid: aString at: currentIndex
	
	self executeActionAccordingTo: (aString at: currentIndex) asString ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-05-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'pb 10/30/2021 00:58:40'!
with: aStartingPoint facingTowards: aCardinalPoint

	^self new initializeWith: aStartingPoint andFacingTowards: aCardinalPoint .
! !


!MarsRover class methodsFor: 'errors' stamp: 'MV 11/13/2021 01:46:10'!
invalidCommandErrorDescription
	 
	^'No entiendo uno de los comandos recibidos'! !
