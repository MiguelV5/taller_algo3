!classDefinition: #MarsRoverTest category: 'Ejercicio-05-MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!MarsRoverTest methodsFor: 'setUp/tearDown' stamp: 'MV 11/14/2021 02:11:33'!
setUp
	
	marsRover := MarsRover with: 0@0 facingTowards: NorthCardinalPoint new.! !


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

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/14/2021 02:18:45'!
test03FailsIfGroupOfCommandsContainsInvalidCommandAfterSomeValidCommands
	
	|command expectedCurrentPlacementPoint |
	
	command := 'ffrr x blr'.
	expectedCurrentPlacementPoint := (0@2).
	
	self  should: [marsRover processCommand: command] 
		raise: Error  
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: 	MarsRover invalidCommandErrorDescription. 
			self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
			self assert: (marsRover currentCardinalPoint isKindOf:SouthCardinalPoint) .
		].

	
		
		! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/14/2021 02:19:26'!
test04IfOnlyOneValidCommandOfMovementIsSentMarsRoverMovesCorrectly

	|command expectedCurrentPlacementPoint |
	command := 'f'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@1).
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert:  (marsRover currentCardinalPoint isKindOf: NorthCardinalPoint).
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/14/2021 02:19:49'!
test05IfManyValidCommandsOfMovementAreSentMarsRoverMovesCorrectly

	|command expectedCurrentPlacementPoint |
	command := 'bf'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf:NorthCardinalPoint).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/14/2021 02:20:13'!
test06IfOnlyOneValidCommandOfRotationIsSentMarsRoverRotatesCorrectly

	|command expectedCurrentPlacementPoint |
	command := 'l'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf: WestCardinalPoint).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/14/2021 02:20:27'!
test07IfManyValidCommandsOfRotationAreSentMarsRoverRotatesCorrectly

	|command expectedCurrentPlacementPoint |
	command := 'rrrl'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf:SouthCardinalPoint).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/14/2021 02:21:09'!
test08IfEnoughValidCommandsOfRotationAreSentForA360RotationMarsRoverRotatesCorrectly

	|command expectedCurrentPlacementPoint |
	
	command := 'rrrr'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert:  (marsRover currentCardinalPoint isKindOf:NorthCardinalPoint) .
	
	command := 'llll'.
	marsRover processCommand: command .
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf:NorthCardinalPoint).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/14/2021 02:21:30'!
test09IfManyCombinedCommandsAreSentMarsRoverActsAsExpected

	|command expectedCurrentPlacementPoint |
	
	command := 'ffrrblr'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@3).
	
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf:SouthCardinalPoint).
! !



!classDefinition: #CardinalPoint category: 'Ejercicio-05-MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:55:37'!
moveBackwardsAccordingToFacingDirectionOfMarsRover: aMarsRover

	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:58'!
moveForwardAccordingToFacingDirectionOfMarsRover: aMarsRover

	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:16'!
rotateLeftAccordingToFacingDirectionOfMarsRover: aMarsRover

	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:35'!
rotateRightAccordingToFacingDirectionOfMarsRover: aMarsRover

	self subclassResponsibility.! !


!classDefinition: #EastCardinalPointAnalizer category: 'Ejercicio-05-MarsRover'!
CardinalPoint subclass: #EastCardinalPointAnalizer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!EastCardinalPointAnalizer methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:55:37'!
moveBackwardsAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover decreasePlacementPointXAxisByOne.! !

!EastCardinalPointAnalizer methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:58'!
moveForwardAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover incresePlacementPointXAxisByOne.! !

!EastCardinalPointAnalizer methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:16'!
rotateLeftAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToNorth! !

!EastCardinalPointAnalizer methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:35'!
rotateRightAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToSouth ! !


!classDefinition: #NorthCardinalPoint category: 'Ejercicio-05-MarsRover'!
CardinalPoint subclass: #NorthCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!NorthCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:55:37'!
moveBackwardsAccordingToFacingDirectionOfMarsRover: aMarsRover

	 ^ aMarsRover decreasePlacementPointYAxisByOne! !

!NorthCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:58'!
moveForwardAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover increasePlacementPointYAxisByOne .
	! !

!NorthCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:16'!
rotateLeftAccordingToFacingDirectionOfMarsRover: aMarsRover

	^aMarsRover rotateToWest 

	! !

!NorthCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:35'!
rotateRightAccordingToFacingDirectionOfMarsRover: aMarsRover

	^aMarsRover rotateToEast 

	! !


!classDefinition: #SouthCardinalPoint category: 'Ejercicio-05-MarsRover'!
CardinalPoint subclass: #SouthCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!SouthCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:55:37'!
moveBackwardsAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover increasePlacementPointYAxisByOne. ! !

!SouthCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:58'!
moveForwardAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover decreasePlacementPointYAxisByOne .
! !

!SouthCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:16'!
rotateLeftAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToEast ! !

!SouthCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:35'!
rotateRightAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToWest ! !


!classDefinition: #WestCardinalPoint category: 'Ejercicio-05-MarsRover'!
CardinalPoint subclass: #WestCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!WestCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:55:37'!
moveBackwardsAccordingToFacingDirectionOfMarsRover: aMarsRover

	 ^ aMarsRover incresePlacementPointXAxisByOne.! !

!WestCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:58'!
moveForwardAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover decreasePlacementPointXAxisByOne .
! !

!WestCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:16'!
rotateLeftAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToSouth 
! !

!WestCardinalPoint methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:35'!
rotateRightAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToNorth ! !


!classDefinition: #CommandExecutor category: 'Ejercicio-05-MarsRover'!
Object subclass: #CommandExecutor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!CommandExecutor methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 01:21:06'!
beExecutedFor: aMarsRover

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandExecutor class' category: 'Ejercicio-05-MarsRover'!
CommandExecutor class
	instanceVariableNames: ''!

!CommandExecutor class methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 01:10:31'!
canHandle: aOneCharacterString

	self subclassResponsibility.! !


!classDefinition: #BackwardsCommandExecutor category: 'Ejercicio-05-MarsRover'!
CommandExecutor subclass: #BackwardsCommandExecutor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!BackwardsCommandExecutor methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:51:27'!
beExecutedFor: aMarsRover

	aMarsRover forCommandBackwardsEvaluateAccordingToCardinalPoints.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardsCommandExecutor class' category: 'Ejercicio-05-MarsRover'!
BackwardsCommandExecutor class
	instanceVariableNames: ''!

!BackwardsCommandExecutor class methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 01:11:20'!
canHandle: aOneCharacterString

	^ aOneCharacterString = 'b'.! !


!classDefinition: #ForwardCommandExecutor category: 'Ejercicio-05-MarsRover'!
CommandExecutor subclass: #ForwardCommandExecutor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!ForwardCommandExecutor methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:51:49'!
beExecutedFor: aMarsRover

	aMarsRover forCommandForwardEvaluateAccordingToCardinalPoints ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ForwardCommandExecutor class' category: 'Ejercicio-05-MarsRover'!
ForwardCommandExecutor class
	instanceVariableNames: ''!

!ForwardCommandExecutor class methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 01:11:30'!
canHandle: aOneCharacterString

	^ aOneCharacterString = 'f'.! !


!classDefinition: #LeftCommandExecutor category: 'Ejercicio-05-MarsRover'!
CommandExecutor subclass: #LeftCommandExecutor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!LeftCommandExecutor methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:51:59'!
beExecutedFor: aMarsRover

	aMarsRover forCommandLeftEvaluateAccordingToCardinalPoints ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LeftCommandExecutor class' category: 'Ejercicio-05-MarsRover'!
LeftCommandExecutor class
	instanceVariableNames: ''!

!LeftCommandExecutor class methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 01:11:46'!
canHandle: aOneCharacterString

	^ aOneCharacterString = 'l'.! !


!classDefinition: #RightCommandExecutor category: 'Ejercicio-05-MarsRover'!
CommandExecutor subclass: #RightCommandExecutor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!RightCommandExecutor methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:52:09'!
beExecutedFor: aMarsRover

	aMarsRover forCommandRightEvaluateAccordingToCardinalPoints ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RightCommandExecutor class' category: 'Ejercicio-05-MarsRover'!
RightCommandExecutor class
	instanceVariableNames: ''!

!RightCommandExecutor class methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 01:12:31'!
canHandle: aOneCharacterString

	^ aOneCharacterString = 'r'.! !


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

!EmptyCommandInterpreter methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:49:50'!
interpretateIfCommandIsEmpty: aString forMarsRover: aMarsRover

	aMarsRover processEmptyCommand.

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

!NotEmptyCommandInterpreter methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:49:57'!
interpretateIfCommandIsEmpty: aString forMarsRover: aMarsRover

	aMarsRover processNotEmptyCommand: aString.
	
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

!NotEmptyInvalidCommandInterpreter methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:50:11'!
interpretateIfNotEmptyCommandIsValid: aOneCharacterString forMarsRover: aMarsRover

	aMarsRover processInvalidCommand.

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

!NotEmptyValidCommandInterpreter methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 00:50:04'!
interpretateIfNotEmptyCommandIsValid: aOneCharacterString forMarsRover: aMarsRover 

	aMarsRover processValidCommand: aOneCharacterString

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
	instanceVariableNames: 'currentCardinalPoint currentPlacementPoint currentCommand'
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

!MarsRover methodsFor: 'accesing' stamp: 'MV 11/14/2021 01:37:25'!
decreasePlacementPointXAxisByOne

	currentPlacementPoint := currentPlacementPoint - (1@0)! !

!MarsRover methodsFor: 'accesing' stamp: 'MV 11/14/2021 01:37:21'!
decreasePlacementPointYAxisByOne

	currentPlacementPoint := currentPlacementPoint - (0@1)! !

!MarsRover methodsFor: 'accesing' stamp: 'MV 11/14/2021 01:37:16'!
increasePlacementPointYAxisByOne

	currentPlacementPoint := currentPlacementPoint + (0@1)! !

!MarsRover methodsFor: 'accesing' stamp: 'MV 11/14/2021 01:37:11'!
incresePlacementPointXAxisByOne

	currentPlacementPoint := currentPlacementPoint + (1@0)! !


!MarsRover methodsFor: 'command execution - private' stamp: 'MV 11/14/2021 01:21:06'!
executeActionAccordingTo: aOneCharacterString

	| correspondingCommandExecutor |

	correspondingCommandExecutor := (CommandExecutor subclasses detect: [:aCommandExecutorSubclass | aCommandExecutorSubclass canHandle: aOneCharacterString ]) new.
	
	correspondingCommandExecutor beExecutedFor: self.
	! !


!MarsRover methodsFor: 'command proccessing - private' stamp: 'MV 11/14/2021 00:50:11'!
processEmptyCommand

	self processInvalidCommand .! !

!MarsRover methodsFor: 'command proccessing - private' stamp: 'MV 11/14/2021 00:50:11'!
processInvalidCommand

	self error: self class invalidCommandErrorDescription

! !

!MarsRover methodsFor: 'command proccessing - private' stamp: 'MV 11/14/2021 00:49:57'!
processNotEmptyCommand: aString

	| collectionOfCharacters |
	

	collectionOfCharacters := aString asOrderedCollection collect: [:aCharacter | aCharacter asString ].
	collectionOfCharacters do: [:aOneCharacterString | 
			currentCommand := (NotEmptyCommandInterpreter subclasses detect: [:notEmptyCommandSubclass | notEmptyCommandSubclass canHandle: aOneCharacterString ]) new.
		currentCommand interpretateIfNotEmptyCommandIsValid: aOneCharacterString forMarsRover: self.
		].
	! !

!MarsRover methodsFor: 'command proccessing - private' stamp: 'MV 11/14/2021 00:50:04'!
processValidCommand: aOneCharacterString
	
	self executeActionAccordingTo: aOneCharacterString ! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:55:37'!
forCommandBackwardsEvaluateAccordingToCardinalPoints

	^ currentCardinalPoint moveBackwardsAccordingToFacingDirectionOfMarsRover: self.
	
		! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:58'!
forCommandForwardEvaluateAccordingToCardinalPoints
		
	currentCardinalPoint moveForwardAccordingToFacingDirectionOfMarsRover: self.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:16'!
forCommandLeftEvaluateAccordingToCardinalPoints
		
	^ currentCardinalPoint rotateLeftAccordingToFacingDirectionOfMarsRover: self! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:56:35'!
forCommandRightEvaluateAccordingToCardinalPoints
		
	^ currentCardinalPoint rotateRightAccordingToFacingDirectionOfMarsRover: self.	
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:43:16'!
rotateToEast

	^ currentCardinalPoint := EastCardinalPointAnalizer new! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:31:40'!
rotateToNorth

	^ currentCardinalPoint := NorthCardinalPoint new! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:30:31'!
rotateToSouth

	^ currentCardinalPoint := SouthCardinalPoint new! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'MV 11/14/2021 02:30:03'!
rotateToWest

	^ currentCardinalPoint := WestCardinalPoint new! !

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
