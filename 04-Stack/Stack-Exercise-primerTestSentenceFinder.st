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
	instanceVariableNames: 'stackWithNoElements stackWithElements prefixNamedComp sentenceFinderOfEmptyStack sentenceFinderOfNotEmptyStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'MV 11/2/2021 02:30:32'!
setUp

	stackWithNoElements := OOStack new.
	
	stackWithElements := OOStack new.
	stackWithElements push: 'Compañia'.
	stackWithElements push: 'computadora'.
	stackWithElements push: 'Computadora'.
	stackWithElements push: 'jabon'.
	stackWithElements push: 'Café'.
	stackWithElements push: 'Compresion'.
	stackWithElements push: 'COMPRESION'.
	stackWithElements push: 'comprension'.
	stackWithElements push: 'comida'.
	stackWithElements push: 'Comadreja'.
	stackWithElements push: 'correr'.
	stackWithElements push: 'Correr'.
	stackWithElements push: 'complacer'.
	stackWithElements push: 'hola'.
	stackWithElements push: 'Competencia'.
	
	prefixNamedComp := 'Comp'.
	sentenceFinderOfEmptyStack := SentenceFinderByPrefix with: stackWithNoElements.
	sentenceFinderOfNotEmptyStack := SentenceFinderByPrefix with: stackWithElements.
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/2/2021 02:35:09'!
test01CannotUseSentenceFinderByPrefixIfStackIsEmpty

	
	self should: [sentenceFinderOfEmptyStack find: prefixNamedComp] raise: Error withExceptionDo: [:anError | 
		self assert: anError messageText equals: SentenceFinderByPrefix cannotFindSentecesWithAPrefixInAnEmptyStack
	]. ! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'MV 11/2/2021 00:50:00'!
initialize

	stackCollection  := OrderedCollection new.
! !


!OOStack methodsFor: 'operations' stamp: 'MV 10/30/2021 21:18:17'!
isEmpty

	^ stackCollection isEmpty. 
	! !

!OOStack methodsFor: 'operations' stamp: 'MV 11/2/2021 01:21:30'!
pop

	^ self processElementWithStackOperation: #handleIfStackIsValidToPop:
	
	
	
! !

!OOStack methodsFor: 'operations' stamp: 'MV 11/2/2021 00:55:25'!
push: elementToPush
	
	stackCollection addFirst: elementToPush .

	! !

!OOStack methodsFor: 'operations' stamp: 'pb 10/29/2021 03:07:21'!
size

	^ stackCollection size .! !

!OOStack methodsFor: 'operations' stamp: 'MV 11/2/2021 01:21:30'!
top

	^ self processElementWithStackOperation: #handleIfStackIsValidToGetTop:
	
	! !


!OOStack methodsFor: 'operations - private' stamp: 'MV 11/2/2021 01:21:30'!
processElementWithStackOperation: aSelector 

	| processedElement  actualState |
	
	actualState := StateOfStack subclasses detect: [:subclass | subclass canHandle: self].
	
	processedElement := (aSelector asMessageWith: self) sendTo: actualState new.
	
	^ processedElement .
	
	! !

!OOStack methodsFor: 'operations - private' stamp: 'MV 11/2/2021 01:24:08'!
raiseErrorDueToEmptyStack

	self error: OOStack stackEmptyErrorDescription 
	! !

!OOStack methodsFor: 'operations - private' stamp: 'MV 10/30/2021 21:12:35'!
safePop

	^ stackCollection removeFirst.! !

!OOStack methodsFor: 'operations - private' stamp: 'MV 10/30/2021 21:11:12'!
safeTop

	^ stackCollection at: 1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'associatedStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'MV 11/2/2021 02:32:22'!
find: aPrefix

	associatedStack isEmpty ifTrue: [self error: self class cannotFindSentecesWithAPrefixInAnEmptyStack ].! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'MV 11/2/2021 02:07:15'!
initializeWith: aStackToAssociate

	associatedStack := aStackToAssociate.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'errors' stamp: 'MV 11/2/2021 02:25:32'!
cannotFindSentecesWithAPrefixInAnEmptyStack

	^ 'No se pueden entontrar frases en un stack vacío'. ! !


!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'MV 11/2/2021 02:05:12'!
with: aStackToAssociate

	^ SentenceFinderByPrefix new initializeWith: aStackToAssociate.! !


!classDefinition: #StateOfStack category: 'Stack-Exercise'!
Object subclass: #StateOfStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!StateOfStack methodsFor: 'operation handling' stamp: 'MV 11/2/2021 00:53:26'!
handleIfStackIsValidToGetTop: aStack

	self subclassResponsibility.
	! !

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


!classDefinition: #EmptyStateOfStack category: 'Stack-Exercise'!
StateOfStack subclass: #EmptyStateOfStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStateOfStack methodsFor: 'operation handling' stamp: 'MV 11/2/2021 01:24:08'!
handleIfStackIsValidToGetTop: aStack

	aStack raiseErrorDueToEmptyStack.
! !

!EmptyStateOfStack methodsFor: 'operation handling' stamp: 'MV 11/2/2021 01:24:08'!
handleIfStackIsValidToPop: aStack

	aStack raiseErrorDueToEmptyStack.

	
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStateOfStack class' category: 'Stack-Exercise'!
EmptyStateOfStack class
	instanceVariableNames: ''!

!EmptyStateOfStack class methodsFor: 'as yet unclassified' stamp: 'MV 11/1/2021 21:08:59'!
canHandle: aStack

	^ aStack isEmpty = true .! !


!classDefinition: #NotEmptyStateOfStack category: 'Stack-Exercise'!
StateOfStack subclass: #NotEmptyStateOfStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStateOfStack methodsFor: 'operation handling' stamp: 'MV 11/2/2021 00:50:45'!
handleIfStackIsValidToGetTop: aStack

	^ aStack safeTop .  
	
	! !

!NotEmptyStateOfStack methodsFor: 'operation handling' stamp: 'MV 11/2/2021 00:50:37'!
handleIfStackIsValidToPop: aStack

	^ aStack safePop . 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStateOfStack class' category: 'Stack-Exercise'!
NotEmptyStateOfStack class
	instanceVariableNames: ''!

!NotEmptyStateOfStack class methodsFor: 'as yet unclassified' stamp: 'MV 11/1/2021 21:09:06'!
canHandle: aStack

	^ aStack  isEmpty = false.! !
