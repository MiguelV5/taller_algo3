!classDefinition: #MarsRoverTest category: 'Ejercicio-05-MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!MarsRoverTest methodsFor: 'setUp/tearDown' stamp: 'pb 11/18/2021 00:29:25'!
setUp
	
	marsRover := MarsRover locatedAt: (0@0) facingTowards: NorthCardinalPoint new.! !


!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 00:38:03'!
test01FailsIfGroupOfCommandsBeginsWithInvalidCommand
	
	| groupOfCommandsBeginigWithInvalidCommands |
	
	groupOfCommandsBeginigWithInvalidCommands :=  ' hfbrl'.
	
	self  should: [marsRover processCommand: groupOfCommandsBeginigWithInvalidCommands ] 
		raise: Error  
		withExceptionDo: [:anError | self assert: anError messageText equals: 	MarsRover invalidCommandErrorDescription ].! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 00:49:35'!
test02FailsIfGroupOfCommandsIsEmpty

	| emptyGroupOfCommands |
	
	emptyGroupOfCommands := ''. " tiramos error "
	
	self  should: [marsRover processCommand: emptyGroupOfCommands ] 
		raise: Error  
		withExceptionDo: [:anError | self assert: anError messageText equals: 	MarsRover invalidCommandErrorDescription ].
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 00:38:38'!
test03FailsIfGroupOfCommandsContainsInvalidCommandAfterSomeValidCommands
	
	|groupOfCommands expectedCurrentPlacementPoint |
	
	groupOfCommands := 'ffrr x blr'.
	expectedCurrentPlacementPoint := (0@2).
	
	self  should: [marsRover processCommand: groupOfCommands] 
		raise: Error  
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: 	MarsRover invalidCommandErrorDescription. 
			self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
			self assert: (marsRover currentCardinalPoint isKindOf:SouthCardinalPoint) .
		].

	
		
		! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 02:27:06'!
test04IfOnlyOneForwardMovementCommandIsSentMarsRoverMovesCorrectly

	| command expectedCurrentPlacementPoint |
	
	command := 'f'.
	
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@1).
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert:  (marsRover currentCardinalPoint isKindOf: NorthCardinalPoint).
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 02:29:49'!
test05IfOnlyOneBackwardMovementCommandIsSentMarsRoverMovesCorrectly

	| command expectedCurrentPlacementPoint |
	
	command := 'b'.
	
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@-1).
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert:  (marsRover currentCardinalPoint isKindOf: NorthCardinalPoint).
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 02:56:44'!
test06IfManyCommandsOfMovementAreSentMarsRoverMovesCorrectly

	| groupOfCommands expectedCurrentPlacementPoint |
	
	groupOfCommands := 'bf'.
	
	marsRover processCommand: groupOfCommands .
	expectedCurrentPlacementPoint := (0@0).
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf:NorthCardinalPoint).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 02:35:32'!
test07IfOnlyOneLeftRotationCommandIsSentMarsRoverRotatesCorrectly

	| command expectedCurrentPlacementPoint |
	
	command := 'l'.
	
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf: WestCardinalPoint).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 02:35:40'!
test08IfOnlyOneRightRotationCommandIsSentMarsRoverRotatesCorrectly

	| command expectedCurrentPlacementPoint |
	
	command := 'r'.
	
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf: EastCardinalPoint).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 02:55:40'!
test09MarsRoverRotatesCorrectlyEvenWhenItsOrientationChanges
	"testea que funcionen las rotaciones segun la perspectiva del mars rover (tiene en cuenta en base a cual es el punto cardinal actual y al comando si es 'r' o 'l' cual tendria que ser su nuevo punto cardinal para que dicha rotacion se realice de manera correcta)"
	
	| command expectedCurrentPlacementPoint |
	
	command := 'rrrr'.
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert:  (marsRover currentCardinalPoint isKindOf:NorthCardinalPoint) .
	
	command := 'llll'.
	marsRover processCommand: command .
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf:NorthCardinalPoint).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 02:56:52'!
test10IfManyCommandsOfRotationAreSentMarsRoverRotatesCorrectly

	| command expectedCurrentPlacementPoint |
	
	command := 'rrrl'.
	
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (0@0).
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf:SouthCardinalPoint).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 03:05:22'!
test11IfForwardAndLeftCommandsAreCombinedAndSentMarsRoverReactsAsExpected

	| groupOfCommands expectedCurrentPlacementPoint |
	
	groupOfCommands := 'flf'.
	marsRover processCommand: groupOfCommands .
	expectedCurrentPlacementPoint := (-1@1).
	
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf:WestCardinalPoint ).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 03:06:23'!
test12IfForwardAndRightCommandsAreCombinedAndSentMarsRoverReactsAsExpected

	| groupOfCommands expectedCurrentPlacementPoint |
	
	groupOfCommands := 'rfrf'.
	marsRover processCommand: groupOfCommands .
	expectedCurrentPlacementPoint := (1@-1).
	
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf:SouthCardinalPoint ).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 03:10:54'!
test13IfBackwardAndLeftCommandsAreCombinedAndSentMarsRoverReactsAsExpected

	| groupOfCommands expectedCurrentPlacementPoint |
	
	groupOfCommands := 'blb'.
	
	marsRover processCommand: groupOfCommands .
	expectedCurrentPlacementPoint := (1@-1).
	
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf:WestCardinalPoint ).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 03:08:52'!
test14IfBackwardAndRightCommandsAreCombinedAndSentMarsRoverReactsAsExpected

	| groupOfCommands expectedCurrentPlacementPoint |
	
	groupOfCommands := 'rbrbr'.
	marsRover processCommand: groupOfCommands .
	expectedCurrentPlacementPoint := (-1@1).
	
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf:WestCardinalPoint ).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'pb 11/18/2021 03:13:53'!
test15IfManyCombinedCommandsAreSentMarsRoverReactsAsExpected

	|command expectedCurrentPlacementPoint |
	
	command := 'ffrrblrlbbb'.
	
	marsRover processCommand: command .
	expectedCurrentPlacementPoint := (-3@3).
	
	self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
	self assert: (marsRover currentCardinalPoint isKindOf: EastCardinalPoint ).
! !


!classDefinition: #CardinalPoint category: 'Ejercicio-05-MarsRover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!CardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:55:37'!
moveBackwardsAccordingToFacingDirectionOfMarsRover: aMarsRover

	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:58'!
moveForwardAccordingToFacingDirectionOfMarsRover: aMarsRover

	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:16'!
rotateLeftAccordingToFacingDirectionOfMarsRover: aMarsRover

	self subclassResponsibility.! !

!CardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:35'!
rotateRightAccordingToFacingDirectionOfMarsRover: aMarsRover

	self subclassResponsibility.! !


!classDefinition: #EastCardinalPoint category: 'Ejercicio-05-MarsRover'!
CardinalPoint subclass: #EastCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!EastCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:55:37'!
moveBackwardsAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover decreasePlacementPointXAxisByOne.! !

!EastCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:58'!
moveForwardAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover incresePlacementPointXAxisByOne.! !

!EastCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:16'!
rotateLeftAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToNorth! !

!EastCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:35'!
rotateRightAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToSouth ! !


!classDefinition: #NorthCardinalPoint category: 'Ejercicio-05-MarsRover'!
CardinalPoint subclass: #NorthCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!NorthCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:55:37'!
moveBackwardsAccordingToFacingDirectionOfMarsRover: aMarsRover

	 ^ aMarsRover decreasePlacementPointYAxisByOne! !

!NorthCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:58'!
moveForwardAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover increasePlacementPointYAxisByOne .
	! !

!NorthCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:16'!
rotateLeftAccordingToFacingDirectionOfMarsRover: aMarsRover

	^aMarsRover rotateToWest 

	! !

!NorthCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:35'!
rotateRightAccordingToFacingDirectionOfMarsRover: aMarsRover

	^aMarsRover rotateToEast 

	! !


!classDefinition: #SouthCardinalPoint category: 'Ejercicio-05-MarsRover'!
CardinalPoint subclass: #SouthCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!SouthCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:55:37'!
moveBackwardsAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover increasePlacementPointYAxisByOne. ! !

!SouthCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:58'!
moveForwardAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover decreasePlacementPointYAxisByOne .
! !

!SouthCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:16'!
rotateLeftAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToEast ! !

!SouthCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:35'!
rotateRightAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToWest ! !


!classDefinition: #WestCardinalPoint category: 'Ejercicio-05-MarsRover'!
CardinalPoint subclass: #WestCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!WestCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:55:37'!
moveBackwardsAccordingToFacingDirectionOfMarsRover: aMarsRover

	 ^ aMarsRover incresePlacementPointXAxisByOne.! !

!WestCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:58'!
moveForwardAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover decreasePlacementPointXAxisByOne .
! !

!WestCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:16'!
rotateLeftAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToSouth 
! !

!WestCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/14/2021 02:56:35'!
rotateRightAccordingToFacingDirectionOfMarsRover: aMarsRover

	^ aMarsRover rotateToNorth ! !


!classDefinition: #CommandExecutor category: 'Ejercicio-05-MarsRover'!
Object subclass: #CommandExecutor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!CommandExecutor methodsFor: 'command executing' stamp: 'MV 11/14/2021 01:21:06'!
beExecutedFor: aMarsRover

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandExecutor class' category: 'Ejercicio-05-MarsRover'!
CommandExecutor class
	instanceVariableNames: ''!

!CommandExecutor class methodsFor: 'command handler' stamp: 'pb 11/18/2021 03:23:34'!
canHandle: aCommand

	self subclassResponsibility.! !


!classDefinition: #BackwardsCommandExecutor category: 'Ejercicio-05-MarsRover'!
CommandExecutor subclass: #BackwardsCommandExecutor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!BackwardsCommandExecutor methodsFor: 'command executing' stamp: 'pb 11/18/2021 02:17:55'!
beExecutedFor: aMarsRover

	aMarsRover reactForCommandBackwardsAccordingToCardinalPoints.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardsCommandExecutor class' category: 'Ejercicio-05-MarsRover'!
BackwardsCommandExecutor class
	instanceVariableNames: ''!

!BackwardsCommandExecutor class methodsFor: 'command handler' stamp: 'pb 11/18/2021 03:23:50'!
canHandle: aCommand

	^ aCommand = $b.! !


!classDefinition: #ForwardCommandExecutor category: 'Ejercicio-05-MarsRover'!
CommandExecutor subclass: #ForwardCommandExecutor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!ForwardCommandExecutor methodsFor: 'command executing' stamp: 'pb 11/18/2021 02:19:03'!
beExecutedFor: aMarsRover

	aMarsRover reactForCommandForwardAccordingToCardinalPoints ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ForwardCommandExecutor class' category: 'Ejercicio-05-MarsRover'!
ForwardCommandExecutor class
	instanceVariableNames: ''!

!ForwardCommandExecutor class methodsFor: 'command handler' stamp: 'pb 11/18/2021 03:23:57'!
canHandle: aCommand

	^ aCommand = $f.! !


!classDefinition: #LeftCommandExecutor category: 'Ejercicio-05-MarsRover'!
CommandExecutor subclass: #LeftCommandExecutor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!LeftCommandExecutor methodsFor: 'command executing' stamp: 'pb 11/18/2021 02:18:31'!
beExecutedFor: aMarsRover

	aMarsRover reactForCommandLeftAccordingToCardinalPoints ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LeftCommandExecutor class' category: 'Ejercicio-05-MarsRover'!
LeftCommandExecutor class
	instanceVariableNames: ''!

!LeftCommandExecutor class methodsFor: 'command handler' stamp: 'pb 11/18/2021 03:24:04'!
canHandle: aCommand

	^ aCommand = $l.! !


!classDefinition: #RightCommandExecutor category: 'Ejercicio-05-MarsRover'!
CommandExecutor subclass: #RightCommandExecutor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!RightCommandExecutor methodsFor: 'command executing' stamp: 'pb 11/18/2021 02:18:41'!
beExecutedFor: aMarsRover

	aMarsRover reactForCommandRightAccordingToCardinalPoints ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RightCommandExecutor class' category: 'Ejercicio-05-MarsRover'!
RightCommandExecutor class
	instanceVariableNames: ''!

!RightCommandExecutor class methodsFor: 'command handler' stamp: 'pb 11/18/2021 03:24:11'!
canHandle: aCommand

	^ aCommand = $r.! !


!classDefinition: #MarsRover category: 'Ejercicio-05-MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentCardinalPoint currentPlacementPoint currentCommand'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'pb 11/18/2021 03:26:03'!
initializeWith: aStartingPlacementPoint andFacingTowards: aStartingCardinalPoint

	currentCardinalPoint:= aStartingCardinalPoint .
	currentPlacementPoint:=aStartingPlacementPoint .
	
! !


!MarsRover methodsFor: 'command processing - public' stamp: 'pb 11/18/2021 03:33:27'!
processCommand: aGroupOfCommands 
	
	aGroupOfCommands isEmpty ifTrue: [self error: self class invalidCommandErrorDescription ].
	
	aGroupOfCommands do: [ :aCommand | self analizeEachCommandAndExecute: aCommand .].
	
	
! !


!MarsRover methodsFor: 'accesing - private' stamp: 'pb 10/30/2021 01:12:25'!
currentCardinalPoint
	
	^currentCardinalPoint! !

!MarsRover methodsFor: 'accesing - private' stamp: 'pb 10/30/2021 02:28:12'!
currentPlacementPoint
	
	^currentPlacementPoint ! !

!MarsRover methodsFor: 'accesing - private' stamp: 'MV 11/14/2021 01:37:25'!
decreasePlacementPointXAxisByOne

	currentPlacementPoint := currentPlacementPoint - (1@0)! !

!MarsRover methodsFor: 'accesing - private' stamp: 'MV 11/14/2021 01:37:21'!
decreasePlacementPointYAxisByOne

	currentPlacementPoint := currentPlacementPoint - (0@1)! !

!MarsRover methodsFor: 'accesing - private' stamp: 'MV 11/14/2021 01:37:16'!
increasePlacementPointYAxisByOne

	currentPlacementPoint := currentPlacementPoint + (0@1)! !

!MarsRover methodsFor: 'accesing - private' stamp: 'MV 11/14/2021 01:37:11'!
incresePlacementPointXAxisByOne

	currentPlacementPoint := currentPlacementPoint + (1@0)! !

!MarsRover methodsFor: 'accesing - private' stamp: 'pb 11/18/2021 03:34:42'!
rotateToEast

	currentCardinalPoint := EastCardinalPoint new! !

!MarsRover methodsFor: 'accesing - private' stamp: 'pb 11/18/2021 03:34:39'!
rotateToNorth

	currentCardinalPoint := NorthCardinalPoint new! !

!MarsRover methodsFor: 'accesing - private' stamp: 'pb 11/18/2021 03:34:35'!
rotateToSouth

	currentCardinalPoint := SouthCardinalPoint new! !

!MarsRover methodsFor: 'accesing - private' stamp: 'pb 11/18/2021 03:34:29'!
rotateToWest

	currentCardinalPoint := WestCardinalPoint new! !


!MarsRover methodsFor: 'command processing - private' stamp: 'pb 11/18/2021 03:31:44'!
analizeEachCommandAndExecute: aCommand 

	currentCommand :=(CommandExecutor subclasses detect: [:aCommandExecutorSubclass |
	aCommandExecutorSubclass canHandle: aCommand ] 
	ifNone: [self error: self class invalidCommandErrorDescription] ) new. 
	currentCommand beExecutedFor: self.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'pb 11/18/2021 03:33:59'!
reactForCommandBackwardsAccordingToCardinalPoints

	currentCardinalPoint moveBackwardsAccordingToFacingDirectionOfMarsRover: self.
	
		! !

!MarsRover methodsFor: 'command processing - private' stamp: 'pb 11/18/2021 02:19:03'!
reactForCommandForwardAccordingToCardinalPoints
		
	currentCardinalPoint moveForwardAccordingToFacingDirectionOfMarsRover: self.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'pb 11/18/2021 03:34:06'!
reactForCommandLeftAccordingToCardinalPoints
		
	currentCardinalPoint rotateLeftAccordingToFacingDirectionOfMarsRover: self! !

!MarsRover methodsFor: 'command processing - private' stamp: 'pb 11/18/2021 03:34:12'!
reactForCommandRightAccordingToCardinalPoints
		
	currentCardinalPoint rotateRightAccordingToFacingDirectionOfMarsRover: self.	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-05-MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'pb 11/18/2021 03:25:10'!
locatedAt: aStartingPlacementPoint facingTowards: aStartingCardinalPoint

	^self new initializeWith: aStartingPlacementPoint andFacingTowards: aStartingCardinalPoint .
! !


!MarsRover class methodsFor: 'errors' stamp: 'MV 11/13/2021 01:46:10'!
invalidCommandErrorDescription
	 
	^'No entiendo uno de los comandos recibidos'! !
