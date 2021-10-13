!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testHelper - public' stamp: 'MV 10/11/2021 16:18:31'!
ifThisManagementFails: anActionProneToFail withErrorType: anErrorType verifyThat: actionsToVerify
	
	anActionProneToFail on: anErrorType do: actionsToVerify .! !

!CustomerBookTest methodsFor: 'testHelper - public' stamp: 'MV 10/11/2021 16:12:30'!
shouldNotTakeMoreTimeThan: aTimeLimit toApply: aManagementToTheCustomerBook

	| resultingTime | 
	
	resultingTime := self calculateTimeOf: aManagementToTheCustomerBook .

	^ resultingTime < aTimeLimit.! !

!CustomerBookTest methodsFor: 'testHelper - public' stamp: 'pb 10/13/2021 17:52:30'!
verifyCustomersQuantitiesIn: aCustomerBook withExpectedQuantities: listOfExpectedQuantities 
	
	self activeCustomersQuantityIn: aCustomerBook shouldBe: (listOfExpectedQuantities at: 1).
	self suspendedCustomersQuantityIn: aCustomerBook shouldBe: (listOfExpectedQuantities at: 2).
	self totalCustomersQuantityIn: aCustomerBook shouldBe: (listOfExpectedQuantities at: 3).
	
	
! !

!CustomerBookTest methodsFor: 'testHelper - public' stamp: 'MV 10/11/2021 16:01:19'!
verifyThatTheCustomer: aCustomer isIncludedIn: aCustomerBook

	self assert: (aCustomerBook includesCustomerNamed: aCustomer).! !

!CustomerBookTest methodsFor: 'testHelper - public' stamp: 'MV 10/11/2021 16:01:16'!
verifyThatTheCustomer: aCustomer isNotIncludedIn: aCustomerBook

	self deny: (aCustomerBook includesCustomerNamed: aCustomer).! !


!CustomerBookTest methodsFor: 'testHelper - private' stamp: 'MV 10/11/2021 16:01:38'!
activeCustomersQuantityIn: aCustomerBook shouldBe: aQuantity

	self assert: aQuantity equals: aCustomerBook numberOfActiveCustomers.! !

!CustomerBookTest methodsFor: 'testHelper - private' stamp: 'MV 10/11/2021 14:32:14'!
calculateTimeOf: managementToApplyToTheCustomerBook

	| millisecondsBeforeRunning millisecondsAfterRunning |

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	managementToApplyToTheCustomerBook value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ (millisecondsAfterRunning - millisecondsBeforeRunning) 
	! !

!CustomerBookTest methodsFor: 'testHelper - private' stamp: 'MV 10/11/2021 16:01:28'!
suspendedCustomersQuantityIn: aCustomerBook shouldBe: aQuantity

	self assert: aQuantity equals: aCustomerBook numberOfSuspendedCustomers.! !

!CustomerBookTest methodsFor: 'testHelper - private' stamp: 'MV 10/11/2021 16:01:23'!
totalCustomersQuantityIn: aCustomerBook shouldBe: aQuantity

	self assert: aQuantity equals: aCustomerBook numberOfCustomers.! !


!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/11/2021 16:12:23'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	customerBook := CustomerBook new.
	
	self assert: ( self shouldNotTakeMoreTimeThan: 50*millisecond toApply: [customerBook addCustomerNamed: 'John Lennon'.] )
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/11/2021 16:12:23'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	customerBook := CustomerBook newWithCustomer: 'Paul McCartney'.
	
	self assert: ( self shouldNotTakeMoreTimeThan: 100*millisecond toApply: [customerBook removeCustomerNamed: 'Paul McCartney'.] ).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/11/2021 16:27:15'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self ifThisManagementFails: [ customerBook addCustomerNamed: ''. self fail ] withErrorType: Error verifyThat: [ :anError | 
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty ].
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/11/2021 16:18:31'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook newWithCustomer: 'John Lennon'. 
	
	self ifThisManagementFails: [ customerBook removeCustomerNamed: 'Paul McCartney'. self fail ] withErrorType: NotFound verifyThat: [ :anError | 	
		self assert: customerBook numberOfCustomers = 1. 
		self assert: (customerBook includesCustomerNamed: 'John Lennon') ]. 
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'pb 10/13/2021 17:52:30'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney expectedCustomerQuantities |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook newWithCustomer: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	expectedCustomerQuantities := OrderedCollection with: 0 with: 1 with: 1. 
	
	self verifyCustomersQuantitiesIn: customerBook withExpectedQuantities: expectedCustomerQuantities.
	self verifyThatTheCustomer: paulMcCartney isIncludedIn: customerBook.

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'pb 10/13/2021 17:52:30'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney expectedCustomerQuantities |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook newWithCustomer: 'Paul McCartney'.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	expectedCustomerQuantities := OrderedCollection with: 0 with: 0 with: 0.
	
	self verifyCustomersQuantitiesIn: customerBook withExpectedQuantities: expectedCustomerQuantities.
	self verifyThatTheCustomer: paulMcCartney isNotIncludedIn: customerBook.
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/11/2021 16:18:31'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook newWithCustomer: 'John Lennon'.

	self ifThisManagementFails: [ customerBook suspendCustomerNamed: 'Ringo Starr'. self fail ] withErrorType: CantSuspend verifyThat: [ :anError | 
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: 'John Lennon') ].

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/11/2021 16:18:31'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook newWithCustomer: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self ifThisManagementFails: [ customerBook suspendCustomerNamed: johnLennon. self fail ] withErrorType: CantSuspend verifyThat: [ :anError | 
		self assert: customerBook numberOfCustomers = 1.
		self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspendedCustomers activeCustomers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'MV 10/9/2021 02:58:43'!
initialize

	activeCustomers := OrderedCollection new.
	suspendedCustomers:= OrderedCollection new.! !

!CustomerBook methodsFor: 'initialization' stamp: 'MV 10/9/2021 01:31:12'!
initializeWithCustomer: aCustomer

	self initialize.
	self addCustomerNamed: aCustomer.
	! !


!CustomerBook methodsFor: 'customer management' stamp: 'MV 10/10/2021 18:03:53'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	activeCustomers add: aName 
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'MV 10/11/2021 14:05:37'!
removeCustomerNamed: aName 

	| wasRemovedFromActiveCustomers wasRemovedFromSuspendedCustomers | 
 
	wasRemovedFromActiveCustomers := self searchAndRemoveIfFound: aName inCustomerList: activeCustomers.
	wasRemovedFromSuspendedCustomers := self searchAndRemoveIfFound: aName inCustomerList: suspendedCustomers.
	
	(wasRemovedFromActiveCustomers = aName) | (wasRemovedFromSuspendedCustomers = aName) ifTrue: [
			^ aName.
		].
	
	^ NotFound signal.
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'pb 10/13/2021 17:45:53'!
searchAndRemoveIfFound: aCustomersName inCustomerList: aCustomerList
	
	^ aCustomerList remove: aCustomersName ifAbsent: ['the customer was not found in this Book list'].
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'MV 10/10/2021 18:02:43'!
suspendCustomerNamed: aName 
	
	(activeCustomers includes: aName) ifFalse: [^CantSuspend signal].
	
	activeCustomers remove: aName.
	
	suspendedCustomers add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'MV 10/9/2021 02:58:43'!
numberOfActiveCustomers
	
	^activeCustomers size! !

!CustomerBook methodsFor: 'accessing' stamp: 'MV 10/10/2021 17:58:50'!
numberOfCustomers
	
	^ self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'accessing' stamp: 'MV 10/9/2021 02:58:29'!
numberOfSuspendedCustomers
	
	^suspendedCustomers size! !


!CustomerBook methodsFor: 'testing' stamp: 'MV 10/9/2021 02:58:43'!
includesCustomerNamed: aName

	^(activeCustomers includes: aName) or: [ suspendedCustomers includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'MV 10/9/2021 02:58:43'!
isEmpty
	
	^activeCustomers isEmpty and: [ suspendedCustomers isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'MV 10/9/2021 01:37:59'!
newWithCustomer: aCustomer
	
	^ CustomerBook new initializeWithCustomer: aCustomer.! !
