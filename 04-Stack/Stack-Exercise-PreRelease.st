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
	instanceVariableNames: 'stackWithoutElements stackWithOneElement stackWithALotOfElements sentenceFinderOfStackWithoutElements sentenceFinderOfStackWithOneElement sentenceFinderOfStackWithALotOfElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'MV 11/4/2021 00:12:40'!
setUp

	stackWithoutElements := OOStack new.
	stackWithOneElement:= OOStack new.
	stackWithALotOfElements := OOStack new.
	
	stackWithOneElement push:'ropa nueva'.
	
	stackWithALotOfElements push: 'Compañia de autos'.
	stackWithALotOfElements push: 'computadora portatil'.
	stackWithALotOfElements push: 'Computadora de escritorio'.
	stackWithALotOfElements push: 'jabon de coco'.
	stackWithALotOfElements push: 'Café descafeinado'.
	stackWithALotOfElements push: 'Compresion'.
	stackWithALotOfElements push: 'COMPRESION'.
	stackWithALotOfElements push: 'comprension lectora'.
	stackWithALotOfElements push: 'comida china'.
	stackWithALotOfElements push: 'Comadreja'.
	stackWithALotOfElements push: 'correr una maraton'.
	stackWithALotOfElements push: 'Correr es un muy buen deporte'.
	stackWithALotOfElements push: 'complacer'.
	stackWithALotOfElements push: 'hola como estas?'.
	stackWithALotOfElements push: 'Competencia de natacion'.
	
	sentenceFinderOfStackWithOneElement:= SentenceFinderByPrefix with: stackWithOneElement .
	sentenceFinderOfStackWithoutElements := SentenceFinderByPrefix with: stackWithoutElements.
	sentenceFinderOfStackWithALotOfElements := SentenceFinderByPrefix with: stackWithALotOfElements.
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'testHelper' stamp: 'MV 11/4/2021 04:18:25'!
makeCopyOfStackWithALotOfElements
	
	^ OOStack new  push: 'Compañia de autos' ; push: 'computadora portatil' ;  push: 'Computadora de escritorio' ;  push: 'jabon de coco' ; 
	push: 'Café descafeinado' ;  push: 'Compresion' ;  push: 'COMPRESION' ;   push: 'comprension lectora' ;  push: 'comida china' ;   push: 'Comadreja' ; 
	push: 'correr una maraton' ;   push: 'Correr es un muy buen deporte' ; push: 'complacer' ; push: 'hola como estas?' ; push: 'Competencia de natacion'.! !

!SentenceFinderByPrefixTest methodsFor: 'testHelper' stamp: 'MV 11/4/2021 04:20:23'!
makeCopyOfStackWithOneElement

	^ OOStack new push: 'ropa nueva'! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/4/2021 00:13:31'!
test01cannotUseSentenceFinderByPrefixIfStackIsEmpty
	
	| prefixToFind |
	
	prefixToFind := 'Comp'.
	
	self should: [sentenceFinderOfStackWithoutElements find: prefixToFind ] raise: Error withExceptionDo: [:anError | 
		self assert: anError messageText equals: SentenceFinderByPrefix cannotFindSentecesWithAPrefixInAnEmptyStack
	]. ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/4/2021 02:05:06'!
test02couldFindAMatchingSentenceWithinAStackWithOneElement

	| prefixToFind searchResultsCollection expectedSentencesCollection |
	
	prefixToFind := 'ropa '.
	expectedSentencesCollection :=OrderedCollection with: 'ropa nueva'.
	
	searchResultsCollection := sentenceFinderOfStackWithOneElement find: prefixToFind.
		
	self assert: searchResultsCollection equals: expectedSentencesCollection.
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/4/2021 02:06:06'!
test03couldFindAMatchingSentenceWithinAStackWithMoreThanOneElement

	| prefixToFind searchResultsCollection expectedSentencesCollection |
	
	prefixToFind := 'jab'.
	expectedSentencesCollection := OrderedCollection with: 'jabon de coco'.
	
	searchResultsCollection := sentenceFinderOfStackWithALotOfElements find: prefixToFind.
	
	self assert: searchResultsCollection equals: expectedSentencesCollection.
	



! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/4/2021 02:05:55'!
test04couldFindMultipleMatchingSentencesWithinAStackWithMoreThanOneElement

	| prefixToFind searchResultsCollection expectedSentencesCollection |
	
	prefixToFind := 'Comp'.
	expectedSentencesCollection :=OrderedCollection  with: 'Competencia de natacion' with:'Compresion'
	with: 'Computadora de escritorio' with: 'Compañia de autos' .
	
	searchResultsCollection := sentenceFinderOfStackWithALotOfElements find: prefixToFind.
	
	self assert: searchResultsCollection equals: expectedSentencesCollection.
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/4/2021 02:17:04'!
test05couldNotFindAnyMatchingSentencesWithinAStack

	| prefixToFind searchResultsCollectionOfStackWithOneElement searchResultsCollectionOfStackWithALotOfElements |
	
	prefixToFind := 'aghjska'.
	
	searchResultsCollectionOfStackWithALotOfElements := sentenceFinderOfStackWithALotOfElements find: prefixToFind.
	searchResultsCollectionOfStackWithOneElement := sentenceFinderOfStackWithOneElement find: prefixToFind.
	
	self assert: (( searchResultsCollectionOfStackWithOneElement size = 0 ) and: ( searchResultsCollectionOfStackWithALotOfElements size = 0 )).
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/4/2021 02:23:01'!
test06couldNotFindAnyCaseSensitiveMatchingSentences
	
	| prefixToFind searchResultsCollection notExpectedSentencesCollection|
	
	prefixToFind := 'comp'.
	notExpectedSentencesCollection :=OrderedCollection  with: 'Competencia de natacion' with:'Compresion'
	with: 'Computadora de escritorio' with: 'Compañia de autos' .
	
	searchResultsCollection := sentenceFinderOfStackWithALotOfElements find: prefixToFind.
	
	self deny: searchResultsCollection = notExpectedSentencesCollection .
 ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/4/2021 04:19:44'!
test07stackWithOneElementRemainsInTheSameOrderAsItWasBeforeUsingFind

	| prefixToFind  stackBeforeFinding |
	
	prefixToFind := 'ropa '.

	stackBeforeFinding := self makeCopyOfStackWithOneElement .
	sentenceFinderOfStackWithOneElement find: prefixToFind.
	
	self assert: stackWithOneElement top equals: stackBeforeFinding top.
	self assert: stackWithOneElement size equals: stackBeforeFinding size.
	
	
	

! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/4/2021 04:15:52'!
test08stackWithALotOfElementsRemainsInTheSameOrderAsItWasBeforeUsingFind

	| prefixToFind  stackBeforeFinding currentElementComparisonIsCorrect |
	
	prefixToFind := 'comp'.

	stackBeforeFinding := self makeCopyOfStackWithALotOfElements.
	
	sentenceFinderOfStackWithALotOfElements find: prefixToFind .
	
	self assert: stackWithALotOfElements size equals: stackBeforeFinding size.
		
	sentenceFinderOfStackWithALotOfElements inTheWholeStack: stackWithALotOfElements repeatOperation: [ 
			currentElementComparisonIsCorrect := stackBeforeFinding pop = stackWithALotOfElements pop.
			self assert: currentElementComparisonIsCorrect.
	].
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/4/2021 04:21:00'!
test09findWorksProperlyIfTheStackWithOneElementIsModified

	| prefixToFind  expectedSentencesCollection searchResultsCollection |
	
	prefixToFind := 'ropa '.
	stackWithOneElement push: 'hola'.
	expectedSentencesCollection := OrderedCollection with: 'ropa nueva'.
	
	searchResultsCollection := sentenceFinderOfStackWithOneElement find: prefixToFind.
	
	self assert: searchResultsCollection equals: expectedSentencesCollection.
	
	2 timesRepeat: [
		stackWithOneElement pop.
	].
	
	self should: [sentenceFinderOfStackWithOneElement find: prefixToFind ] raise: Error withExceptionDo: [:anError | 
		self assert: anError messageText equals: SentenceFinderByPrefix cannotFindSentecesWithAPrefixInAnEmptyStack
	]. 
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/4/2021 03:47:31'!
test10findWorksProperlyIfTheStackWithALotOfElementsIsModified

	| prefixToFind  expectedSentencesCollection searchResultsCollection |
	
	prefixToFind := 'Ca'.
	stackWithALotOfElements push: 'cualquier cosa'.
	expectedSentencesCollection := OrderedCollection with: 'Café descafeinado'.
	
	searchResultsCollection := sentenceFinderOfStackWithALotOfElements find: prefixToFind.
	
	self assert: searchResultsCollection equals: expectedSentencesCollection.
	
	sentenceFinderOfStackWithALotOfElements inTheWholeStack: stackWithALotOfElements repeatOperation: [ stackWithALotOfElements pop ].

	self should: [sentenceFinderOfStackWithALotOfElements find: prefixToFind ] raise: Error withExceptionDo: [:anError | 
		self assert: anError messageText equals: SentenceFinderByPrefix cannotFindSentecesWithAPrefixInAnEmptyStack
	]. ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'MV 11/4/2021 02:18:57'!
test11findWorksProperlyWithPrefixesAndDoesNotWorkWithSuffixes

	| prefixToFind  expectedSentencesCollection searchResultsCollection |
	
	prefixToFind := 'ja'.
	
	expectedSentencesCollection := OrderedCollection with: 'jabon de coco'.   "En el stackWithALotOfElements se tiene 'jabon de coco' y 'Comadreja', que tiene a ja como sufijo"
	
	searchResultsCollection := sentenceFinderOfStackWithALotOfElements find: prefixToFind.
	
	self assert: searchResultsCollection equals: expectedSentencesCollection.
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

!SentenceFinderByPrefix methodsFor: 'finding' stamp: 'MV 11/4/2021 03:22:35'!
find: aPrefix	
 
	associatedStack isEmpty ifTrue: [self error: self class cannotFindSentecesWithAPrefixInAnEmptyStack ] .
	
	^ self searchForSentenceMatchingsWith: aPrefix.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'MV 11/2/2021 02:07:15'!
initializeWith: aStackToAssociate

	associatedStack := aStackToAssociate.! !


!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'MV 11/4/2021 04:12:00'!
compareStackSentenceWithPrefix: aPrefix andSaveInAuxiliarStack: anAuxiliarStack savingMatchesIn: searchResultsCollection

	| currentSentenceToCompare aMatchWasMadeWithTheCurrentSentence |

	currentSentenceToCompare := self transferSentenceFrom: associatedStack to: anAuxiliarStack .
		
	aMatchWasMadeWithTheCurrentSentence := currentSentenceToCompare beginsWith: aPrefix.
		
	aMatchWasMadeWithTheCurrentSentence ifTrue: [ searchResultsCollection add: currentSentenceToCompare ].
	! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'MV 11/4/2021 03:47:44'!
inTheWholeStack: aStack repeatOperation: aBlock

	aStack size timesRepeat: [ aBlock value ].! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'MV 11/4/2021 04:09:42'!
restoreOriginalStackSentenceFrom: anotherStack
	
	self transferSentenceFrom: anotherStack to: associatedStack.! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'MV 11/4/2021 04:12:00'!
searchForSentenceMatchingsWith: aPrefix

	| auxiliarStack searchResults |
	
	auxiliarStack := OOStack  new.
	searchResults := OrderedCollection new.
	
	self inTheWholeStack: associatedStack repeatOperation: [ self compareStackSentenceWithPrefix: aPrefix andSaveInAuxiliarStack: auxiliarStack savingMatchesIn: searchResults ].
	
	self inTheWholeStack: auxiliarStack repeatOperation: [ self restoreOriginalStackSentenceFrom: auxiliarStack ]. 

	^searchResults .! !

!SentenceFinderByPrefix methodsFor: 'finding - private' stamp: 'MV 11/4/2021 04:09:42'!
transferSentenceFrom: sourceStack to: destinationStack

	| currentSentenceToTransfer |
	
	currentSentenceToTransfer := sourceStack pop.
	destinationStack push: currentSentenceToTransfer .
	
	^ currentSentenceToTransfer .
	
	! !

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
