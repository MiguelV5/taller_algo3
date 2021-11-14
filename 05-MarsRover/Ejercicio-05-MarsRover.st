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

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 14:41:00'!
test04IfOnlyOneValidCommandOfMovementIsSentMarsRoverMovesCorrectly

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	command := 'f'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@1).
	expectedCurrentCardinalPoint := #North.
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 14:41:04'!
test05IfManyValidCommandsOfMovementAreSentMarsRoverMovesCorrectly

	|command expectedCurrentPlacementPoint expectedCurrentCardinalPoint|
	command := 'bf'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	expectedCurrentCardinalPoint := #North.
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: expectedCurrentCardinalPoint equals: marsRover currentCardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/13/2021 14:41:10'!
test06IfOnlyOneValidCommandOfRotationIsSentMarsRoverRotatesCorrectly

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



!classDefinition: #CommandInterpreter category: 'Ejercicio-05-MarsRover'!
Object subclass: #CommandInterpreter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!CommandInterpreter methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:31:00'!
interpretateIfCommandIsEmpty: aString forMarsRover: aMarsRover

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandInterpreter class' category: 'Ejercicio-05-MarsRover'!
CommandInterpreter class
	instanceVariableNames: ''!

!CommandInterpreter class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 22:53:17'!
verifyIfCommandIsEmpty: aString

	self subclassResponsibility .
! !


!classDefinition: #EmptyCommandInterpreter category: 'Ejercicio-05-MarsRover'!
CommandInterpreter subclass: #EmptyCommandInterpreter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!EmptyCommandInterpreter methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:43:39'!
interpretateIfCommandIsEmpty: aString forMarsRover: aMarsRover

	aMarsRover proccessEmptyCommand.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyCommandInterpreter class' category: 'Ejercicio-05-MarsRover'!
EmptyCommandInterpreter class
	instanceVariableNames: ''!

!EmptyCommandInterpreter class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 22:53:17'!
verifyIfCommandIsEmpty: aString

	^aString isEmpty = true .! !


!classDefinition: #NotEmptyCommandInterpreter category: 'Ejercicio-05-MarsRover'!
CommandInterpreter subclass: #NotEmptyCommandInterpreter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!NotEmptyCommandInterpreter methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:42:07'!
interpretateIfCommandIsEmpty: aString forMarsRover: aMarsRover

	aMarsRover proccessNotEmptyCommand: aString.
	
! !

!NotEmptyCommandInterpreter methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:37:12'!
interpretateIfNotEmptyCommandIsValid: aOneCharacterString forMarsRover: aMarsRover

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyCommandInterpreter class' category: 'Ejercicio-05-MarsRover'!
NotEmptyCommandInterpreter class
	instanceVariableNames: ''!

!NotEmptyCommandInterpreter class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 22:56:06'!
canHandle: aOneCharacterString 

	self subclassResponsibility ! !

!NotEmptyCommandInterpreter class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 22:55:36'!
canHandle: aOneCharacterString atIndex: anIndex

	self subclassResponsibility ! !

!NotEmptyCommandInterpreter class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 23:11:55'!
isValidCommand: aOneCharacterString

	 ^( (aOneCharacterString =  'f') | (aOneCharacterString  = 'b' ) | (aOneCharacterString = 'l') | ( aOneCharacterString  = 'r' ) ).! !

!NotEmptyCommandInterpreter class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 22:53:17'!
verifyIfCommandIsEmpty: aString

	^aString isEmpty = false.
! !


!classDefinition: #NotEmptyInvalidCommandInterpreter category: 'Ejercicio-05-MarsRover'!
NotEmptyCommandInterpreter subclass: #NotEmptyInvalidCommandInterpreter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!NotEmptyInvalidCommandInterpreter methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:39:26'!
interpretateIfNotEmptyCommandIsValid: aOneCharacterString forMarsRover: aMarsRover

	aMarsRover proccessInvalidCommand.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyInvalidCommandInterpreter class' category: 'Ejercicio-05-MarsRover'!
NotEmptyInvalidCommandInterpreter class
	instanceVariableNames: ''!

!NotEmptyInvalidCommandInterpreter class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 23:12:20'!
canHandle: aOneCharacterString 

	^ (self isValidCommand: aOneCharacterString) not.! !

!NotEmptyInvalidCommandInterpreter class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 04:10:58'!
canHandle: aString atIndex: anIndex

	^( ((aString at: anIndex ) asString =  'f') | ((aString at: anIndex ) asString = 'b' )| ((aString at: anIndex ) asString ='l') | (( aString at: anIndex )asString ='r') ) = false.! !


!classDefinition: #NotEmptyValidCommandInterpreter category: 'Ejercicio-05-MarsRover'!
NotEmptyCommandInterpreter subclass: #NotEmptyValidCommandInterpreter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!NotEmptyValidCommandInterpreter methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:39:47'!
interpretateIfNotEmptyCommandIsValid: aOneCharacterString forMarsRover: aMarsRover 

	aMarsRover proccessValidCommand: aOneCharacterString

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyValidCommandInterpreter class' category: 'Ejercicio-05-MarsRover'!
NotEmptyValidCommandInterpreter class
	instanceVariableNames: ''!

!NotEmptyValidCommandInterpreter class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 23:12:48'!
canHandle: aOneCharacterString 

	^ self isValidCommand: aOneCharacterString.! !

!NotEmptyValidCommandInterpreter class methodsFor: 'as yet unclassified' stamp: 'MV 11/13/2021 04:11:10'!
canHandle: aString atIndex: anIndex

	^( ((aString at: anIndex ) asString =  'f') | ((aString at: anIndex ) asString = 'b' )| ((aString at: anIndex ) asString ='l') | (( aString at: anIndex )asString ='r') ) = true.! !


!classDefinition: #MarsRover category: 'Ejercicio-05-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentCardinalPoint currentPlacementPoint ffff currentCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'MV 11/13/2021 22:29:15'!
initializeWith: aStartingPoint andFacingTowards: aCardinalPoint

	currentCardinalPoint:= aCardinalPoint .
	currentPlacementPoint:=aStartingPoint .
	currentCommand := EmptyCommandInterpreter new.
! !


!MarsRover methodsFor: 'command proccesing - public' stamp: 'MV 11/14/2021 00:31:47'!
processCommand: aString 

	currentCommand := (CommandInterpreter subclasses detect: [:commandSubclass | commandSubclass verifyIfCommandIsEmpty: aString ]) new.
	
	currentCommand interpretateIfCommandIsEmpty: aString forMarsRover: self. 												
	
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


!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:40:09'!
proccessEmptyCommand

	self error: self class invalidCommandErrorDescription! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:39:26'!
proccessInvalidCommand

	self error: self class invalidCommandErrorDescription

! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:40:31'!
proccessNotEmptyCommand: aString

	| collectionOfCharacters |
	

	collectionOfCharacters := aString asOrderedCollection collect: [:aCharacter | aCharacter asString ].
	collectionOfCharacters do: [:aOneCharacterString | 
			currentCommand := (NotEmptyCommandInterpreter subclasses detect: [:notEmptyCommandSubclass | notEmptyCommandSubclass canHandle: aOneCharacterString ]) new.
		currentCommand interpretateIfNotEmptyCommandIsValid: aOneCharacterString forMarsRover: self.
		].
	! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:39:47'!
proccessValidCommand: aOneCharacterString
	
	self executeActionAccordingTo: aOneCharacterString ! !

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
