!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'portfolioWithNoAccounts receptiveAccountOne portfolioWithOneAccount receptiveAccountTwo receptiveAccountThree portfolioWithMultipleAccounts portfolioWithPorfolio portfolioWithPorfolioWithNoAccounts depositOfAccountOne depositOfAccountTwo depositOfAccountThree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'pb 11/26/2021 02:55:13'!
atest04

	| aTransaction |
	aTransaction:= RegularDeposit for: 10*peso.
	self should: [portfolioWithNoAccounts oneOfTheAccountsHasRegistered: aTransaction ] raise:  Error withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio noAccountsNoTransactionErrorDescription]! !

!PortfolioTest methodsFor: 'tests' stamp: 'pb 11/26/2021 02:05:10'!
test01IfPorfolioHasNoAccountsBalanceIsZero
	
	self assert: 0*peso equals: portfolioWithNoAccounts balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'pb 11/26/2021 02:07:39'!
test02IfPortfolioHasOneAccountTheBalanceOfThePortfolioIsTheSameAsTheBalanceOfTheAccount
	
	self assert: 10*peso equals: portfolioWithOneAccount balance .! !

!PortfolioTest methodsFor: 'tests' stamp: 'pb 11/26/2021 02:11:26'!
test03IfPortfolioHasMultipleAccountsBalanceIsTheSumOfAllTheAcountsBalances

	self assert: 45*peso equals: portfolioWithMultipleAccounts balance .! !

!PortfolioTest methodsFor: 'tests' stamp: 'pb 11/26/2021 03:56:10'!
test04PortfolioWithNoAccountsCanNotRegisterATransaction

	| aTransaction |
	aTransaction:= RegularDeposit for: 10*peso.
	self should: [portfolioWithNoAccounts oneOfTheAccountsHasRegistered: aTransaction ] raise:  Error withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio noAccountsNoTransactionErrorDescription]! !

!PortfolioTest methodsFor: 'tests' stamp: 'pb 11/26/2021 03:35:38'!
test05DifferentPorfoliosHaveRegisteredATransaction

	self assert: (portfolioWithOneAccount oneOfTheAccountsHasRegistered: depositOfAccountOne ).
	
	self assert: (portfolioWithMultipleAccounts oneOfTheAccountsHasRegistered: depositOfAccountOne ) .
	self assert: (portfolioWithMultipleAccounts oneOfTheAccountsHasRegistered: depositOfAccountTwo ) .
	self assert: (portfolioWithMultipleAccounts oneOfTheAccountsHasRegistered: depositOfAccountThree ) .! !

!PortfolioTest methodsFor: 'tests' stamp: 'pb 11/26/2021 03:54:55'!
test06PortfolioWithPortfolioHasRegisteredATransaction

	self assert: (portfolioWithPorfolio oneOfTheAccountsHasRegistered: depositOfAccountThree ) .
	! !


!PortfolioTest methodsFor: 'setUp' stamp: 'pb 11/26/2021 03:50:15'!
setUp
	
	portfolioWithNoAccounts := Portfolio new.
	
	receptiveAccountOne:= ReceptiveAccount new.
	depositOfAccountOne:=RegularDeposit register: 10*peso on: receptiveAccountOne .
	portfolioWithOneAccount:= Portfolio new addToPortfolio: receptiveAccountOne.
	
	receptiveAccountTwo := ReceptiveAccount new.
	receptiveAccountThree := ReceptiveAccount new.
	
	depositOfAccountTwo:=RegularDeposit register: 30*peso on: receptiveAccountTwo.
	depositOfAccountThree:=RegularDeposit register: 5*peso on: receptiveAccountThree .
	
	portfolioWithMultipleAccounts := Portfolio new.
	portfolioWithMultipleAccounts addToPortfolio: receptiveAccountOne .
	portfolioWithMultipleAccounts addToPortfolio: receptiveAccountTwo .
	portfolioWithMultipleAccounts addToPortfolio: receptiveAccountThree.
	
	portfolioWithPorfolio := Portfolio new addToPortfolio: portfolioWithMultipleAccounts .
	
	
	! !


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
	instanceVariableNames: 'originReceptiveAccount destinationReceptiveAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferenceTest methodsFor: 'tests' stamp: 'pb 11/25/2021 02:17:42'!
test01ATrasferedAmountFromOneAccountToAnotherWasMadeCorrectly
	
	self assertThatOriginAndDestinationAccountsHaveTheExpectedBalanceAfterATransferenceFor: 10*peso.! !

!TransferenceTest methodsFor: 'tests' stamp: 'pb 11/25/2021 02:17:18'!
test02TheTransferenceWasMadeWithTheExpectedAmount

	| transference |
	transference := self assertThatOriginAndDestinationAccountsHaveTheExpectedBalanceAfterATransferenceFor: 1000*peso.
	self assert:  1000*peso equals: transference value.! !

!TransferenceTest methodsFor: 'tests' stamp: 'pb 11/26/2021 01:55:35'!
test03TheWithdrawOfATransferenceKnowsItsCounterpart
	
	self assertThatAskingforTheCounterpartOfTheAsocciatedTransactionFromTransference: #associatedWithdraw  resultsIn: #associatedDeposit .! !

!TransferenceTest methodsFor: 'tests' stamp: 'pb 11/26/2021 01:55:10'!
test04TheDepositOfATransferenceKnowsItsCounterpart

	self assertThatAskingforTheCounterpartOfTheAsocciatedTransactionFromTransference: #associatedDeposit  resultsIn:  #associatedWithdraw .
	! !

!TransferenceTest methodsFor: 'tests' stamp: 'pb 11/25/2021 01:57:13'!
test05TranferenceIsInvalidIfOriginAccountAndDestinationAccountAreTheSame
	
	self should: [Transference from: originReceptiveAccount to: originReceptiveAccount for: 1000*peso.] raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: Transference invalidTransferenceErrorDescription].! !

!TransferenceTest methodsFor: 'tests' stamp: 'pb 11/25/2021 01:56:49'!
test06TransferenceOfANegativeAmountIsInvalid
	
	self should: [Transference from: originReceptiveAccount to: destinationReceptiveAccount for: -1000*peso.] raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: Transference invalidTransferenceErrorDescription].! !

!TransferenceTest methodsFor: 'tests' stamp: 'pb 11/25/2021 01:57:01'!
test07TransferenceOfAZeroAmountIsInvalid
	
	self should: [Transference from: originReceptiveAccount to: destinationReceptiveAccount for: 0*peso.] raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: Transference invalidTransferenceErrorDescription].! !


!TransferenceTest methodsFor: 'setUp' stamp: 'pb 11/25/2021 01:53:36'!
setUp

	originReceptiveAccount := ReceptiveAccount new.
	destinationReceptiveAccount := ReceptiveAccount new.! !


!TransferenceTest methodsFor: 'assertions' stamp: 'pb 11/26/2021 02:02:03'!
assertThatAskingforTheCounterpartOfTheAsocciatedTransactionFromTransference: associatedTransaction resultsIn: expectedAsscoiatedCounterpart

	| transference |
	
	transference := Transference from: originReceptiveAccount to: destinationReceptiveAccount for: 1000*peso.
	
	self assert: (expectedAsscoiatedCounterpart asMessage sendTo: transference)  equals: (associatedTransaction asMessage sendTo: transference) counterpart .
	! !

!TransferenceTest methodsFor: 'assertions' stamp: 'pb 11/25/2021 02:18:15'!
assertThatOriginAndDestinationAccountsHaveTheExpectedBalanceAfterATransferenceFor: anAmount 
	
	| expectedOriginAccountBalance expectedDestinationAccountBalance transference |

	expectedOriginAccountBalance := anAmount negated.
	expectedDestinationAccountBalance := anAmount .
	
	transference :=Transference from: originReceptiveAccount to: destinationReceptiveAccount for: anAmount .
	
	self assert: expectedOriginAccountBalance equals: originReceptiveAccount balance.
	self assert: expectedDestinationAccountBalance equals: destinationReceptiveAccount balance .
	
	^transference! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'MV 11/24/2021 17:01:36'!
value 

	^ value.! !


!AccountTransaction methodsFor: 'information' stamp: 'pb 11/25/2021 01:31:30'!
handleHowDoesThisTransactionAffectBalance

	self subclassResponsibility.! !

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


!classDefinition: #DepositFromTransference category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #DepositFromTransference
	instanceVariableNames: 'associatedTransference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositFromTransference methodsFor: 'initialize' stamp: 'MV 11/24/2021 16:28:26'!
initializeFor: aValue associatedTo: aTransference

	value := aValue .
	associatedTransference := aTransference .


	
	
! !



!DepositFromTransference methodsFor: 'information' stamp: 'pb 11/25/2021 01:06:02'!
counterpart
		
	^ associatedTransference associatedWithdraw.! !

!DepositFromTransference methodsFor: 'information' stamp: 'pb 11/25/2021 01:31:30'!
handleHowDoesThisTransactionAffectBalance

	^ self value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositFromTransference class' category: 'ServiciosFinancieros-Ejercicio'!
DepositFromTransference class
	instanceVariableNames: ''!

!DepositFromTransference class methodsFor: 'instance creation' stamp: 'pb 11/25/2021 01:24:37'!
for: aValue associatedTo: aTransference

	^ DepositFromTransference new initializeFor: aValue associatedTo: aTransference .! !


!classDefinition: #RegularDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #RegularDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!RegularDeposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!RegularDeposit methodsFor: 'value' stamp: 'pb 11/25/2021 01:31:30'!
handleHowDoesThisTransactionAffectBalance

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


!RegularWithdraw methodsFor: 'value' stamp: 'pb 11/25/2021 01:31:30'!
handleHowDoesThisTransactionAffectBalance

	^ value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RegularWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
RegularWithdraw class
	instanceVariableNames: ''!

!RegularWithdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #WithdrawFromTransference category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #WithdrawFromTransference
	instanceVariableNames: 'associatedTransference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawFromTransference methodsFor: 'initialize' stamp: 'MV 11/24/2021 16:28:14'!
initializeFor: aValue associatedTo: aTransference

	value := aValue .
	associatedTransference := aTransference .


	
	! !



!WithdrawFromTransference methodsFor: 'information' stamp: 'MV 11/24/2021 16:41:35'!
counterpart
	
	^ associatedTransference associatedDeposit. ! !

!WithdrawFromTransference methodsFor: 'information' stamp: 'pb 11/25/2021 01:31:30'!
handleHowDoesThisTransactionAffectBalance

	^ value negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawFromTransference class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawFromTransference class
	instanceVariableNames: ''!

!WithdrawFromTransference class methodsFor: 'instance creation' stamp: 'pb 11/25/2021 01:25:06'!
for: aValue associatedTo: aTransference

	^ WithdrawFromTransference new initializeFor: aValue associatedTo: aTransference .
	! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'contentsInPorfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'pb 11/26/2021 02:30:24'!
addToPortfolio: aGroupOfReceptiveAccounts 
	
	contentsInPorfolio add: aGroupOfReceptiveAccounts ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'pb 11/26/2021 02:31:48'!
balance

	(contentsInPorfolio isEmpty ) ifTrue: [ ^0*peso].
	^contentsInPorfolio sum: [:eachContent | eachContent balance].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'pb 11/26/2021 03:52:09'!
hasRegistered: aRegularDeposit 
	
	^self oneOfTheAccountsHasRegistered: aRegularDeposit ! !


!Portfolio methodsFor: 'initialization' stamp: 'pb 11/26/2021 02:30:24'!
initialize
	
	contentsInPorfolio := OrderedCollection new.
	
	! !

!Portfolio methodsFor: 'initialization' stamp: 'pb 11/26/2021 03:24:35'!
oneOfTheAccountsHasRegistered: aTransaction

	| result |
	contentsInPorfolio ifEmpty:[self error: self class noAccountsNoTransactionErrorDescription ].
	result := contentsInPorfolio anySatisfy: [:eachContent | eachContent hasRegistered: aTransaction ].
	^result.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'pb 11/26/2021 02:56:38'!
noAccountsNoTransactionErrorDescription
	^'Todo mal'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'pb 11/26/2021 02:37:48'!
balance

	^transactions sum: [ :aTransaction | aTransaction handleHowDoesThisTransactionAffectBalance ] ifEmpty: [ 0 ]
	
	
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

!Transference class methodsFor: 'instance creation' stamp: 'pb 11/25/2021 01:46:46'!
from: anOriginReceptiveAccount to: aDestinationReceptiveAccount for: amountToTransfer

	| transference depositFromTransference withdrawFromTransference |
	
	((anOriginReceptiveAccount = aDestinationReceptiveAccount) | (amountToTransfer<=0) ) ifTrue: [self error: self invalidTransferenceErrorDescription].
	
	transference := self new .
	
	withdrawFromTransference := WithdrawFromTransference register: amountToTransfer on: anOriginReceptiveAccount thatComesFromTransference: transference.
	depositFromTransference := DepositFromTransference register: amountToTransfer on: aDestinationReceptiveAccount thatComesFromTransference: transference.
	
	transference initializeWithValue: amountToTransfer thatComesFromWithdraw: withdrawFromTransference toDeposit: depositFromTransference .
	
	^ transference.! !


!Transference class methodsFor: 'as yet unclassified' stamp: 'pb 11/25/2021 01:20:13'!
invalidTransferenceErrorDescription
	^'Tranferencia invalida'! !
