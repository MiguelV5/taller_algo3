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

!CustomerBookTest methodsFor: 'testHelper' stamp: 'MV 10/10/2021 18:10:17'!
customerBookVerification: aCustomerBook forCustomer: aCustomer withBookQuantitiesPerAccess: quantitiesArray withStatement: statementSelectorToTest
	
	self assert: (quantitiesArray at: 1) equals: aCustomerBook numberOfActiveCustomers.
	"un metodo para cada uno, asi queda más entendible solo con leerlo"
	self assert: (quantitiesArray at: 2) equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: (quantitiesArray at: 3) equals: aCustomerBook numberOfCustomers.
	
	(statementSelectorToTest asMessageWith: (aCustomerBook includesCustomerNamed: aCustomer)) sendTo: self.
! !


!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/8/2021 03:10:37'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook instanceOfExecution |
	
	customerBook := CustomerBook new.
	instanceOfExecution := ExecutionFeatures newAction: [customerBook addCustomerNamed: 'John Lennon'.] .

	self assert: (instanceOfExecution isExecutionTimeLessThan: 50*millisecond  ).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/9/2021 01:36:27'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook instanceOfExecution |
	
	customerBook := CustomerBook newWithCustomer: 'Paul McCartney'.
	
	instanceOfExecution := ExecutionFeatures newAction: [customerBook removeCustomerNamed: 'Paul McCartney'.].	
	
	self assert:( instanceOfExecution isExecutionTimeLessThan: 100*millisecond  ).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/8/2021 04:01:01'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	ExecutionFeatures new errorHandle: [ customerBook addCustomerNamed: ''. self fail ] withErrorClass: Error withErrorVerification: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/10/2021 18:08:25'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook newWithCustomer: 'John Lennon'. 
	
	ExecutionFeatures new errorHandle: [ customerBook removeCustomerNamed: 'Paul McCartney'. self fail ] withErrorClass: NotFound withErrorVerification: [ :anError | 	
	self assert: customerBook numberOfCustomers = 1. 
	self assert: (customerBook includesCustomerNamed: 'John Lennon') ]. "Concepto bien, pero nombres descriptivos de lo que hace y no sobre como lo implementa.
	Un ejemplo podria ser Should not take more than(...)"
	
	"Ademas el ExecutionFeatures está demás porque no representa algo de la realidad del problema, debería ser algo dentro del CustomerBookTest."

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/10/2021 18:11:57'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook newWithCustomer: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self customerBookVerification: customerBook forCustomer: paulMcCartney withBookQuantitiesPerAccess: #(0 1 1) withStatement: #assert:.
	"Modificar el customerBookVerification. No se entiende qué es lo que hace. 
	ej. Verificacion de cantidad de clientes"

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/10/2021 18:10:32'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook newWithCustomer: 'Paul McCartney'.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self customerBookVerification: customerBook forCustomer: paulMcCartney withBookQuantitiesPerAccess: #(0 0 0) withStatement: #deny: . 

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/10/2021 18:13:20'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook newWithCustomer: 'John Lennon'.

	ExecutionFeatures new errorHandle: [ customerBook suspendCustomerNamed: 'Ringo Starr'. self fail ] withErrorClass: CantSuspend withErrorVerification: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ].

! !

!CustomerBookTest methodsFor: 'tests' stamp: 'MV 10/9/2021 01:40:26'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook newWithCustomer: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	ExecutionFeatures new errorHandle: [ customerBook suspendCustomerNamed: johnLennon. self fail ] withErrorClass: CantSuspend withErrorVerification: [ :anError | 
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

!CustomerBook methodsFor: 'customer management' stamp: 'MV 10/9/2021 04:02:49'!
removeCustomerNamed: aName 

	| wasRemovedFromActiveCustomers wasRemovedFromSuspendedCustomers | 
 
	wasRemovedFromActiveCustomers := self searchAndDeleteCustomer: aName customerBookState: activeCustomers.
	wasRemovedFromSuspendedCustomers := self searchAndDeleteCustomer: aName customerBookState: suspendedCustomers .
	
	(wasRemovedFromActiveCustomers = aName) | (wasRemovedFromSuspendedCustomers = aName) ifTrue: [
			^ aName.
		].
	
	^ NotFound signal.
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'MV 10/10/2021 17:56:26'!
searchAndDeleteCustomer: aCustomersName customerBookState: aCustomerBookType
	
	1 to: aCustomerBookType size do: 
	[ :index |
		aCustomersName = (aCustomerBookType at: index)
			ifTrue: [
				aCustomerBookType removeAt: index.
				^ aCustomersName .
			] 
	].
	
	^ 'the customer was not found in this Book' .

	"Revisar mensajes de OrderCollections que simplifiquen la iteración"! !

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


!classDefinition: #ExecutionFeatures category: 'CodigoRepetido-Ejercicio'!
Object subclass: #ExecutionFeatures
	instanceVariableNames: 'actionToPerform'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!ExecutionFeatures methodsFor: 'timeSpecifications' stamp: 'MV 10/8/2021 03:03:04'!
calculateExecutionTime

	| millisecondsBeforeRunning millisecondsAfterRunning |

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	actionToPerform value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ (millisecondsAfterRunning - millisecondsBeforeRunning) 
	! !

!ExecutionFeatures methodsFor: 'timeSpecifications' stamp: 'MV 10/8/2021 02:59:18'!
isExecutionTimeLessThan: aTimeLimit

	| resultingTime | 
	
	resultingTime := self calculateExecutionTime.

	^ resultingTime < aTimeLimit.! !


!ExecutionFeatures methodsFor: 'initialization' stamp: 'MV 10/8/2021 03:03:04'!
initializeWithAction: anAction
	actionToPerform := anAction .! !


!ExecutionFeatures methodsFor: 'errorHandling' stamp: 'MV 10/8/2021 04:00:01'!
errorHandle: aFailureAction withErrorClass: anErrorClass withErrorVerification: verificationAction
	
	aFailureAction on: anErrorClass do: verificationAction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExecutionFeatures class' category: 'CodigoRepetido-Ejercicio'!
ExecutionFeatures class
	instanceVariableNames: ''!

!ExecutionFeatures class methodsFor: 'as yet unclassified' stamp: 'MV 10/8/2021 03:06:31'!
newAction: anAction
	^ self new initializeWithAction: anAction.! !
