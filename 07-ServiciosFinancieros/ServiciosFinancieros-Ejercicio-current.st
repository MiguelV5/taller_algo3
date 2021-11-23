!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MV 11/23/2021 01:54:46'!
atest05

	| destinationAccount expectedOriginAccount resultingOriginAccount auxOriginAccount transference1 |
	
	expectedOriginAccount := ReceptiveAccount new.
	auxOriginAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transference1 := Transference from: expectedOriginAccount to: destinationAccount for: 1000*peso.
	Transference from: auxOriginAccount to: destinationAccount for: 1000*peso.
	
	resultingOriginAccount := destinationAccount whoSentThisTransference: transference1. 
	
	self assert: expectedOriginAccount equals: resultingOriginAccount .
	self deny: auxOriginAccount = resultingOriginAccount .

	! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MV 11/23/2021 02:05:45'!
test01ATrasferedAmountFromOneAccountToAnotherWasMadeCorrectly

	| originAccount destinationAccount expectedOriginAccountBalance expectedDestinationAccountBalance |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	expectedOriginAccountBalance := -10*peso.
	expectedDestinationAccountBalance := 10*peso .
	
	Transference from: originAccount to: destinationAccount for: 10*peso.
	
	self assert: expectedOriginAccountBalance equals: originAccount balance.
	self assert: expectedDestinationAccountBalance equals: destinationAccount balance.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MV 11/23/2021 02:03:07'!
test02TheTransferenceWasMadeWithTheExpectedAmount

	| originAccount destinationAccount expectedOriginAccountBalance expectedDestinationAccountBalance transfer |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	expectedOriginAccountBalance := -1000*peso.
	expectedDestinationAccountBalance := 1000*peso .
	
	transfer := Transference from: originAccount to: destinationAccount for: 1000*peso.
	
	self assert: expectedOriginAccountBalance equals: originAccount balance.
	self assert: expectedDestinationAccountBalance equals: destinationAccount balance.
	self assert:  1000*peso equals: transfer value.! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MV 11/23/2021 01:46:03'!
test03OriginAccountKnowsDestinationAccountOfTheLastTransferenceMade

	| originAccount expectedDestinationAccount transference resultingDestinationAccount |
	
	originAccount := ReceptiveAccount new.
	expectedDestinationAccount := ReceptiveAccount new.
	
	transference := Transference from: originAccount to: expectedDestinationAccount for: 1000*peso.
	
	resultingDestinationAccount := originAccount whoReceivedThisTransference: transference. 
	
	self assert: expectedDestinationAccount equals: resultingDestinationAccount .
	
	! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MV 11/23/2021 02:02:12'!
test04DestinationAccountKnowsOriginAccountOfTheLastTransferenceMade

	| transference destinationAccount expectedOriginAccount resultingOriginAccount |
	
	expectedOriginAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transference := Transference from: expectedOriginAccount to: destinationAccount for: 1000*peso.
	
	resultingOriginAccount := destinationAccount whoSentThisTransference: transference. 
	
	self assert: expectedOriginAccount equals: resultingOriginAccount .
	
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'MV 11/23/2021 00:39:44'!
affectBalance

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'MV 11/23/2021 00:40:47'!
affectBalance

	^ self value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'MV 11/23/2021 00:40:24'!
affectBalance

	^ value negated! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MV 11/23/2021 01:53:10'!
balance

	^transactions sum: [ :aTransaction | aTransaction affectBalance ] ifEmpty: [ 0 ]
	
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'pb 11/18/2021 21:33:47'!
register: aTransaction

	transactions add: aTransaction .
	
	
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'transference protocol' stamp: 'MV 11/23/2021 01:38:27'!
whoReceivedThisTransference: aTransference 
	
	^aTransference destinationAccount.
	! !

!ReceptiveAccount methodsFor: 'transference protocol' stamp: 'MV 11/23/2021 01:40:46'!
whoSentThisTransference: aTransference 
	^ aTransference originAccount.! !


!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'receptiveAccount receptiveAccount2 simpleMeasure transferedAmount destinationAccount originAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'MV 11/23/2021 01:41:33'!
initializeWith: amountToTransfer from: anOriginAccount to: aDestinationAccount 

	transferedAmount := amountToTransfer .
	destinationAccount := aDestinationAccount .
	originAccount := anOriginAccount .! !


!Transference methodsFor: 'accessing' stamp: 'MV 11/23/2021 01:38:27'!
destinationAccount

	^destinationAccount.! !

!Transference methodsFor: 'accessing' stamp: 'MV 11/23/2021 01:41:02'!
originAccount
	
	^originAccount.! !

!Transference methodsFor: 'accessing' stamp: 'MV 11/22/2021 21:49:00'!
value

	^ transferedAmount .
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: ''!

!Transference class methodsFor: 'instance creation' stamp: 'MV 11/23/2021 01:41:49'!
from: anOriginReceptiveAccount to: aDestinationReceptiveAccount for: amountToTransfer

	| transfer |

	Withdraw register: amountToTransfer on: anOriginReceptiveAccount .
	Deposit register: amountToTransfer on: aDestinationReceptiveAccount .	
	
	transfer := self new initializeWith: amountToTransfer from: anOriginReceptiveAccount to: aDestinationReceptiveAccount .

	^ transfer.! !
