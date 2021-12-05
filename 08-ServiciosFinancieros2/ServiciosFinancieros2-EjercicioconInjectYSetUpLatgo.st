!classDefinition: #PortfolioTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'portfolioWithNoAccounts receptiveAccountOne portfolioWithOneAccount receptiveAccountTwo receptiveAccountThree portfolioWithMultipleAccounts portfolioWithPorfolio depositOfAccountOne depositOfAccountTwo depositOfAccountThree transactionsOfMultipleAccounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'pb 11/26/2021 02:05:10'!
test01IfPorfolioHasNoAccountsBalanceIsZero
	
	self assert: 0*peso equals: portfolioWithNoAccounts balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'pb 11/26/2021 02:07:39'!
test02IfPortfolioHasOneAccountTheBalanceOfThePortfolioIsTheSameAsTheBalanceOfTheAccount
	
	self assert: 10*peso equals: portfolioWithOneAccount balance .! !

!PortfolioTest methodsFor: 'tests' stamp: 'pb 11/26/2021 02:11:26'!
test03IfPortfolioHasMultipleAccountsBalanceIsTheSumOfAllTheAcountsBalances

	self assert: 45*peso equals: portfolioWithMultipleAccounts balance .! !

!PortfolioTest methodsFor: 'tests' stamp: 'MV 11/28/2021 23:21:04'!
test04PortfolioWithNoAccountsDoesNotRegisterATransaction

	self deny: (portfolioWithNoAccounts hasRegistered: depositOfAccountOne ).! !

!PortfolioTest methodsFor: 'tests' stamp: 'MV 11/29/2021 03:47:01'!
test05PorfoliosWithAtLeastOneAccountHaveRegisteredTheirTransactions

	self assertThatPortfolio: portfolioWithOneAccount hasRegisteredAllOfTheTransactionsIndividually: receptiveAccountOne transactions .
 	self assertThatPortfolio: portfolioWithMultipleAccounts hasRegisteredAllOfTheTransactionsIndividually: transactionsOfMultipleAccounts . 

! !

!PortfolioTest methodsFor: 'tests' stamp: 'MV 11/29/2021 03:47:01'!
test06PortfolioWithPortfolioHasRegisteredItsTransactions

	self assertThatPortfolio: portfolioWithPorfolio  hasRegisteredAllOfTheTransactionsIndividually: transactionsOfMultipleAccounts .
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'pb 11/28/2021 02:57:13'!
test07PortfolioWithOneAccountKnowsAllTheAccountTransactions
	
	self assert: receptiveAccountOne transactions equals: portfolioWithOneAccount transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'MV 11/29/2021 03:47:55'!
test08PortfolioWithMultipleAccountsKnowsAllTheAccountsTransactions
	
	self assert: transactionsOfMultipleAccounts equals: portfolioWithMultipleAccounts transactions .! !

!PortfolioTest methodsFor: 'tests' stamp: 'MV 11/29/2021 03:48:34'!
test09PortfolioWithPortfolioWithOneAccountKnowsAllTheAccountsTransactions

	self assert: transactionsOfMultipleAccounts equals: portfolioWithPorfolio transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'MV 11/29/2021 02:33:39'!
test10PortfolioCanNotAddTheSameAccountTwice

	self 
		should: [ portfolioWithOneAccount addToPortfolio: receptiveAccountOne ] 
		raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio unableToAddToPortfolioErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'MV 11/29/2021 02:33:39'!
test11PortfolioCanNotAddAnAccountThatIsAlreadyContainedInAPortfolioInsideOfIt

	self 
		should: [ portfolioWithPorfolio addToPortfolio: receptiveAccountOne ] 
		raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio unableToAddToPortfolioErrorDescription ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'MV 11/29/2021 02:33:39'!
test12PortfolioCanNotBeAddedToItself

	self 
		should: [ portfolioWithNoAccounts addToPortfolio: portfolioWithNoAccounts ] 
		raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio unableToAddToPortfolioErrorDescription ]! !


!PortfolioTest methodsFor: 'setUp' stamp: 'MV 11/29/2021 03:47:01'!
setUp

	receptiveAccountOne:= ReceptiveAccount new.
	receptiveAccountTwo := ReceptiveAccount new.
	receptiveAccountThree := ReceptiveAccount new.
	
	depositOfAccountOne := RegularDeposit register: 10*peso on: receptiveAccountOne .
	depositOfAccountTwo := RegularDeposit register: 30*peso on: receptiveAccountTwo.
	depositOfAccountThree := RegularDeposit register: 5*peso on: receptiveAccountThree .
	
	transactionsOfMultipleAccounts := OrderedCollection with: depositOfAccountOne  with: depositOfAccountTwo with: depositOfAccountThree .
	
	portfolioWithNoAccounts := Portfolio new.
	
	portfolioWithOneAccount:= Portfolio new addToPortfolio: receptiveAccountOne.

	portfolioWithMultipleAccounts := Portfolio new addToPortfolio: receptiveAccountOne ; addToPortfolio: receptiveAccountTwo ; addToPortfolio: receptiveAccountThree.

	portfolioWithPorfolio := Portfolio new addToPortfolio: portfolioWithMultipleAccounts .
	
	
	! !


!PortfolioTest methodsFor: 'test - helper' stamp: 'MV 11/29/2021 03:38:53'!
assertThatPortfolio: aPortfolio hasRegisteredAllOfTheTransactionsIndividually: aCollectionOfTransactions

	aCollectionOfTransactions do: [:eachTransaction | self assert: (aPortfolio hasRegistered: eachTransaction) ].! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'receptiveAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/29/2021 03:08:59'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	self assert: 0 equals: receptiveAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/29/2021 03:09:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	RegularDeposit register: 100 * peso on: receptiveAccount .
		
	self assert: 100 * peso equals: receptiveAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/29/2021 03:09:45'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	RegularDeposit register: 100 * peso on: receptiveAccount .
	RegularWithdraw register: 50 * peso on: receptiveAccount .
		
	self assert: 50 * peso equals: receptiveAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/29/2021 03:10:03'!
test04WithdrawValueMustBePositive 

	| withdrawValue |

	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (RegularWithdraw register: withdrawValue on: receptiveAccount ) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/29/2021 03:10:32'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	deposit := RegularDeposit register: 100 * peso on: receptiveAccount .
	withdraw := RegularWithdraw register: 50 * peso on: receptiveAccount .
		
	self assert: (receptiveAccount hasRegistered: deposit).
	self assert: (receptiveAccount hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/29/2021 03:10:57'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	
	deposit :=  RegularDeposit for: 100 * peso.
	withdraw := RegularWithdraw for: 50 * peso.
		
	self deny: (receptiveAccount hasRegistered: deposit).
	self deny: (receptiveAccount hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'MV 11/29/2021 03:11:20'!
test07AccountKnowsItsTransactions 

	| deposit |
	
	deposit := RegularDeposit register: 50 * peso on: receptiveAccount.
		
	self assert: 1 equals: receptiveAccount transactions size.
	self assert: (receptiveAccount transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'setUp' stamp: 'MV 11/29/2021 03:08:47'!
setUp

	receptiveAccount := ReceptiveAccount new.! !


!classDefinition: #ReportTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #ReportTest
	instanceVariableNames: 'receptiveAccountOne accountSummaryOne expectedSummaryOne receptiveAccountTwo accountSummaryTwo expectedSummaryTwo accountSummaryThree expectedSummaryThree receptiveAccountThree originAccountSummaryFour expectedSummaryOriginFour destinationAccountSummaryFour expectedSummaryDestinationFour originReceptiveAccountFour destinationReceptiveAccountFour originAccountSummary accountTransferNetOne expectedTransferNetOne receptiveAccountFive expectedTransferNetTwo accountTransferNetTwo originAccountOne destinationAccountOne expectedTransferNetThree accountTransferNetThree originAccountTwo destinationAccountTwo expectedTransferNetFour originAccountTransferNetFour originAccountThree destinationAccountThree expectedTransferNetFive originAccountTransferNetFive originAccountFour destinationAccountFour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!ReportTest methodsFor: 'test' stamp: 'pb 12/4/2021 21:46:10'!
setUp

	receptiveAccountOne := ReceptiveAccount new.
	accountSummaryOne:= Summary of: receptiveAccountOne.
	expectedSummaryOne := OrderedCollection with: 'Balance = 0 * pesos'.
	
	receptiveAccountTwo := ReceptiveAccount new.
	"RegularDeposit register: 10*peso on: receptiveAccountTwo ."
	accountSummaryTwo:= Summary of: receptiveAccountTwo.
	expectedSummaryTwo:= OrderedCollection with: 'Deposito por 10 * pesos' with: 'Balance = 10 * pesos'.
	
	receptiveAccountThree := ReceptiveAccount new.
	"RegularDeposit register: 10*peso on: receptiveAccountThree .
	RegularWithdraw register: 20*peso on: receptiveAccountThree ."
	accountSummaryThree:= Summary of: receptiveAccountThree.
	expectedSummaryThree:= OrderedCollection with: 'Deposito por 10 * pesos' with: 'Extracci�n por 20 * pesos' with: 'Balance = -10 * pesos'.
	
	originReceptiveAccountFour := ReceptiveAccount new.
	destinationReceptiveAccountFour := ReceptiveAccount new.
	"Transference from: originReceptiveAccountFour to: destinationReceptiveAccountFour for: 30*peso. 
	Transference from: destinationReceptiveAccountFour to: originReceptiveAccountFour for: 5*peso. "
	originAccountSummaryFour:= Summary of: originReceptiveAccountFour .
	destinationAccountSummaryFour:= Summary of: destinationReceptiveAccountFour .
	expectedSummaryOriginFour := OrderedCollection with: 'Salida por transferencia de 30 * pesos' with: 'Entrada por transferencia de 5 * pesos' with: 'Balance = -25 * pesos'.
	expectedSummaryDestinationFour := OrderedCollection with: 'Entrada por transferencia de 30 * pesos' with: 'Salida por transferencia de 5 * pesos' with: 'Balance = 25 * pesos'.
	
	receptiveAccountFive := ReceptiveAccount new.
	accountTransferNetOne := TransferNet of: receptiveAccountFive.
	"RegularDeposit register: 10*peso on: receptiveAccountFive .
	RegularWithdraw register: 40*peso on: receptiveAccountFive ."
	expectedTransferNetOne := 0*peso.
	
	originAccountOne := ReceptiveAccount new.
	destinationAccountOne := ReceptiveAccount new.
	"Transference from: originAccountOne to: destinationAccountOne for: 10*peso."
	accountTransferNetTwo := TransferNet of: originAccountOne.
	expectedTransferNetTwo := -10*peso.
	
	originAccountTwo := ReceptiveAccount new.
	destinationAccountTwo := ReceptiveAccount new.
	"Transference from: originAccountTwo to: destinationAccountTwo for: 10*peso."
	accountTransferNetThree := TransferNet of: destinationAccountTwo .
	expectedTransferNetThree := 10*peso.
	
	originAccountThree := ReceptiveAccount new.
	destinationAccountThree := ReceptiveAccount new.
	"Transference from: originAccountThree to: destinationAccountThree for: 10*peso.
	Transference from: destinationAccountThree to: originAccountThree  for: 20*peso. "
	originAccountTransferNetFour := TransferNet of: originAccountThree .
	expectedTransferNetFour := 10*peso.
	
	originAccountFour := ReceptiveAccount new.
	destinationAccountFour := ReceptiveAccount new.
	"RegularDeposit register: 10*peso on: originAccountFour .
	RegularWithdraw register: 20*peso on: originAccountFour .
	Transference from: originAccountFour to: destinationAccountFour for: 10*peso.
	Transference from: destinationAccountFour to: originAccountFour  for: 20*peso. "
	originAccountTransferNetFive := TransferNet of: originAccountFour .
	expectedTransferNetFive := 10*peso.! !

!ReportTest methodsFor: 'test' stamp: 'pb 12/4/2021 21:25:05'!
test01AccountSummaryOfAReceptiveAccountWithoutTransactionsResultsInEmptySummary
	
	self assert: accountSummaryOne giveSummary equals: expectedSummaryOne .! !

!ReportTest methodsFor: 'test' stamp: 'pb 12/4/2021 21:42:40'!
test02AccountSummaryOfAReceptiveAccountWithOneTransactionGivesSummaryCorrectly
	
	RegularDeposit register: 10*peso on: receptiveAccountTwo .
	
	self assert: (accountSummaryTwo giveSummary) equals: expectedSummaryTwo .! !

!ReportTest methodsFor: 'test' stamp: 'pb 12/4/2021 21:42:35'!
test03AccountSummaryOfAReceptiveAccountWithMultipleRegularTransactionsGivesSummaryCorrectly
	
	RegularDeposit register: 10*peso on: receptiveAccountThree .
	RegularWithdraw register: 20*peso on: receptiveAccountThree .
	
	self assert: (accountSummaryThree giveSummary) equals: expectedSummaryThree .! !

!ReportTest methodsFor: 'test' stamp: 'pb 12/4/2021 21:43:20'!
test04AccountSummaryOfAReceptiveAccountWithMultipleTransferenceTransactionsGivesSummaryCorrectly

	Transference from: originReceptiveAccountFour to: destinationReceptiveAccountFour for: 30*peso. 
	Transference from: destinationReceptiveAccountFour to: originReceptiveAccountFour for: 5*peso.
	
	self assert: originAccountSummaryFour giveSummary equals: expectedSummaryOriginFour .	
	self assert: destinationAccountSummaryFour giveSummary equals: expectedSummaryDestinationFour .	! !

!ReportTest methodsFor: 'test' stamp: 'pb 12/4/2021 21:43:59'!
test05TrasferNetOfAnAccountWithoutTransferencesHasValueZero

	RegularDeposit register: 10*peso on: receptiveAccountFive .
	RegularWithdraw register: 40*peso on: receptiveAccountFive .
	
	self assert: accountTransferNetOne giveNet equals: expectedTransferNetOne .
	! !

!ReportTest methodsFor: 'test' stamp: 'pb 12/4/2021 21:45:03'!
test06TrasferNetOfAnAccountWithWithdrawFromTransferenceHasCorrectValue
	
	Transference from: originAccountOne to: destinationAccountOne for: 10*peso.
	
	self assert: expectedTransferNetTwo  equals: accountTransferNetTwo giveNet.
	! !

!ReportTest methodsFor: 'test' stamp: 'pb 12/4/2021 21:45:26'!
test07TrasferNetOfAnAccountWithDepositFromTransferenceHasCorrectValue
	
	Transference from: originAccountTwo to: destinationAccountTwo for: 10*peso.
	
	self assert: expectedTransferNetThree  equals: accountTransferNetThree giveNet.
	! !

!ReportTest methodsFor: 'test' stamp: 'pb 12/4/2021 21:45:53'!
test08TrasferNetOfAnAccountWithBothDepositAndWithdrawFromTransferenceHasCorrectValue
	
	Transference from: originAccountThree to: destinationAccountThree for: 10*peso.
	Transference from: destinationAccountThree to: originAccountThree  for: 20*peso. 
	
	self assert: expectedTransferNetFour  equals: originAccountTransferNetFour giveNet.
	! !

!ReportTest methodsFor: 'test' stamp: 'pb 12/4/2021 21:46:17'!
test09TrasferNetOfAnAccountWithBothDepositAndWithdrawFromTransferenceAndMultipleRegularTransactionsHasCorrectValue
	
	RegularDeposit register: 10*peso on: originAccountFour .
	RegularWithdraw register: 20*peso on: originAccountFour .
	Transference from: originAccountFour to: destinationAccountFour for: 10*peso.
	Transference from: destinationAccountFour to: originAccountFour  for: 20*peso. 
	
	self assert: expectedTransferNetFive  equals: originAccountTransferNetFive giveNet.
	! !


!classDefinition: #TransferenceTest category: 'ServiciosFinancieros2-Ejercicio'!
TestCase subclass: #TransferenceTest
	instanceVariableNames: 'originReceptiveAccount destinationReceptiveAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

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

!TransferenceTest methodsFor: 'tests' stamp: 'MV 11/29/2021 00:04:24'!
test07TransferenceOfAZeroAmountIsInvalid
	
	self 
		should: [Transference from: originReceptiveAccount to: destinationReceptiveAccount for: 0*peso.] 
		raise: Error withExceptionDo: [:anError | self assert: anError messageText equals: Transference invalidTransferenceErrorDescription].! !


!TransferenceTest methodsFor: 'setUp' stamp: 'pb 11/25/2021 01:53:36'!
setUp

	originReceptiveAccount := ReceptiveAccount new.
	destinationReceptiveAccount := ReceptiveAccount new.! !


!TransferenceTest methodsFor: 'test - helper' stamp: 'MV 11/29/2021 02:58:48'!
assertThatAskingforTheCounterpartOfTheAsocciatedTransactionFromTransference: associatedTransaction resultsIn: expectedAssociatedCounterpart

	| transference |
	
	transference := Transference from: originReceptiveAccount to: destinationReceptiveAccount for: 1000*peso.
	
	self assert: (expectedAssociatedCounterpart asMessage sendTo: transference)  equals: (associatedTransaction asMessage sendTo: transference) counterpart .
	! !

!TransferenceTest methodsFor: 'test - helper' stamp: 'pb 11/25/2021 02:18:15'!
assertThatOriginAndDestinationAccountsHaveTheExpectedBalanceAfterATransferenceFor: anAmount 
	
	| expectedOriginAccountBalance expectedDestinationAccountBalance transference |

	expectedOriginAccountBalance := anAmount negated.
	expectedDestinationAccountBalance := anAmount .
	
	transference :=Transference from: originReceptiveAccount to: destinationReceptiveAccount for: anAmount .
	
	self assert: expectedOriginAccountBalance equals: originReceptiveAccount balance.
	self assert: expectedDestinationAccountBalance equals: destinationReceptiveAccount balance .
	
	^transference! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros2-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!AccountTransaction methodsFor: 'accessing' stamp: 'MV 11/24/2021 17:01:36'!
value 

	^ value.! !


!AccountTransaction methodsFor: 'handler' stamp: 'pb 12/4/2021 18:22:48'!
acceptReport: anAccountSummary

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'handler' stamp: 'pb 12/4/2021 18:40:04'!
affectBalance: aBalanceSubTotal

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros2-Ejercicio'!
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


!classDefinition: #RegularDeposit category: 'ServiciosFinancieros2-Ejercicio'!
AccountTransaction subclass: #RegularDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!RegularDeposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!RegularDeposit methodsFor: 'handler' stamp: 'pb 12/4/2021 18:29:12'!
acceptReport: aReport
	
	^aReport visitRegularDeposit: self.! !

!RegularDeposit methodsFor: 'handler' stamp: 'pb 12/4/2021 18:39:50'!
affectBalance: aBalanceSubTotal

	^aBalanceSubTotal + self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RegularDeposit class' category: 'ServiciosFinancieros2-Ejercicio'!
RegularDeposit class
	instanceVariableNames: ''!

!RegularDeposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #RegularWithdraw category: 'ServiciosFinancieros2-Ejercicio'!
AccountTransaction subclass: #RegularWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!RegularWithdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!RegularWithdraw methodsFor: 'handler' stamp: 'pb 12/4/2021 18:29:03'!
acceptReport: aReport
	
	^aReport visitRegularWithdraw: self .! !

!RegularWithdraw methodsFor: 'handler' stamp: 'pb 12/4/2021 18:39:39'!
affectBalance: aBalanceSubTotal

	^aBalanceSubTotal - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RegularWithdraw class' category: 'ServiciosFinancieros2-Ejercicio'!
RegularWithdraw class
	instanceVariableNames: ''!

!RegularWithdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransactionFromTransference category: 'ServiciosFinancieros2-Ejercicio'!
AccountTransaction subclass: #TransactionFromTransference
	instanceVariableNames: 'associatedTransference'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!TransactionFromTransference methodsFor: 'informating' stamp: 'pb 12/2/2021 16:35:30'!
counterpart

	self subclassResponsibility .! !


!TransactionFromTransference methodsFor: 'initialize' stamp: 'pb 12/2/2021 16:31:59'!
initializeFor: aValue associatedTo: aTransference

	value := aValue .
	associatedTransference := aTransference .! !


!TransactionFromTransference methodsFor: 'handler' stamp: 'pb 12/4/2021 18:28:28'!
acceptReport: aReport

	self subclassResponsibility .! !

!TransactionFromTransference methodsFor: 'handler' stamp: 'pb 12/4/2021 18:39:27'!
affectBalance: aBalanceSubTotal

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransactionFromTransference class' category: 'ServiciosFinancieros2-Ejercicio'!
TransactionFromTransference class
	instanceVariableNames: ''!

!TransactionFromTransference class methodsFor: 'as yet unclassified' stamp: 'pb 12/2/2021 16:32:46'!
for: aValue associatedTo: aTransference

	^ self new initializeFor: aValue associatedTo: aTransference .
	! !


!classDefinition: #DepositFromTransference category: 'ServiciosFinancieros2-Ejercicio'!
TransactionFromTransference subclass: #DepositFromTransference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!DepositFromTransference methodsFor: 'informating' stamp: 'pb 11/25/2021 01:06:02'!
counterpart
		
	^ associatedTransference associatedWithdraw.! !


!DepositFromTransference methodsFor: 'handler' stamp: 'pb 12/4/2021 18:28:56'!
acceptReport: aReport
	
	^aReport visitDepositFromTransference: self .! !

!DepositFromTransference methodsFor: 'handler' stamp: 'pb 12/4/2021 18:38:56'!
affectBalance: aBalanceSubTotal

	^ aBalanceSubTotal + self value .! !


!classDefinition: #WithdrawFromTransference category: 'ServiciosFinancieros2-Ejercicio'!
TransactionFromTransference subclass: #WithdrawFromTransference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!WithdrawFromTransference methodsFor: 'informating' stamp: 'MV 11/24/2021 16:41:35'!
counterpart
	
	^ associatedTransference associatedDeposit. ! !


!WithdrawFromTransference methodsFor: 'handler' stamp: 'pb 12/4/2021 18:28:48'!
acceptReport: aReport
	
	^aReport visitWithdrawFromTransference: self . ! !

!WithdrawFromTransference methodsFor: 'handler' stamp: 'pb 12/4/2021 18:38:32'!
affectBalance: aBalanceSubTotal

	^aBalanceSubTotal - self value.! !


!classDefinition: #FinancialContract category: 'ServiciosFinancieros2-Ejercicio'!
Object subclass: #FinancialContract
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!FinancialContract methodsFor: 'main protocol' stamp: 'MV 11/29/2021 02:10:21'!
balance

	self subclassResponsibility.! !

!FinancialContract methodsFor: 'main protocol' stamp: 'MV 11/29/2021 02:10:39'!
hasRegistered: aTransaction

	self subclassResponsibility.! !

!FinancialContract methodsFor: 'main protocol' stamp: 'MV 11/29/2021 02:11:41'!
transactions

	self subclassResponsibility.! !


!FinancialContract methodsFor: 'private protocol' stamp: 'MV 11/29/2021 02:11:51'!
includes: aFinancialContract

	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros2-Ejercicio'!
FinancialContract subclass: #Portfolio
	instanceVariableNames: 'financialContractsContainer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'MV 11/29/2021 02:57:19'!
initialize
	
	financialContractsContainer := OrderedCollection new.
	
	! !


!Portfolio methodsFor: 'main protocol' stamp: 'MV 11/29/2021 02:57:19'!
addToPortfolio: aFinancialContract 

	self verifyThatThereIsNoPreviousInclusionOf: aFinancialContract .

	financialContractsContainer add: aFinancialContract .! !

!Portfolio methodsFor: 'main protocol' stamp: 'MV 11/29/2021 02:57:19'!
balance

	financialContractsContainer ifEmpty: [^ 0*peso ].
	^ financialContractsContainer sum: [:eachFinancialContract | eachFinancialContract balance].! !

!Portfolio methodsFor: 'main protocol' stamp: 'MV 11/29/2021 02:57:19'!
hasRegistered: aTransaction 
	
	^ financialContractsContainer anySatisfy: [:eachFinancialContract | eachFinancialContract hasRegistered: aTransaction ].
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'MV 11/29/2021 02:57:19'!
transactions
	
	| allOfTheContainedTransactions |
	
	allOfTheContainedTransactions := OrderedCollection new.
	financialContractsContainer do: [:eachFinancialContract | allOfTheContainedTransactions addAll: eachFinancialContract transactions ].
	
	^allOfTheContainedTransactions! !


!Portfolio methodsFor: 'private protocol' stamp: 'MV 11/29/2021 02:57:19'!
includes: aFinancialContract

	^ financialContractsContainer includes: aFinancialContract .! !

!Portfolio methodsFor: 'private protocol' stamp: 'MV 11/29/2021 02:57:19'!
verifyThatThereIsNoPreviousInclusionOf: aFinancialContract

	self = aFinancialContract ifTrue: [ self error: self class unableToAddToPortfolioErrorDescription ].
	
	financialContractsContainer do: [:eachFinancialContract | 
		(eachFinancialContract includes: aFinancialContract) ifTrue: [ self error: self class unableToAddToPortfolioErrorDescription ].
	 ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros2-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'errors' stamp: 'MV 11/29/2021 02:33:39'!
unableToAddToPortfolioErrorDescription

	^ 'No se puede a�adir una cuenta repetida o al portafolio en s� mismo'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros2-Ejercicio'!
FinancialContract subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'pb 12/4/2021 18:40:43'!
balance

	^transactions inject: 0*peso into: [:balanceSubTotal :aTransaction | aTransaction affectBalance: balanceSubTotal ] .
	
	
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


!ReceptiveAccount methodsFor: 'private protocol' stamp: 'MV 11/29/2021 02:36:47'!
includes: aFinancialContract
	
	"Una cuenta est� inclu�da en otra s� y solo s� son la misma cuenta. Si el contrato financiero es un Portfolio, no van a ser iguales"
	^ self = aFinancialContract .
	! !


!classDefinition: #Report category: 'ServiciosFinancieros2-Ejercicio'!
Object subclass: #Report
	instanceVariableNames: 'receptiveAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!Report methodsFor: 'initialize' stamp: 'pb 12/4/2021 18:48:39'!
initializeOf: aReceptiveAccount 
	
	self subclassResponsibility .
	! !


!Report methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:24:59'!
visitDepositFromTransference: aValue

	self subclassResponsibility .! !

!Report methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:26:46'!
visitRegularDeposit: aValue

	self subclassResponsibility .! !

!Report methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:26:22'!
visitRegularWithdraw: aValue

	self subclassResponsibility .! !

!Report methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:25:52'!
visitWithdrawFromTransference: aValue

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros2-Ejercicio'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'as yet unclassified' stamp: 'pb 12/2/2021 21:37:06'!
of: aReceptiveAccount 

	^self new initializeOf: aReceptiveAccount .! !


!classDefinition: #Summary category: 'ServiciosFinancieros2-Ejercicio'!
Report subclass: #Summary
	instanceVariableNames: 'summaryOfTransactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!Summary methodsFor: 'main-protocol' stamp: 'pb 12/4/2021 18:09:44'!
addToSummary: aString

	summaryOfTransactions add: aString.! !

!Summary methodsFor: 'main-protocol' stamp: 'pb 12/4/2021 18:49:27'!
giveSummary

	receptiveAccount transactions do: [:eachTransaction | eachTransaction acceptReport: self.].
	summaryOfTransactions add: 'Balance = ', receptiveAccount balance asString .
	
	^summaryOfTransactions .! !


!Summary methodsFor: 'initialize' stamp: 'pb 12/4/2021 18:49:33'!
initializeOf: aReceptiveAccount 
	
	receptiveAccount := aReceptiveAccount.
	summaryOfTransactions:= OrderedCollection new .
	! !


!Summary methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:30:15'!
visitDepositFromTransference: aDepositFromTransference

	self addToSummary: 'Entrada por transferencia de ', aDepositFromTransference value asString .! !

!Summary methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:30:32'!
visitRegularDeposit: aRegularDeposit

	self addToSummary: 'Deposito por ', aRegularDeposit value asString .! !

!Summary methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:30:48'!
visitRegularWithdraw: aRegularWithdraw

	self addToSummary: 'Extracci�n por ', aRegularWithdraw value asString .! !

!Summary methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:31:08'!
visitWithdrawFromTransference: aWithdrawFromTransference

	self addToSummary: 'Salida por transferencia de ', aWithdrawFromTransference value asString .! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros2-Ejercicio'!
Report subclass: #TransferNet
	instanceVariableNames: 'netSubTotal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!TransferNet methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:50:27'!
visitDepositFromTransference: aDepositFromTransference

	^netSubTotal + aDepositFromTransference value  .! !

!TransferNet methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:50:43'!
visitRegularDeposit: aRegularDeposit

	^netSubTotal + 0*peso.! !

!TransferNet methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:51:20'!
visitRegularWithdraw: aRegularWithdraw

	^netSubTotal - 0*peso.! !

!TransferNet methodsFor: 'visiting-transactions' stamp: 'pb 12/4/2021 18:51:12'!
visitWithdrawFromTransference: aWithdrawFromTransference

	^netSubTotal - aWithdrawFromTransference value .! !


!TransferNet methodsFor: 'main-protocol' stamp: 'pb 12/4/2021 19:08:32'!
giveNet
	
	^receptiveAccount transactions inject: 0*peso into: [:net :eachTransaction |netSubTotal := eachTransaction acceptReport:  self	].
	
	
	! !

!TransferNet methodsFor: 'main-protocol' stamp: 'pb 12/4/2021 18:49:02'!
initializeOf: aReceptiveAccount 
	
	receptiveAccount := aReceptiveAccount.
	netSubTotal := 0*peso.! !


!classDefinition: #Transference category: 'ServiciosFinancieros2-Ejercicio'!
Object subclass: #Transference
	instanceVariableNames: 'transferedAmount associatedWithdraw associatedDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros2-Ejercicio'!

!Transference methodsFor: 'initialization' stamp: 'MV 11/24/2021 16:00:25'!
initializeWithValue: amountToTransfer thatComesFromWithdraw: aWithdrawFromTransference toDeposit: aDepositFromTransference 

	transferedAmount := amountToTransfer .
	associatedWithdraw := aWithdrawFromTransference .
	associatedDeposit := aDepositFromTransference .
! !


!Transference methodsFor: 'accessing' stamp: 'MV 11/29/2021 03:03:42'!
associatedDeposit
	
	^ associatedDeposit.! !

!Transference methodsFor: 'accessing' stamp: 'MV 11/29/2021 03:03:47'!
associatedWithdraw
	
	^ associatedWithdraw.! !

!Transference methodsFor: 'accessing' stamp: 'MV 11/22/2021 21:49:00'!
value

	^ transferedAmount .
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transference class' category: 'ServiciosFinancieros2-Ejercicio'!
Transference class
	instanceVariableNames: 'associatedWithdraw associatedDeposit'!

!Transference class methodsFor: 'instance creation' stamp: 'MV 11/29/2021 03:01:45'!
from: anOriginReceptiveAccount to: aDestinationReceptiveAccount for: amountToTransfer

	| transference depositFromTransference withdrawFromTransference |
	
	(anOriginReceptiveAccount = aDestinationReceptiveAccount) | (amountToTransfer<=0) ifTrue: [self error: self invalidTransferenceErrorDescription].
	
	transference := self new .
	
	withdrawFromTransference := WithdrawFromTransference register: amountToTransfer on: anOriginReceptiveAccount thatComesFromTransference: transference.
	depositFromTransference := DepositFromTransference register: amountToTransfer on: aDestinationReceptiveAccount thatComesFromTransference: transference.
	
	transference initializeWithValue: amountToTransfer thatComesFromWithdraw: withdrawFromTransference toDeposit: depositFromTransference .
	
	^ transference.! !


!Transference class methodsFor: 'errors' stamp: 'pb 11/25/2021 01:20:13'!
invalidTransferenceErrorDescription
	^'Tranferencia invalida'! !