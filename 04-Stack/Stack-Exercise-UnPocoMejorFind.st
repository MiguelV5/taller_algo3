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
	instanceVariableNames: 'stackWithNoElements stackWithMoreThanOneElement stackWithOneElement sentenceFinderOfOneElementStack sentenceFinderOfEmptyStack sentenceFinderOfNotEmptyStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'pb 11/2/2021 22:26:59'!
setUp

	stackWithNoElements := OOStack new.
	stackWithOneElement:= OOStack new.
	stackWithMoreThanOneElement := OOStack new.
	
	stackWithOneElement push:'ropa nueva'.
	
	stackWithMoreThanOneElement push: 'Compañia de autos'.
	stackWithMoreThanOneElement push: 'computadora portatil'.
	stackWithMoreThanOneElement push: 'Computadora de escritorio'.
	stackWithMoreThanOneElement push: 'jabon de coco'.
	stackWithMoreThanOneElement push: 'Café descafeinado'.
	stackWithMoreThanOneElement push: 'Compresion'.
	stackWithMoreThanOneElement push: 'COMPRESION'.
	stackWithMoreThanOneElement push: 'comprension lectora'.
	stackWithMoreThanOneElement push: 'comida china'.
	stackWithMoreThanOneElement push: 'Comadreja'.
	stackWithMoreThanOneElement push: 'correr una maraton'.
	stackWithMoreThanOneElement push: 'Correr es un muy buen deporte'.
	stackWithMoreThanOneElement push: 'complacer'.
	stackWithMoreThanOneElement push: 'hola como estas?'.
	stackWithMoreThanOneElement push: 'Competencia de natacion'.
	
	sentenceFinderOfOneElementStack:= SentenceFinderByPrefix with: stackWithOneElement .
	sentenceFinderOfEmptyStack := SentenceFinderByPrefix with: stackWithNoElements.
	sentenceFinderOfNotEmptyStack := SentenceFinderByPrefix with: stackWithMoreThanOneElement.
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pb 11/2/2021 22:29:33'!
test01cannotUseSentenceFinderByPrefixIfStackIsEmpty
	
	|prefixToFind|
	prefixToFind :='Comp'.
	
	self should: [sentenceFinderOfEmptyStack find: prefixToFind ] raise: Error withExceptionDo: [:anError | 
		self assert: anError messageText equals: SentenceFinderByPrefix cannotFindSentecesWithAPrefixInAnEmptyStack
	]. ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/3/2021 22:54:41'!
test02couldFindAMatchingSentenceWithinAStackWithMoreThanOneElement

	| prefixToFind searchResultCollection expectedSentence|
	
	prefixToFind := 'jab'.
	expectedSentence := 'jabon de coco'.
	
	searchResultCollection := sentenceFinderOfNotEmptyStack find: prefixToFind.
	
	self assert: searchResultCollection size equals: 1.
	self assert: (searchResultCollection find:expectedSentence ) > 0.
	



! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pb 11/3/2021 00:14:42'!
test03couldFindAMatchingSentenceWithinAStackWithOneElement

	| prefixToFind searchResultCollection expectedSentence|
	
	prefixToFind := 'ropa '.
	expectedSentence := 'ropa nueva'.
	
	searchResultCollection := sentenceFinderOfOneElementStack find: prefixToFind.
	
	self assert:(searchResultCollection size )equals: 1.
	self assert:(searchResultCollection find:expectedSentence )>0.
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pb 11/2/2021 23:32:40'!
test04couldFindMultipleMatchingSentencesWithinAStackWithMoreThanOneElement

	| prefixToFind searchResultCollection expectedSentencesCollection|
	
	prefixToFind := 'Comp'.
	expectedSentencesCollection :=OrderedCollection  with: 'Competencia de natacion' with:'Compresion'
	with: 'Computadora de escritorio' with: 'Compañia de autos' .
	
	searchResultCollection := sentenceFinderOfNotEmptyStack find: prefixToFind.
	
	self assert:(searchResultCollection size )equals: 4.
	self assert:(searchResultCollection )equals: expectedSentencesCollection.
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pb 11/2/2021 23:28:32'!
test05couldNotFindAnyMatchingSentencesWithinAStackWithMoreThanOneElement

	| prefixToFind searchResultCollection |
	
	prefixToFind := 'aghjska'.
	
	searchResultCollection := sentenceFinderOfNotEmptyStack find: prefixToFind.
	
	self assert:(searchResultCollection size )equals:0.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pb 11/2/2021 23:33:03'!
test06couldNotFindAMatchingSentenceWithinAStackWithOneElement

	| prefixToFind searchResultCollection |
	
	prefixToFind := 'aghjska'.
	
	searchResultCollection := sentenceFinderOfNotEmptyStack find: prefixToFind.
	
	self assert:(searchResultCollection size )equals:0.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pb 11/2/2021 23:39:07'!
test07couldNotFindAnyMatchingSentencesCaseSensitive
	
	| prefixToFind searchResultCollection expectedSentencesCollection|
	
	prefixToFind := 'comp'.
	expectedSentencesCollection :=OrderedCollection  with: 'Competencia de natacion' with:'Compresion'
	with: 'Computadora de escritorio' with: 'Compañia de autos' .
	
	searchResultCollection := sentenceFinderOfNotEmptyStack find: prefixToFind.
	
	self deny: searchResultCollection = expectedSentencesCollection .
 ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pb 11/3/2021 00:02:51'!
test08StackRemainsInTheSameOrderAsItWasBeforeUsingFind

	| prefixToFind  stackBeforeFinding|
	
	prefixToFind := 'ropa '.

	stackBeforeFinding := OOStack new push: 'ropa nueva'.
	sentenceFinderOfOneElementStack find: prefixToFind.
	
	self assert: stackWithOneElement top equals: stackBeforeFinding top.
	self assert: stackWithOneElement size equals: stackBeforeFinding size.
	
	
	

! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'pb 11/3/2021 00:15:05'!
test09findWorksProperlyIfTheStackIsModified

	| prefixToFind   expectedSentencesCollection|
	
	prefixToFind := 'ropa '.

	stackWithOneElement push: 'hola'.
	expectedSentencesCollection := sentenceFinderOfOneElementStack find: prefixToFind.
	
	self assert: expectedSentencesCollection size equals:1.
	self assert: (expectedSentencesCollection find:'ropa nueva')>0 .
	
	
	
! !


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

!SentenceFinderByPrefix methodsFor: 'finding' stamp: 'MV 11/3/2021 23:04:27'!
find: aPrefix	
 
	associatedStack isEmpty ifTrue: [self error: self class cannotFindSentecesWithAPrefixInAnEmptyStack ] .
	
	^ self searchForSentenceMatchingsWith: aPrefix.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'MV 11/2/2021 02:07:15'!
initializeWith: aStackToAssociate

	associatedStack := aStackToAssociate.! !


!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'MV 11/3/2021 22:06:45'!
compareAssociatedStackElementsWithPrefix: aPrefix andSaveInAuxiliarStack: auxiliarStack savingMatchesIn: searchResults

	| actualElementToCompare wasFound |

	actualElementToCompare := associatedStack pop.
	auxiliarStack push: actualElementToCompare .
		
	wasFound := actualElementToCompare includesSubstring: aPrefix caseSensitive: true.
		
	wasFound ifTrue: [ searchResults add: actualElementToCompare ]! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'MV 11/3/2021 23:03:04'!
loopOnStack: aStack whileDoing: aBlock

	aStack size timesRepeat: [ aBlock value ].! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'MV 11/3/2021 22:14:35'!
restoreOriginalAssociatedStackElementFrom: anotherStack
	
	| actualElementToTransfer |

	actualElementToTransfer := anotherStack pop.
	associatedStack push: actualElementToTransfer .! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'MV 11/3/2021 22:14:35'!
searchForSentenceMatchingsWith: aPrefix

	| auxiliarStack searchResults |
	
	auxiliarStack := OOStack  new.
	searchResults := OrderedCollection new.
	
	self loopOnStack: associatedStack whileDoing: [ self compareAssociatedStackElementsWithPrefix: aPrefix andSaveInAuxiliarStack: auxiliarStack savingMatchesIn: searchResults ].
	
	self loopOnStack: auxiliarStack whileDoing: [ self restoreOriginalAssociatedStackElementFrom: auxiliarStack ]. 

	^searchResults .! !

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
