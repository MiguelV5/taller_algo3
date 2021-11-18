!classDefinition: #MarsRoverTest category: 'Ejercicio-05-MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!MarsRoverTest methodsFor: 'test helper' stamp: 'pb 11/18/2021 04:01:38'!
assertThatProcessing: aGroupOfCommands makesMarsRoverEndAt: anExpectedPlacementPoint andFacingTowards: anExpectedCardinalPoint

	marsRover processCommand: aGroupOfCommands .
	self assert: anExpectedPlacementPoint equals: marsRover currentPlacementPoint .
	self assert:  (marsRover currentCardinalPoint isKindOf: anExpectedCardinalPoint).! !


!MarsRoverTest methodsFor: 'setUp/tearDown' stamp: 'MV 11/18/2021 15:13:19'!
setUp
	
	marsRover := MarsRover locatedAt: (0@0) facingTowards: NorthMarsRoverCardinalPoint new.! !


!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:38:32'!
test01FailsIfGroupOfCommandsBeginsWithInvalidCommand
	
	| groupOfCommandsBeginigWithInvalidCommands |
	
	groupOfCommandsBeginigWithInvalidCommands :=  ' hfbrl'.
	
	self  should: [ marsRover processCommand: groupOfCommandsBeginigWithInvalidCommands ] 
		raise: Error  
		withExceptionDo: [:anError | self assert: anError messageText equals: 	MarsRover invalidCommandErrorDescription ].! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:38:43'!
test02FailsIfGroupOfCommandsIsEmpty

	| emptyGroupOfCommands |
	
	emptyGroupOfCommands := ''. " Interpretamos como que hay que tirar error porque seria comando invalido "
	
	self  should: [ marsRover processCommand: emptyGroupOfCommands ] 
		raise: Error  
		withExceptionDo: [:anError | self assert: anError messageText equals: 	MarsRover invalidCommandErrorDescription ].
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:38:47'!
test03FailsIfGroupOfCommandsContainsInvalidCommandAfterSomeValidCommands
	
	|groupOfCommands expectedCurrentPlacementPoint |
	
	groupOfCommands := 'ffrr x blr'.
	expectedCurrentPlacementPoint := (0@2).
	
	self  should: [ marsRover processCommand: groupOfCommands] 
		raise: Error  
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: 	MarsRover invalidCommandErrorDescription. 
			self assert: expectedCurrentPlacementPoint equals: marsRover currentPlacementPoint .
			self assert: (marsRover currentCardinalPoint isKindOf:SouthMarsRoverCardinalPoint) .
		].

	
		
		! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:39:03'!
test04IfOnlyOneForwardMovementCommandIsSentMarsRoverMovesCorrectly

	self assertThatProcessing: 'f' makesMarsRoverEndAt: (0@1) andFacingTowards: NorthMarsRoverCardinalPoint 
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:13:19'!
test05IfOnlyOneBackwardMovementCommandIsSentMarsRoverMovesCorrectly

	self assertThatProcessing: 'b' makesMarsRoverEndAt: (0@-1) andFacingTowards: NorthMarsRoverCardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:13:19'!
test06IfManyCommandsOfMovementAreSentMarsRoverMovesCorrectly

	self assertThatProcessing: 'bf' makesMarsRoverEndAt: (0@0) andFacingTowards: NorthMarsRoverCardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:13:41'!
test07IfOnlyOneLeftRotationCommandIsSentMarsRoverRotatesCorrectly
	
	self assertThatProcessing: 'l' makesMarsRoverEndAt: (0@0) andFacingTowards: WestMarsRoverCardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:12:55'!
test08IfOnlyOneRightRotationCommandIsSentMarsRoverRotatesCorrectly
	
	self assertThatProcessing: 'r' makesMarsRoverEndAt: (0@0) andFacingTowards: EastMarsRoverCardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:13:19'!
test09MarsRoverRotatesCorrectlyEvenWhenItsOrientationChanges
	"testea que funcionen las rotaciones segun la perspectiva del mars rover (tiene en cuenta en base a cual es el punto cardinal actual y al comando si es 'r' o 'l' cual tendria que ser su nuevo punto cardinal para que dicha rotacion se realice de manera correcta)"
	
	self assertThatProcessing: 'rrrr' makesMarsRoverEndAt: (0@0) andFacingTowards: NorthMarsRoverCardinalPoint .
	self assertThatProcessing: 'llll' makesMarsRoverEndAt: (0@0) andFacingTowards: NorthMarsRoverCardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:13:28'!
test10IfManyCommandsOfRotationAreSentMarsRoverRotatesCorrectly

	self assertThatProcessing: 'rrrl' makesMarsRoverEndAt:(0@0)  andFacingTowards: SouthMarsRoverCardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:13:41'!
test11IfForwardAndLeftCommandsAreCombinedAndSentMarsRoverReactsAsExpected

	self assertThatProcessing: 'flf' makesMarsRoverEndAt: (-1@1) andFacingTowards: WestMarsRoverCardinalPoint .
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:39:33'!
test12IfForwardAndRightCommandsAreCombinedAndSentMarsRoverReactsAsExpected

	self assertThatProcessing: 'rfrf' makesMarsRoverEndAt: (1@-1)  andFacingTowards: SouthMarsRoverCardinalPoint .
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:13:41'!
test13IfBackwardAndLeftCommandsAreCombinedAndSentMarsRoverReactsAsExpected

	self assertThatProcessing: 'blb' makesMarsRoverEndAt: (1@-1) andFacingTowards: WestMarsRoverCardinalPoint .
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:39:40'!
test14IfBackwardAndRightCommandsAreCombinedAndSentMarsRoverReactsAsExpected

	self assertThatProcessing: 'rbrbr' makesMarsRoverEndAt: (-1@1)  andFacingTowards: WestMarsRoverCardinalPoint .
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MV 11/18/2021 15:12:55'!
test15IfManyCombinedCommandsAreSentMarsRoverReactsAsExpected

	self assertThatProcessing: 'ffrrblrlbbb' makesMarsRoverEndAt: (-3@3) andFacingTowards: EastMarsRoverCardinalPoint .
! !


!classDefinition: #CommandExecutor category: 'Ejercicio-05-MarsRover'!
Object subclass: #CommandExecutor
	instanceVariableNames: 'associatedMarsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!CommandExecutor methodsFor: 'command executing' stamp: 'MV 11/18/2021 15:02:18'!
executeCorrespondingCommand

	self subclassResponsibility .! !


!CommandExecutor methodsFor: 'initialization' stamp: 'MV 11/18/2021 13:48:31'!
initializeAssociatedTo: aMarsRover 
	
	associatedMarsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandExecutor class' category: 'Ejercicio-05-MarsRover'!
CommandExecutor class
	instanceVariableNames: ''!

!CommandExecutor class methodsFor: 'command handler' stamp: 'pb 11/18/2021 03:23:34'!
canHandle: aCommand

	self subclassResponsibility.! !


!CommandExecutor class methodsFor: 'instance creation' stamp: 'MV 11/18/2021 15:06:34'!
for: aCommand associatedTo: aMarsRover 
	
	| detectedCommandExecutorSubclass |
	
	detectedCommandExecutorSubclass := CommandExecutor subclasses detect: [:aCommandExecutorSubclass | aCommandExecutorSubclass canHandle: aCommand ] 
	ifNone: [aMarsRover error: aMarsRover class invalidCommandErrorDescription].
	
	^ detectedCommandExecutorSubclass new initializeAssociatedTo: aMarsRover .! !


!classDefinition: #BackwardsCommandExecutor category: 'Ejercicio-05-MarsRover'!
CommandExecutor subclass: #BackwardsCommandExecutor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!BackwardsCommandExecutor methodsFor: 'command executing' stamp: 'MV 11/18/2021 15:02:18'!
executeCorrespondingCommand

	associatedMarsRover reactForCommandBackwardsAccordingToCardinalPoints.! !

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

!ForwardCommandExecutor methodsFor: 'command executing' stamp: 'MV 11/18/2021 15:02:18'!
executeCorrespondingCommand

	associatedMarsRover reactForCommandForwardAccordingToCardinalPoints ! !

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

!LeftCommandExecutor methodsFor: 'command executing' stamp: 'MV 11/18/2021 15:02:18'!
executeCorrespondingCommand

	associatedMarsRover reactForCommandLeftAccordingToCardinalPoints ! !

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

!RightCommandExecutor methodsFor: 'command executing' stamp: 'MV 11/18/2021 15:02:18'!
executeCorrespondingCommand

	associatedMarsRover reactForCommandRightAccordingToCardinalPoints ! !

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

!MarsRover methodsFor: 'initialization' stamp: 'MV 11/18/2021 13:52:30'!
initializeWith: aStartingPlacementPoint andFacingTowards: aStartingCardinalPoint

	currentCardinalPoint := aStartingCardinalPoint .
	currentPlacementPoint := aStartingPlacementPoint .
	
! !


!MarsRover methodsFor: 'command processing - public' stamp: 'MV 11/18/2021 13:59:05'!
processCommand: aGroupOfCommands 
	
	aGroupOfCommands isEmpty ifTrue: [self error: self class invalidCommandErrorDescription ].
	
	aGroupOfCommands do: [ :aCommand | self analizeAndExecute: aCommand .].
	
	
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

!MarsRover methodsFor: 'accesing - private' stamp: 'MV 11/18/2021 15:12:55'!
rotateToEast

	currentCardinalPoint := EastMarsRoverCardinalPoint new! !

!MarsRover methodsFor: 'accesing - private' stamp: 'MV 11/18/2021 15:13:19'!
rotateToNorth

	currentCardinalPoint := NorthMarsRoverCardinalPoint new! !

!MarsRover methodsFor: 'accesing - private' stamp: 'MV 11/18/2021 15:13:28'!
rotateToSouth

	currentCardinalPoint := SouthMarsRoverCardinalPoint new! !

!MarsRover methodsFor: 'accesing - private' stamp: 'MV 11/18/2021 15:13:41'!
rotateToWest

	currentCardinalPoint := WestMarsRoverCardinalPoint new! !


!MarsRover methodsFor: 'command processing - private' stamp: 'MV 11/18/2021 15:02:18'!
analizeAndExecute: aCommand 

	| currentCommandExecutor |

	currentCommandExecutor := CommandExecutor for: aCommand associatedTo: self.

	currentCommandExecutor executeCorrespondingCommand.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'MV 11/18/2021 15:35:50'!
reactForCommandBackwardsAccordingToCardinalPoints

	currentCardinalPoint informCurrentDirectionOfBackwardsMovementToMarsRover: self.
	
	! !

!MarsRover methodsFor: 'command processing - private' stamp: 'MV 11/18/2021 15:35:41'!
reactForCommandForwardAccordingToCardinalPoints
		
	currentCardinalPoint informCurrentDirectionOfForwardMovementToMarsRover: self.! !

!MarsRover methodsFor: 'command processing - private' stamp: 'MV 11/18/2021 15:35:22'!
reactForCommandLeftAccordingToCardinalPoints
		
	currentCardinalPoint informCurrentDirectionOfLeftRotationToMarsRover: self! !

!MarsRover methodsFor: 'command processing - private' stamp: 'MV 11/18/2021 15:34:47'!
reactForCommandRightAccordingToCardinalPoints
		
	currentCardinalPoint informCurrentDirectionOfRightRotationToMarsRover: self.	
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


!classDefinition: #MarsRoverCardinalPoint category: 'Ejercicio-05-MarsRover'!
Object subclass: #MarsRoverCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!MarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:50'!
informCurrentDirectionOfBackwardsMovementToMarsRover: aMarsRover

	self subclassResponsibility.! !

!MarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:41'!
informCurrentDirectionOfForwardMovementToMarsRover: aMarsRover

	self subclassResponsibility.! !

!MarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:22'!
informCurrentDirectionOfLeftRotationToMarsRover: aMarsRover

	self subclassResponsibility.! !

!MarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:34:47'!
informCurrentDirectionOfRightRotationToMarsRover: aMarsRover

	self subclassResponsibility.! !


!classDefinition: #EastMarsRoverCardinalPoint category: 'Ejercicio-05-MarsRover'!
MarsRoverCardinalPoint subclass: #EastMarsRoverCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!EastMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:50'!
informCurrentDirectionOfBackwardsMovementToMarsRover: aMarsRover

	^ aMarsRover decreasePlacementPointXAxisByOne.! !

!EastMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:41'!
informCurrentDirectionOfForwardMovementToMarsRover: aMarsRover

	^ aMarsRover incresePlacementPointXAxisByOne.! !

!EastMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:22'!
informCurrentDirectionOfLeftRotationToMarsRover: aMarsRover

	^ aMarsRover rotateToNorth! !

!EastMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:34:46'!
informCurrentDirectionOfRightRotationToMarsRover: aMarsRover

	^ aMarsRover rotateToSouth ! !


!classDefinition: #NorthMarsRoverCardinalPoint category: 'Ejercicio-05-MarsRover'!
MarsRoverCardinalPoint subclass: #NorthMarsRoverCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!NorthMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:50'!
informCurrentDirectionOfBackwardsMovementToMarsRover: aMarsRover

	 ^ aMarsRover decreasePlacementPointYAxisByOne! !

!NorthMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:41'!
informCurrentDirectionOfForwardMovementToMarsRover: aMarsRover

	^ aMarsRover increasePlacementPointYAxisByOne .
	! !

!NorthMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:22'!
informCurrentDirectionOfLeftRotationToMarsRover: aMarsRover

	^aMarsRover rotateToWest 

	! !

!NorthMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:34:47'!
informCurrentDirectionOfRightRotationToMarsRover: aMarsRover

	^aMarsRover rotateToEast 

	! !


!classDefinition: #SouthMarsRoverCardinalPoint category: 'Ejercicio-05-MarsRover'!
MarsRoverCardinalPoint subclass: #SouthMarsRoverCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!SouthMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:50'!
informCurrentDirectionOfBackwardsMovementToMarsRover: aMarsRover

	^ aMarsRover increasePlacementPointYAxisByOne. ! !

!SouthMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:41'!
informCurrentDirectionOfForwardMovementToMarsRover: aMarsRover

	^ aMarsRover decreasePlacementPointYAxisByOne .
! !

!SouthMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:22'!
informCurrentDirectionOfLeftRotationToMarsRover: aMarsRover

	^ aMarsRover rotateToEast ! !

!SouthMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:34:47'!
informCurrentDirectionOfRightRotationToMarsRover: aMarsRover

	^ aMarsRover rotateToWest ! !


!classDefinition: #WestMarsRoverCardinalPoint category: 'Ejercicio-05-MarsRover'!
MarsRoverCardinalPoint subclass: #WestMarsRoverCardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-05-MarsRover'!

!WestMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:50'!
informCurrentDirectionOfBackwardsMovementToMarsRover: aMarsRover

	 ^ aMarsRover incresePlacementPointXAxisByOne.! !

!WestMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:41'!
informCurrentDirectionOfForwardMovementToMarsRover: aMarsRover

	^ aMarsRover decreasePlacementPointXAxisByOne .
! !

!WestMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:35:22'!
informCurrentDirectionOfLeftRotationToMarsRover: aMarsRover

	^ aMarsRover rotateToSouth 
! !

!WestMarsRoverCardinalPoint methodsFor: 'orientation reactioning' stamp: 'MV 11/18/2021 15:34:46'!
informCurrentDirectionOfRightRotationToMarsRover: aMarsRover

	^ aMarsRover rotateToNorth ! !
