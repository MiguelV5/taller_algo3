!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'pb 10/29/2021 03:32:09'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'MV 11/1/2021 20:57:54'!
initialize

	stackCollection  := OrderedCollection new.
	"state  := EmptyStateOfStack withAssociatedStack: self. No se está usando el associatedStack en el estado porque falla por ahora
"
	! !


!OOStack methodsFor: 'operations' stamp: 'MV 11/1/2021 20:51:22'!
pop
	| poppedElement  estadoActual |
	
	estadoActual := StateOfStack subclasses detect: [:subclass | subclass canHandle: self].
	
	poppedElement := (estadoActual withAssociatedStack: self) handleIfStackIsValidToPop: self.
	
	
	"
	poppedElement := state handleIfStackIsValidToPop: self.
	(self isEmpty) ifTrue: [self updateStateToEmpty].
	"
	^ poppedElement .
	
	
	
	
	
	

	! !

!OOStack methodsFor: 'operations' stamp: 'MV 11/1/2021 20:47:24'!
push: elementToPush
	
	"self updateStateToNotEmpty."
	stackCollection addFirst: elementToPush .

	! !

!OOStack methodsFor: 'operations' stamp: 'pb 10/29/2021 03:07:21'!
size

	^ stackCollection size .! !

!OOStack methodsFor: 'operations' stamp: 'MV 11/1/2021 21:14:37'!
top

	| toppedElement  estadoActual |
	
	estadoActual := StateOfStack subclasses detect: [:subclass | subclass canHandle: self].
	
	toppedElement := (estadoActual withAssociatedStack: self) handleIfStackIsValidToGetTop: self.

	^ toppedElement .
	
	! !


!OOStack methodsFor: 'operations - private' stamp: 'MV 10/30/2021 21:12:35'!
safePop

	^ stackCollection removeFirst.! !

!OOStack methodsFor: 'operations - private' stamp: 'MV 10/30/2021 21:11:12'!
safeTop

	^ stackCollection at: 1! !

!OOStack methodsFor: 'operations - private' stamp: 'MV 10/30/2021 21:15:49'!
sendErrorDueToEmptyStack

	self error: OOStack stackEmptyErrorDescription 
	
	"SE TENIAN DOS METODOS IDENTICOS: 'removeElementAtTheTopIfStackIsEmpty'  y  'topIfStackIsEmpty'. 
	Puse uno solo que sea tipo sendErrorDueToEmptyStack, revisar nombre juntos despues"! !


!OOStack methodsFor: 'state management' stamp: 'MV 10/30/2021 21:18:17'!
isEmpty

	^ stackCollection isEmpty. 
	! !

!OOStack methodsFor: 'state management' stamp: 'MV 10/30/2021 21:18:13'!
updateStateToEmpty
	
	state := EmptyStateOfStack new.! !

!OOStack methodsFor: 'state management' stamp: 'MV 10/30/2021 21:18:07'!
updateStateToNotEmpty

	state := NotEmptyStateOfStack new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StateOfStack category: 'Stack-Exercise'!
Object subclass: #StateOfStack
	instanceVariableNames: 'associatedStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateOfStack methodsFor: 'initialization' stamp: 'MV 10/30/2021 16:12:31'!
initializeWith: aStack

	associatedStack := aStack.! !


!StateOfStack methodsFor: 'operation handling' stamp: 'MV 10/30/2021 20:56:08'!
handleIfStackIsValidToGetTop: aStack

	self subclassResponsibility.
	
	"sugerencia previa: 'getTopOfStack. Pareciera más como un mensaje de OOStack, hace ruido '"! !

!StateOfStack methodsFor: 'operation handling' stamp: 'MV 10/30/2021 20:49:20'!
handleIfStackIsValidToPop: aStack

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateOfStack class' category: 'Stack-Exercise'!
StateOfStack class
	instanceVariableNames: ''!

!StateOfStack class methodsFor: 'as yet unclassified' stamp: 'MV 11/1/2021 20:54:46'!
canHandle: aStack

	self subclassResponsibility .! !

!StateOfStack class methodsFor: 'as yet unclassified' stamp: 'MV 10/30/2021 16:11:18'!
withAssociatedStack: aStack
	
	self subclassResponsibility.
! !


!classDefinition: #EmptyStateOfStack category: 'Stack-Exercise'!
StateOfStack subclass: #EmptyStateOfStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStateOfStack methodsFor: 'operation handling (falla)' stamp: 'MV 10/30/2021 21:19:32'!
getTopOfStack

	associatedStack sendErrorDueToEmptyStack.

	"NO FUNCIONA CON ESTE PLANTEO"! !

!EmptyStateOfStack methodsFor: 'operation handling (falla)' stamp: 'MV 10/30/2021 21:19:48'!
handleIfStackIsValidToPop

	associatedStack sendErrorDueToEmptyStack.
	
	"NO FUNCIONA CON ESTE PLANTEO"
	
	
! !


!EmptyStateOfStack methodsFor: 'operation handling' stamp: 'MV 10/30/2021 21:15:49'!
handleIfStackIsValidToGetTop: aStack

	aStack sendErrorDueToEmptyStack.
! !

!EmptyStateOfStack methodsFor: 'operation handling' stamp: 'MV 10/30/2021 21:16:14'!
handleIfStackIsValidToPop: aStack

	aStack sendErrorDueToEmptyStack.

	
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStateOfStack class' category: 'Stack-Exercise'!
EmptyStateOfStack class
	instanceVariableNames: ''!

!EmptyStateOfStack class methodsFor: 'as yet unclassified' stamp: 'MV 11/1/2021 21:08:59'!
canHandle: aStack

	^ aStack isEmpty = true .! !

!EmptyStateOfStack class methodsFor: 'as yet unclassified' stamp: 'MV 10/30/2021 16:47:36'!
withAssociatedStack: aStack
	
	^ EmptyStateOfStack new initializeWith: aStack. ! !


!classDefinition: #NotEmptyStateOfStack category: 'Stack-Exercise'!
StateOfStack subclass: #NotEmptyStateOfStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStateOfStack methodsFor: 'operation handling (falla)' stamp: 'MV 10/30/2021 21:11:12'!
getTopOfStack

	^associatedStack safeTop . 
	
	"NO FUNCIONA CON ESTE PLANTEO"! !

!NotEmptyStateOfStack methodsFor: 'operation handling (falla)' stamp: 'MV 10/30/2021 21:12:35'!
handleIfStackIsValidToPop

	^associatedStack safePop .
	
	"NO FUNCIONA CON ESTE PLANTEO"! !


!NotEmptyStateOfStack methodsFor: 'operation handling' stamp: 'MV 10/30/2021 21:11:12'!
handleIfStackIsValidToGetTop: aStack

	^ aStack safeTop .  
	
	"cambio de nombre (era 'topIfStackIsNotEmpty') a: safeTop, como un top pero ya seguro porque si entró acá es porque es un NotEmptyStack"! !

!NotEmptyStateOfStack methodsFor: 'operation handling' stamp: 'MV 10/30/2021 21:20:03'!
handleIfStackIsValidToPop: aStack

	^ aStack safePop . 
	
	"MIsma idea del handler para top. Renombre a: safePop; o ItsSafeToPop  (era 'removeElementAtTheTopIfStackIsNotEmpty')"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStateOfStack class' category: 'Stack-Exercise'!
NotEmptyStateOfStack class
	instanceVariableNames: ''!

!NotEmptyStateOfStack class methodsFor: 'as yet unclassified' stamp: 'MV 11/1/2021 21:09:06'!
canHandle: aStack

	^ aStack  isEmpty = false.! !

!NotEmptyStateOfStack class methodsFor: 'as yet unclassified' stamp: 'MV 10/30/2021 16:48:01'!
withAssociatedStack: aStack
	
	^ NotEmptyStateOfStack new initializeWith: aStack. ! !
