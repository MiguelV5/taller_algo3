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
	instanceVariableNames: 'stackCollection state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:09:42'!
initialize

	stackCollection  := OrderedCollection new.
	state  := StateIsEmpty new.

	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 02:50:04'!
isEmpty

	^stackCollection isEmpty. 
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:53:28'!
obtainTop

	^stackCollection at: 1! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:55:01'!
pop
	|poppedElement|
	poppedElement := state verifyIfPopIsPosible: self.
	state updateStateIfpoppedAndNowEmpty: self.
	^ poppedElement .
	
	
	
	
	
	

	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:09:06'!
push: objectToAdd
	
	state updateStateIfEmpty: self.
	stackCollection addFirst: objectToAdd .

	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:18:37'!
removeElement

	^stackCollection removeFirst.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 03:07:21'!
size

	^ stackCollection size .! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:54:50'!
top
	^state topStackIfPosible: self.
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:32:26'!
updateStateToEmpty
	
	state := StateIsEmpty  new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:10:07'!
updateStateToNotEmpty

	state:= StateIsNotEmpty  new.! !

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


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: 'stackCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:10:53'!
updateStateIfEmpty: stack

	self subclassResponsibility .! !


!classDefinition: #StateIsEmpty category: 'Stack-Exercise'!
StackState subclass: #StateIsEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateIsEmpty methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:52:31'!
topStackIfPosible: stack

	stack error: OOStack stackEmptyErrorDescription 

	! !

!StateIsEmpty methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:09:06'!
updateStateIfEmpty: stack

	stack updateStateToNotEmpty.
	! !

!StateIsEmpty methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:30:37'!
updateStateIfpoppedAndNowEmpty: stack

	^'Todo joya'! !

!StateIsEmpty methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:21:42'!
verifyIfPopIsPosible: stack

	stack error: OOStack stackEmptyErrorDescription 

	! !


!classDefinition: #StateIsNotEmpty category: 'Stack-Exercise'!
StackState subclass: #StateIsNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateIsNotEmpty methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:53:42'!
topStackIfPosible: stack

	^stack obtainTop .! !

!StateIsNotEmpty methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:26:13'!
updateStateIfEmpty: stack

	^'Todo joya'! !

!StateIsNotEmpty methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:49:34'!
updateStateIfpoppedAndNowEmpty: stack

	(stack isEmpty) ifTrue: [stack updateStateToEmpty].
	! !

!StateIsNotEmpty methodsFor: 'as yet unclassified' stamp: 'pb 10/29/2021 20:35:01'!
verifyIfPopIsPosible: stack

	^stack removeElement .! !
