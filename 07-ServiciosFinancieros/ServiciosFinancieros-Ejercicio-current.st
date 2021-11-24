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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/24/2021 16:19:12'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	RegularDeposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/24/2021 16:19:21'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	RegularDeposit register: 100 * peso on: account.
	RegularWithdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/24/2021 16:19:21'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (RegularWithdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/24/2021 16:19:21'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := RegularDeposit register: 100 * peso on: account.
	withdraw := RegularWithdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/24/2021 16:19:21'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  RegularDeposit for: 100 * peso.
	withdraw := RegularWithdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/24/2021 16:19:12'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := RegularDeposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

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

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MV 11/24/2021 17:05:28'!
test03

	| originAccount destinationAccount transfer expectedDepositFromTransference |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transference from: originAccount to: destinationAccount for: 1000*peso.
	expectedDepositFromTransference := TransferenceRelatedDeposit for: 1000*peso associatedTo: transfer.
	
	self assert: expectedDepositFromTransference equals: transfer associatedWithdraw counterpart. ! !

!TransferenceTest methodsFor: 'as yet unclassified' stamp: 'MV 11/24/2021 17:05:28'!
test04

	| originAccount destinationAccount transfer expectedWithdrawFromTransference |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transference from: originAccount to: destinationAccount for: 1000*peso.
	expectedWithdrawFromTransference := TransferenceRelatedDeposit for: 1000*peso associatedTo: transfer.
	
	self assert: expectedWithdrawFromTransference equals: transfer associatedDeposit counterpart. ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'MV 11/24/2021 16:16:58'!
handleHowDoesThisTransactionAffectTheBalance

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'MV 11/24/2021 17:01:36'!
value 

	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'MV 11/24/2021 16:22:00'!
register: aValue on: aReceptiveAccount

	| transaction |
	
	transaction := self for: aValue.
	aReceptiveAccount register: transaction.
		
	^ transaction! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'MV 11/24/2021 16:30:01'!
register: aValue on: aReceptiveAccount thatComesFromTransference: aTransference 
	
	| transaction |
	
	transaction := self for: aValue associatedTo: aTransference .
	aReceptiveAccount register: transaction.
		
	^ transaction! !


!classDefinition: #RegularDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #RegularDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!RegularDeposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!RegularDeposit methodsFor: 'value' stamp: 'MV 11/24/2021 16:16:58'!
handleHowDoesThisTransactionAffectTheBalance

	^ self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RegularDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
RegularDeposit class
	instanceVariableNames: ''!

!RegularDeposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #RegularWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #RegularWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!RegularWithdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!RegularWithdraw methodsFor: 'value' stamp: 'MV 11/24/2021 16:16:58'!
handleHowDoesThisTransactionAffectTheBalance

	^ value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RegularWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
RegularWithdraw class
	instanceVariableNames: ''!

!RegularWithdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferenceRelatedDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferenceRelatedDeposit
	instanceVariableNames: 'associatedTransference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceRelatedDeposit methodsFor: 'as yet unclassified' stamp: 'MV 11/24/2021 16:57:58'!
= anotherTransferenceDeposit

	^ value = anotherTransferenceDeposit value.
	 "suena a que habria que comparar tambien si las transferencias a las que están asociadas ambas transacciones sean iguales, pero llevaria a implementar otro igual en la Transference que comparase su value y nada más, pues si ponemos a que compare sus patas entraria en recursion infinita. " 
	! !

!TransferenceRelatedDeposit methodsFor: 'as yet unclassified' stamp: 'MV 11/24/2021 17:03:50'!
counterpart
		
	^ associatedTransference associatedWithdraw.! !

!TransferenceRelatedDeposit methodsFor: 'as yet unclassified' stamp: 'MV 11/24/2021 17:00:42'!
handleHowDoesThisTransactionAffectTheBalance

	^ self value! !

!TransferenceRelatedDeposit methodsFor: 'as yet unclassified' stamp: 'MV 11/24/2021 16:28:26'!
initializeFor: aValue associatedTo: aTransference

	value := aValue .
	associatedTransference := aTransference .


	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceRelatedDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceRelatedDeposit class
	instanceVariableNames: ''!

!TransferenceRelatedDeposit class methodsFor: 'instance creation' stamp: 'MV 11/24/2021 17:05:28'!
for: aValue associatedTo: aTransference

	^ TransferenceRelatedDeposit new initializeFor: aValue associatedTo: aTransference .! !


!classDefinition: #TransferenceRelatedWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferenceRelatedWithdraw
	instanceVariableNames: 'associatedTransference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceRelatedWithdraw methodsFor: 'as yet unclassified' stamp: 'MV 11/24/2021 16:41:35'!
counterpart
	
	^ associatedTransference associatedDeposit. ! !

!TransferenceRelatedWithdraw methodsFor: 'as yet unclassified' stamp: 'MV 11/24/2021 17:00:25'!
handleHowDoesThisTransactionAffectTheBalance

	^ value negated! !

!TransferenceRelatedWithdraw methodsFor: 'as yet unclassified' stamp: 'MV 11/24/2021 16:28:14'!
initializeFor: aValue associatedTo: aTransference

	value := aValue .
	associatedTransference := aTransference .


	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferenceRelatedWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferenceRelatedWithdraw class
	instanceVariableNames: ''!

!TransferenceRelatedWithdraw class methodsFor: 'instance creation' stamp: 'MV 11/24/2021 17:05:35'!
for: aValue associatedTo: aTransference

	^ TransferenceRelatedWithdraw new initializeFor: aValue associatedTo: aTransference .
	! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MV 11/24/2021 16:16:59'!
balance

	^transactions sum: [ :aTransaction | aTransaction handleHowDoesThisTransactionAffectTheBalance ] ifEmpty: [ 0 ]
	
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



!classDefinition: #Transference category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'transferedAmount associatedWithdraw associatedDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'MV 11/24/2021 16:00:25'!
initializeWithValue: amountToTransfer thatComesFromWithdraw: aWithdrawFromTransference toDeposit: aDepositFromTransference 

	transferedAmount := amountToTransfer .
	associatedWithdraw := aWithdrawFromTransference .
	associatedDeposit := aDepositFromTransference .
! !


!Transference methodsFor: 'accessing' stamp: 'MV 11/24/2021 16:41:55'!
associatedDeposit
	
	^associatedDeposit! !

!Transference methodsFor: 'accessing' stamp: 'MV 11/24/2021 16:39:56'!
associatedWithdraw
	
	^associatedWithdraw! !

!Transference methodsFor: 'accessing' stamp: 'MV 11/22/2021 21:49:00'!
value

	^ transferedAmount .
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros-Ejercicio'!
Transference class
	instanceVariableNames: 'associatedWithdraw associatedDeposit'!

!Transference class methodsFor: 'instance creation' stamp: 'MV 11/24/2021 17:05:35'!
from: anOriginReceptiveAccount to: aDestinationReceptiveAccount for: amountToTransfer

	| transference depositFromTransference withdrawFromTransference |
	
	transference := self new .

	withdrawFromTransference := TransferenceRelatedWithdraw register: amountToTransfer on: anOriginReceptiveAccount thatComesFromTransference: transference.
	depositFromTransference := TransferenceRelatedDeposit register: amountToTransfer on: aDestinationReceptiveAccount thatComesFromTransference: transference.
	
	transference initializeWithValue: amountToTransfer thatComesFromWithdraw: withdrawFromTransference toDeposit: depositFromTransference .
	
	^ transference.! !
