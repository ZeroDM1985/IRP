#Region FORM

Procedure OnOpen(Object, Form, Cancel, AddInfo = Undefined) Export
	ViewClient_V2.OnOpen(Object, Form, "PaymentList");
	
	//DocumentsClient.SetTextOfDescriptionAtForm(Object, Form);
EndProcedure

Procedure AfterWriteAtClient(Object, Form, WriteParameters) Export
	Return;
EndProcedure

#EndRegion

#Region _DATE

Procedure DateOnChange(Object, Form, Item, AddInfo = Undefined) Export
	ViewClient_V2.DateOnChange(Object, Form, "PaymentList");
	
	//DocumentsClient.DateOnChange(Object, Form, Thisobject, Item, Undefined, AddInfo);
EndProcedure

//Procedure DateOnChangePutServerDataToAddInfo(Object, Form, AddInfo = Undefined) Export
//	DocumentsClient.DateOnChangePutServerDataToAddInfo(Object, Form, AddInfo);
//EndProcedure

//Function DateSettings(Object, Form, AddInfo = Undefined) Export
//	If AddInfo = Undefined Then
//		Return New Structure("PutServerDataToAddInfo", True);
//	EndIf;
//	
//	Settings = New Structure("Actions, ObjectAttributes, FormAttributes, CalculateSettings, AfterActionsCalculateSettings");
//	Actions = New Structure();
//	
//	Settings.Insert("TableName", "PaymentList");
//	Settings.Actions = Actions;
//	Settings.ObjectAttributes = "Company, Account";
//	Settings.FormAttributes = "";
//	
//	CalculateSettings = New Structure();
//	CalculateSettings.Insert("CalculateTaxByNetAmount");
//	CalculateSettings.Insert("CalculateTotalAmountByNetAmount");
//	Settings.CalculateSettings = CalculateSettings;
//	
//	AfterActionsCalculateSettings = New Structure();
//	Settings.AfterActionsCalculateSettings = AfterActionsCalculateSettings;
//	Return Settings;
//EndFunction

#EndRegion

#Region COMPANY

Procedure CompanyOnChange(Object, Form, Item, AddInfo = Undefined) Export
	ViewClient_V2.CompanyOnChange(Object, Form, "PaymentList");
	
	//DocumentsClient.CompanyOnChange(Object, Form, ThisObject, Item, Undefined, AddInfo);
EndProcedure

//Procedure CompanyOnChangePutServerDataToAddInfo(Object, Form, AddInfo = Undefined) Export
//	DocumentsClient.CompanyOnChangePutServerDataToAddInfo(Object, Form, AddInfo);
//EndProcedure

//Function CompanySettings(Object, Form, AddInfo = Undefined) Export
//	If AddInfo = Undefined Then
//		Return New Structure("PutServerDataToAddInfo", True);
//	EndIf;
//	
//	Settings = New Structure("Actions, ObjectAttributes, FormAttributes, CalculateSettings");
//	Actions = New Structure();
//	Actions.Insert("ChangeAccount", "ChangeAccount");
//	Settings.Insert("TableName", "PaymentList");
//	Settings.Actions = Actions;
//	Settings.ObjectAttributes = "Company, Account";
//	Settings.FormAttributes = "";
//	
//	CalculateSettings = New Structure();
//	CalculateSettings.Insert("CalculateTaxByNetAmount");
//	CalculateSettings.Insert("CalculateTotalAmountByNetAmount");
//	Settings.CalculateSettings = CalculateSettings;
//	
//	Settings.Insert("AccountType", PredefinedValue("Enum.CashAccountTypes.Bank"));
//	Return Settings;
//EndFunction

Procedure CompanyStartChoice(Object, Form, Item, ChoiceData, StandardProcessing) Export
	OpenSettings = DocumentsClient.GetOpenSettingsStructure();

	OpenSettings.ArrayOfFilters = New Array();
	OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("DeletionMark", True,
		DataCompositionComparisonType.NotEqual));
	OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("OurCompany", True,
		DataCompositionComparisonType.Equal));
	OpenSettings.FillingData = New Structure("OurCompany", True);

	DocumentsClient.CompanyStartChoice(Object, Form, Item, ChoiceData, StandardProcessing, OpenSettings);
EndProcedure

Procedure CompanyEditTextChange(Object, Form, Item, Text, StandardProcessing) Export
	ArrayOfFilters = New Array();
	ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("DeletionMark", True, ComparisonType.NotEqual));
	ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("OurCompany", True, ComparisonType.Equal));
	DocumentsClient.CompanyEditTextChange(Object, Form, Item, Text, StandardProcessing, ArrayOfFilters);
EndProcedure

#EndRegion

#Region CURRENCY
	
Procedure CurrencyOnChange(Object, Form, Item) Export
	ViewClient_V2.CurrencyOnChange(Object, Form, "PaymentList");
	
//	Form.CurrentCurrency = Object.Currency;
//	AccountCurrency = ServiceSystemServer.GetObjectAttribute(Object.Account, "Currency");
//	If Object.Currency <> AccountCurrency And ValueIsFilled(AccountCurrency) Then
//		Object.Account = Undefined;
//		Form.CurrentAccount = Object.Account;
//	EndIf;
//
//	DocumentsClientServer.ChangeTitleGroupTitle(Object, Form);
EndProcedure

#EndRegion

#Region NET_AMOUNT

Procedure PaymentListNetAmountOnChange(Object, Form, Item = Undefined, CurrentRowData = Undefined, AddInfo = Undefined) Export
	ViewClient_V2.PaymentListNetAmountOnChange(Object, Form);
	
//	CurrentData = DocumentsClient.GetCurrentRowDataList(Form.Items.PaymentList, CurrentRowData);
//	If CurrentData = Undefined Then
//		Return;
//	EndIf;
//	DocumentsClient.ItemListCalculateRowAmounts_NetAmountChange(Object, Form, CurrentData, Item, ThisObject, AddInfo);
EndProcedure

//Procedure ItemListNetAmountPutServerDataToAddInfo(Object, Form, CurrentData, AddInfo = Undefined) Export
//	DocumentsClient.ItemListNetAmountPutServerDataToAddInfo(Object, Form, CurrentData, AddInfo);
//EndProcedure

#EndRegion

#Region TOTAL_AMOUNT

Procedure PaymentListTotalAmountOnChange(Object, Form, Item = Undefined, CurrentRowData = Undefined, AddInfo = Undefined) Export
	ViewClient_V2.PaymentListTotalAmountOnChange(Object, Form);
	
//	CurrentData = DocumentsClient.GetCurrentRowDataList(Form.Items.PaymentList, CurrentRowData);
//	If CurrentData = Undefined Then
//		Return;
//	EndIf;
//	DocumentsClient.ItemListCalculateRowAmounts_TotalAmountChange(Object, Form, CurrentData, Item, ThisObject, AddInfo);
EndProcedure

//Procedure ItemListTotalAmountPutServerDataToAddInfo(Object, Form, CurrentData, AddInfo = Undefined) Export
//	DocumentsClient.ItemListTotalAmountPutServerDataToAddInfo(Object, Form, CurrentData, AddInfo);
//EndProcedure

#EndRegion

#Region TAX_AMOUNT

Procedure ItemListTaxAmountOnChange(Object, Form, Item = Undefined, CurrentRowData = Undefined, AddInfo = Undefined) Export
	ViewClient_V2.PaymentListTaxAmountOnChange(Object, Form);
	
//	CurrentData = DocumentsClient.GetCurrentRowDataList(Form.Items.PaymentList, CurrentRowData);
//	If CurrentData = Undefined Then
//		Return;
//	EndIf;
//	DocumentsClient.ItemListCalculateRowAmounts_TaxAmountChange(Object, Form, CurrentData, Item, ThisObject, AddInfo);
EndProcedure

//Procedure ItemListTaxAmountPutServerDataToAddInfo(Object, Form, CurrentData, AddInfo = Undefined) Export
//	DocumentsClient.ItemListTaxAmountPutServerDataToAddInfo(Object, Form, CurrentData, AddInfo);
//EndProcedure

#EndRegion

#Region TAX_RATE

Procedure ItemListTaxValueOnChange(Object, Form, Item = Undefined, CurrentRowData = Undefined, AddInfo = Undefined) Export
	ViewClient_V2.PaymentListTaxRateOnChange(Object, Form);
	
//	CurrentData = DocumentsClient.GetCurrentRowDataList(Form.Items.PaymentList, CurrentRowData);
//	If CurrentData = Undefined Then
//		Return;
//	EndIf;
//	DocumentsClient.ItemListCalculateRowAmounts_TaxValueChange(Object, Form, CurrentData, Item, ThisObject, AddInfo);
EndProcedure

//Procedure ItemListTaxValuePutServerDataToAddInfo(Object, Form, CurrentData, AddInfo = Undefined) Export
//	DocumentsClient.ItemListTaxValuePutServerDataToAddInfo(Object, Form, CurrentData, AddInfo);
//EndProcedure

#EndRegion

#Region PAYMENT_LIST

Procedure PaymentListSelection(Object, Form, Item, RowSelected, Field, StandardProcessing, AddInfo = Undefined) Export
	If Upper(Field.Name) = Upper("PaymentListTaxAmount") Then
		CurrentData = Form.Items.PaymentList.CurrentData;
		If CurrentData <> Undefined Then
			DocumentsClient.ItemListSelectionPutServerDataToAddInfo(Object, Form, AddInfo);
			Parameters = New Structure();
			Parameters.Insert("CurrentData", CurrentData);
			Parameters.Insert("Item", Item);
			Parameters.Insert("Field", Field);
			TaxesClient.ChangeTaxAmount(Object, Form, Parameters, StandardProcessing, AddInfo);
		EndIf;
	EndIf;
EndProcedure

//Procedure PaymentListOnStartEdit(Object, Form, Item, NewRow, Clone) Export
//	CurrentData = Form.Items.PaymentList.CurrentData;
//	If CurrentData = Undefined Then
//		Return;
//	EndIf;
//
//	If Clone Then
//		CurrentData.Key = New UUID();
//		Settings = New Structure();
//
//		Settings.Insert("Rows", New Array());
//		Settings.Rows.Add(CurrentData);
//
//		Settings.Insert("CalculateSettings", New Structure("CalculateTax, CalculateTotalAmount"));
//		CalculateItemsRows(Object, Form, Settings);
//		Return;
//	EndIf;
//EndProcedure

Procedure PaymentListAfterDeleteRow(Object, Form, Item) Export
	ViewClient_V2.PaymentListAfterDeleteRow(Object, Form);
	
	//CalculationStringsClientServer.ClearDependentData(Object, New Structure("TableParent", "PaymentList"));
EndProcedure

//Procedure PaymentListOnChange(Object, Form, Item) Export
//	For Each Row In Object.PaymentList Do
//		If Not ValueIsFilled(Row.Key) Then
//			Row.Key = New UUID();
//		EndIf;
//	EndDo;
//EndProcedure

//Procedure PaymentListOnActivateRow(Object, Form, Item) Export
//	Return;
//EndProcedure

Procedure PaymentListBeforeAddRow(Object, Form, Item, Cancel, Clone, Parent, IsFolder, Parameter) Export
	ViewClient_V2.PaymentListBeforeAddRow(Object, Form, Cancel, Clone);
	
//	If Clone Then
//		Return;
//	EndIf;
//	Cancel = True;
//	NewRow = Object.PaymentList.Add();
//	Form.Items.PaymentList.CurrentRow = NewRow.GetID();
//	UserSettingsClientServer.FillingRowFromSettings(Object, "Object.PaymentList", NewRow, True);
//	Form.Items.PaymentList.ChangeRow();
//	PaymentListOnChange(Object, Form, Item);
//	If Not Saas.SeparationUsed() Then
//		NewRow.Partner = DocumentsServer.GetPartnerByLegalName(NewRow.Payee, NewRow.Partner);
//		PaymentListPartnerOnChange(Object, Form, Item);
//	EndIf;
EndProcedure

//Procedure OnActiveCell(Object, Form, Item, Cancel = Undefined) Export
//	Return;
//EndProcedure

#EndRegion

//Procedure CalculateItemsRows(Object, Form, Settings, Item = Undefined, AddInfo = Undefined) Export
//	ArrayOfTaxInfo = TaxesClient.GetArrayOfTaxInfoFromServerData(Object, Form, AddInfo);
//	CalculationStringsClientServer.CalculateItemsRows(Object, Form, Settings.Rows, Settings.CalculateSettings, 
//		ArrayOfTaxInfo, AddInfo);
//EndProcedure

#Region TRANSACTION_TYPE

Procedure TransactionTypeOnChange(Object, Form, Item) Export
	ViewClient_V2.TransactionTypeOnChange(Object, Form, "PaymentList");
//	CleanDataByTransactionType(Object, Form);
//	DocumentsClientServer.ChangeTitleGroupTitle(Object, Form);
EndProcedure

//Procedure CleanDataByTransactionType(Object, Form) Export
//	SetTransitAccount(Object, Form);
//
//	If Object.PaymentList.Count() = 0 Or Object.TransactionType = Form.CurrentTransactionType Then
//		Return;
//	EndIf;
//
//	AdditionalParameters = New Structure();
//	AdditionalParameters.Insert("Object", Object);
//	AdditionalParameters.Insert("Form", Form);
//
//	ShowQueryBox(New NotifyDescription("CleanDataByTransactionTypeContinue", ThisObject, AdditionalParameters),
//		R().QuestionToUser_014, QuestionDialogMode.OKCancel);
//EndProcedure

//Procedure CleanDataByTransactionTypeContinue(Result, AdditionalParameters) Export
//	Form = AdditionalParameters.Form;
//	Object = AdditionalParameters.Object;
//
//	If Result = DialogReturnCode.OK Then
//		ArrayAll = New Array();
//		ArrayByType = New Array();
//		DocBankPaymentServer.FillAttributesByType(Object.Ref, Object.TransactionType, ArrayAll, ArrayByType);
//		DocumentsClientServer.CleanDataByArray(Object, ArrayAll, ArrayByType);
//		For Each Row In Object.PaymentList Do
//			Row.PlaningTransactionBasis = Undefined;
//			Row.BasisDocument = Undefined;
//			Row.Order = Undefined;
//		EndDo;
//	Else
//		Object.TransactionType = Form.CurrentTransactionType;
//		SetTransitAccount(Object, Form);
//		Form.FormSetVisibilityAvailability();
//	EndIf;
//
//	Form.CurrentTransactionType = Object.TransactionType;
//EndProcedure

//Procedure SetTransitAccount(Object, Form) Export
//	If Object.TransactionType = PredefinedValue("Enum.OutgoingPaymentTransactionTypes.CurrencyExchange") Then
//		TransitAccount = ServiceSystemServer.GetObjectAttribute(Object.Account, "TransitAccount");
//		Object.TransitAccount = TransitAccount;
//		Form.Items.TransitAccount.ReadOnly = ValueIsFilled(Object.TransitAccount);
//	EndIf;
//EndProcedure

#EndRegion

#Region ACCOUNT

Procedure AccountOnChange(Object, Form, Item = Undefined) Export
	ViewClient_V2.AccountOnChange(Object, Form, "PaymentList");
	
//	If Form.CurrentAccount = Object.Account Then
//		Return;
//	EndIf;
//
//	Form.CurrentAccount = Object.Account;
//	SetTransitAccount(Object, Form);
//
//	AccountCurrency = ServiceSystemServer.GetObjectAttribute(Object.Account, "Currency");
//	If ValueIsFilled(AccountCurrency) Then
//		Object.Currency = AccountCurrency;
//		Form.CurrentCurrency = Object.Currency;
//	EndIf;
//
//	DocumentsClientServer.ChangeTitleGroupTitle(Object, Form);
EndProcedure

Procedure AccountStartChoice(Object, Form, Item, ChoiceData, StandardProcessing) Export
	StandardProcessing = False;
	DefaultStartChoiceParameters = New Structure("Company", Object.Company);
	StartChoiceParameters = CatCashAccountsClient.GetDefaultStartChoiceParameters(DefaultStartChoiceParameters);
	StartChoiceParameters.CustomParameters.Filters.Add(DocumentsClientServer.CreateFilterItem("Type", PredefinedValue(
		"Enum.CashAccountTypes.Bank"), , DataCompositionComparisonType.Equal));
	StartChoiceParameters.FillingData.Insert("Type", PredefinedValue("Enum.CashAccountTypes.Bank"));
	OpenForm(StartChoiceParameters.FormName, StartChoiceParameters, Item, Form.UUID, , Form.URL);
EndProcedure

Procedure AccountEditTextChange(Object, Form, Item, Text, StandardProcessing) Export
	DefaultEditTextParameters = New Structure("Company", Object.Company);
	EditTextParameters = CatCashAccountsClient.GetDefaultEditTextParameters(DefaultEditTextParameters);
	EditTextParameters.Filters.Add(DocumentsClientServer.CreateFilterItem("Type", PredefinedValue(
		"Enum.CashAccountTypes.Bank"), ComparisonType.Equal));
	Item.ChoiceParameters = CatCashAccountsClient.FixedArrayOfChoiceParameters(EditTextParameters);
EndProcedure

#EndRegion

#Region _ORDER

Procedure PaymentListOrderStartChoice(Object, Form, Item, ChoiceData, StandardProcessing) Export
	StandardProcessing = False;

	CurrentData = Form.Items.PaymentList.CurrentData;
	If CurrentData = Undefined Then
		Return;
	EndIf;

	Parameters = New Structure();
	Parameters.Insert("Filter", New Structure());
	If ValueIsFilled(CurrentData.Payee) Then
		Parameters.Filter.Insert("LegalName", CurrentData.Payee);
	EndIf;
	Parameters.Filter.Insert("Company", Object.Company);
	Parameters.Filter.Insert("Type", Type("DocumentRef.PurchaseOrder"));
	
	If ValueIsFilled(CurrentData.BasisDocument) 
		And TypeOf(CurrentData.BasisDocument) = Type("DocumentRef.PurchaseInvoice") Then
		Parameters.Filter.Insert("RefInList",
		DocumentsServer.GetArrayOfPurchaseOrdersByPurchaseInvoice(CurrentData.BasisDocument));
	EndIf;
	
	Parameters.Insert("FilterFromCurrentData", "Partner, Agreement");
	
	NotifyParameters = New Structure("Object, Form", Object, Form);
	Notify = New NotifyDescription("PaymentListOrderStartChoiceEnd", ThisObject, NotifyParameters);
	Parameters.Insert("Notify"    , Notify);
	Parameters.Insert("TableName" , "DocumentsForOutgoingPayment");	
	Parameters.Insert("Ref"       , Object.Ref);
	Parameters.Insert("IsReturnTransactionType", False);
	JorDocumentsClient.BasisDocumentStartChoice(Object, Form, Item, CurrentData, Parameters);
EndProcedure

Procedure PaymentListOrderStartChoiceEnd(Result, AdditionalParameters) Export
	If Result = Undefined Then
		Return;
	EndIf;
	
	Form = AdditionalParameters.Form;
	Object = AdditionalParameters.Object;
	CurrentData = Form.Items.PaymentList.CurrentData;
	If CurrentData <> Undefined Then
		
		ViewClient_V2.SetPaymentListOrder(Object, Form, CurrentData, Result.BasisDocument);
		//CurrentData.Order       = Result.BasisDocument;
		If Not ValueIsFilled(CurrentData.BasisDocument) Then
			ViewClient_V2.SetPaymentListTotalAmount(Object, Form, CurrentData, Result.Amount);
			
//			CurrentData.TotalAmount = Result.Amount;
//		
//			Settings = New Structure();
//			Settings.Insert("Rows", New Array());
//			Settings.Rows.Add(CurrentData);
//		
//			CalculationSettings = New Structure();
//			CalculationSettings.Insert("CalculateTaxByTotalAmount");
//			CalculationSettings.Insert("CalculateNetAmountByTotalAmount");
//	
//			Settings.Insert("CalculateSettings", CalculationSettings);
//			CalculateItemsRows(Object, Form, Settings);
		EndIf;
	EndIf;
EndProcedure

#EndRegion

#Region BASIS_DOCUMENT

Procedure PaymentListBasisDocumentOnChange(Object, Form, Item) Export
	ViewClient_V2.PaymentListBasisDocumentOnChange(Object, Form);
	
//	CurrentData = Form.Items.PaymentList.CurrentData;
//
//	If CurrentData = Undefined Then
//		Return;
//	EndIf;
//
//	If Not ValueIsFilled(CurrentData.BasisDocument) Then
//		CurrentData.BasisDocument = Undefined;
//	EndIf;
EndProcedure

Procedure PaymentListBasisDocumentStartChoice(Object, Form, Item, ChoiceData, StandardProcessing) Export
	StandardProcessing = False;

	CurrentData = Form.Items.PaymentList.CurrentData;
	If CurrentData = Undefined Then
		Return;
	EndIf;

	Parameters = New Structure();
	Parameters.Insert("Filter", New Structure());
	If ValueIsFilled(CurrentData.Payee) Then
		Parameters.Filter.Insert("LegalName", CurrentData.Payee);
	EndIf;
	Parameters.Filter.Insert("Company", Object.Company);

	Parameters.Insert("FilterFromCurrentData", "Partner, Agreement");
	
	NotifyParameters = New Structure("Object, Form", Object, Form);
	Notify = New NotifyDescription("PaymentListBasisDocumentStartChoiceEnd", ThisObject, NotifyParameters);
	Parameters.Insert("Notify", Notify);
	Parameters.Insert("TableName", "DocumentsForOutgoingPayment");
	Parameters.Insert("OpeningEntryTableName1", "AccountPayableByDocuments");
	Parameters.Insert("OpeningEntryTableName2", "AccountReceivableByDocuments");
	Parameters.Insert("CreditNoteTableName", "Transactions");
	Parameters.Insert("Ref", Object.Ref);
	Parameters.Insert("IsReturnTransactionType", 
		Object.TransactionType = PredefinedValue("Enum.OutgoingPaymentTransactionTypes.ReturnToCustomer"));
	JorDocumentsClient.BasisDocumentStartChoice(Object, Form, Item, CurrentData, Parameters);
EndProcedure

Procedure PaymentListBasisDocumentStartChoiceEnd(Result, AdditionalParameters) Export
	If Result = Undefined Then
		Return;
	EndIf;
	Form = AdditionalParameters.Form;
	Object = AdditionalParameters.Object;
	CurrentData = Form.Items.PaymentList.CurrentData;
	If CurrentData <> Undefined Then
		ViewClient_V2.SetPaymentListBasisDocument(Object, Form, CurrentData, Result.BasisDocument);
		ViewClient_V2.SetPaymentListTotalAmount(Object, Form, CurrentData, Result.Amount);
		
//		CurrentData.BasisDocument = Result.BasisDocument;
//		CurrentData.TotalAmount   = Result.Amount;
//		
//		Settings = New Structure();
//		Settings.Insert("Rows", New Array());
//		Settings.Rows.Add(CurrentData);
//		
//		CalculationSettings = New Structure();
//		CalculationSettings.Insert("CalculateTaxByTotalAmount");
//		CalculationSettings.Insert("CalculateNetAmountByTotalAmount");
//	
//		Settings.Insert("CalculateSettings", CalculationSettings);
//		CalculateItemsRows(Object, Form, Settings);
	EndIf;
EndProcedure

#EndRegion

#Region PLANNING_TRANSACTION_BASIS

Procedure PaymentListPlaningTransactionBasisOnChange(Object, Form, Item) Export
	ViewClient_V2.PaymentListPlanningTransactionBasisOnChange(Object, Form);
	
//	CurrentData = Form.Items.PaymentList.CurrentData;
//
//	If CurrentData = Undefined Then
//		Return;
//	EndIf;
//
//	If ValueIsFilled(CurrentData.PlaningTransactionBasis) 
//		And TypeOf(CurrentData.PlaningTransactionBasis) = Type("DocumentRef.CashTransferOrder") Then
//		CashTransferOrderInfo = DocCashTransferOrderServer.GetInfoForFillingBankPayment(CurrentData.PlaningTransactionBasis);
//		
//		If Not ValueIsFilled(Object.Account) Then
//			Object.Account = CashTransferOrderInfo.Account;
//			If Object.TransactionType = PredefinedValue("Enum.OutgoingPaymentTransactionTypes.CurrencyExchange") Then
//				Object.TransitAccount = ServiceSystemServer.GetCompositeObjectAttribute(Object.Account,"TransitAccount");
//			EndIf;
//		EndIf;
//
//		If Not ValueIsFilled(Object.Company) Then
//			Object.Company = CashTransferOrderInfo.Company;
//		EndIf;
//
//		If Not ValueIsFilled(Object.Currency) Then
//			Object.Currency = CashTransferOrderInfo.Currency;
//		EndIf;
//
//		ArrayOfPlaningTransactionBasises = New Array();
//		ArrayOfPlaningTransactionBasises.Add(CurrentData.PlaningTransactionBasis);
//		ArrayOfBalance = DocBankPaymentServer.GetDocumentTable_CashTransferOrder_ForClient(ArrayOfPlaningTransactionBasises, Object.Ref);
//		If ArrayOfBalance.Count() Then
//			RowOfBalance = ArrayOfBalance[0];
//			CurrentData.TotalAmount = RowOfBalance.Amount;
//			
//			Settings = New Structure();
//			Settings.Insert("Rows", New Array());
//			Settings.Rows.Add(CurrentData);
//		
//			CalculationSettings = New Structure();
//			CalculationSettings.Insert("CalculateTaxByTotalAmount");
//			CalculationSettings.Insert("CalculateNetAmountByTotalAmount");
//	
//			Settings.Insert("CalculateSettings", CalculationSettings);
//			CalculateItemsRows(Object, Form, Settings);
//		EndIf;
//	EndIf;
//
//	DocumentsClient.PaymentListPlaningTransactionBasisOnChange(Object, Form, Item);
EndProcedure

Procedure TransactionBasisStartChoice(Object, Form, Item, ChoiceData, StandardProcessing) Export
	CurrentData = Form.Items.PaymentList.CurrentData;
	If CurrentData = Undefined Then
		Return;
	EndIf;

	OpenSettings = DocumentsClient.GetOpenSettingsStructure();
	OpenSettings.FormParameters = New Structure();
	OpenSettings.FormParameters.Insert("OwnerRef", Object.Ref);

	ArrayOfSelectedDocuments = New Array();
	For Each Row In Object.PaymentList Do
		ArrayOfSelectedDocuments.Add(Row.PlaningTransactionBasis);
	EndDo;
	OpenSettings.FormParameters.Insert("ArrayOfSelectedDocuments", ArrayOfSelectedDocuments);

	OpenSettings.ArrayOfFilters = New Array();
	OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("Posted", True,
		DataCompositionComparisonType.Equal));
	
	// Account
	If ValueIsFilled(Object.Account) Then
		OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("Sender", Object.Account,
			DataCompositionComparisonType.Equal));
	EndIf;
		
	// Company
	If ValueIsFilled(Object.Company) Then
		OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("Company", Object.Company,
			DataCompositionComparisonType.Equal));
	EndIf;
		
	// Currency
	If ValueIsFilled(Object.Currency) Then
		OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("SendCurrency", Object.Currency,
			DataCompositionComparisonType.Equal));
	EndIf;

	If Object.TransactionType = PredefinedValue("Enum.OutgoingPaymentTransactionTypes.CurrencyExchange") Then
		OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("IsCurrencyExchange", True,
			DataCompositionComparisonType.Equal));

		DocumentsClient.TransactionBasisStartChoice(Object, Form, Item, ChoiceData, StandardProcessing, OpenSettings);
	ElsIf Object.TransactionType = PredefinedValue("Enum.OutgoingPaymentTransactionTypes.CashTransferOrder") Then
		OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("IsCurrencyExchange", False,
			DataCompositionComparisonType.Equal));

		DocumentsClient.TransactionBasisStartChoice(Object, Form, Item, ChoiceData, StandardProcessing, OpenSettings);
	EndIf;
EndProcedure

#EndRegion

#Region PARTNER

Procedure PaymentListPartnerOnChange(Object, Form, Item) Export
	ViewClient_V2.PaymentListPartnerOnChange(Object, Form);
	
	
//	CurrentData = Form.Items.PaymentList.CurrentData;
//
//	If CurrentData = Undefined Then
//		Return;
//	EndIf;
//
//	If Object.TransactionType = PredefinedValue("Enum.OutgoingPaymentTransactionTypes.CurrencyExchange") Then
//		Return;
//	EndIf;
//
//	If ValueIsFilled(CurrentData.Partner) Then
//		CurrentData.Payee = DocumentsServer.GetLegalNameByPartner(CurrentData.Partner, CurrentData.Payee);
//		AgreementParameters = New Structure();
//		AgreementParameters.Insert("Partner"        , CurrentData.Partner);
//		AgreementParameters.Insert("Agreement"      , CurrentData.Agreement);
//		AgreementParameters.Insert("CurrentDate"    , Object.Date);
//		AgreementParameters.Insert("ArrayOfFilters" , New Array());
//		AgreementParameters.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("DeletionMark", True,
//			ComparisonType.NotEqual));
//		NewAgreement = DocumentsServer.GetAgreementByPartner(AgreementParameters);
//		If CurrentData.Agreement <> NewAgreement Then
//			CurrentData.Agreement = NewAgreement;
//			PaymentListAgreementOnChange(Object, Form);
//		Else
//			Settings = New Structure();
//			Settings.Insert("Rows", New Array());
//			Settings.Rows.Add(CurrentData);
//			Settings.Insert("CalculateSettings", New Structure("CalculateTax, CalculateTotalAmount"));
//			CalculateItemsRows(Object, Form, Settings);
//		EndIf;
//	EndIf;
EndProcedure

Procedure PaymentListPartnerStartChoice(Object, Form, Item, ChoiceData, StandardProcessing) Export
	OpenSettings = DocumentsClient.GetOpenSettingsStructure();

	OpenSettings.ArrayOfFilters = New Array();
	OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("DeletionMark", True,
		DataCompositionComparisonType.NotEqual));
	OpenSettings.FormParameters = New Structure();
	If ValueIsFilled(Form.Items.PaymentList.CurrentData.Payee) Then
		OpenSettings.FormParameters.Insert("Company", Form.Items.PaymentList.CurrentData.Payee);
		OpenSettings.FormParameters.Insert("FilterPartnersByCompanies", True);
	EndIf;
	OpenSettings.FillingData = New Structure("Company", Form.Items.PaymentList.CurrentData.Payee);
	DocumentsClient.PartnerStartChoice(Object, Form, Item, ChoiceData, StandardProcessing, OpenSettings);
EndProcedure

Procedure PaymentListPartnerEditTextChange(Object, Form, Item, Text, StandardProcessing) Export
	ArrayOfFilters = New Array();
	ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("DeletionMark", True, ComparisonType.NotEqual));
	AdditionalParameters = New Structure();
	If ValueIsFilled(Form.Items.PaymentList.CurrentData.Payee) Then
		AdditionalParameters.Insert("Company", Form.Items.PaymentList.CurrentData.Payee);
		AdditionalParameters.Insert("FilterPartnersByCompanies", True);
	EndIf;
	DocumentsClient.PartnerEditTextChange(Object, Form, Item, Text, StandardProcessing, ArrayOfFilters,
		AdditionalParameters);
EndProcedure

#EndRegion

#Region AGREEMENT

Procedure PaymentListAgreementOnChange(Object, Form, Item = Undefined) Export
	ViewClient_V2.PaymentListAgreementOnChange(Object, Form);
	
//	CurrentData = Form.Items.PaymentList.CurrentData;
//
//	If CurrentData = Undefined Then
//		Return;
//	EndIf;
//
//	AgreementInfo = CatAgreementsServer.GetAgreementInfo(CurrentData.Agreement);
//
//	CurrentData.ApArPostingDetail = AgreementInfo.ApArPostingDetail;
//	If AgreementInfo.ApArPostingDetail <> PredefinedValue("Enum.ApArPostingDetail.ByDocuments") Then
//		CurrentData.BasisDocument = Undefined;
//	ElsIf CurrentData.BasisDocument <> Undefined 
//		And Not ServiceSystemServer.GetObjectAttribute(CurrentData.BasisDocument, "Agreement") = CurrentData.Agreement Then
//		CurrentData.BasisDocument = Undefined;
//	EndIf;
//	Settings = New Structure();
//	Settings.Insert("Rows", New Array());
//	Settings.Rows.Add(CurrentData);
//	Settings.Insert("CalculateSettings", New Structure("CalculateTax, CalculateTotalAmount"));
//	CalculateItemsRows(Object, Form, Settings);
EndProcedure

Procedure AgreementStartChoice(Object, Form, Item, ChoiceData, StandardProcessing) Export
	CurrentData = Form.Items.PaymentList.CurrentData;
	If CurrentData = Undefined Then
		Return;
	EndIf;

	OpenSettings = DocumentsClient.GetOpenSettingsStructure();
	OpenSettings.ArrayOfFilters = New Array();
	OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("DeletionMark", True,
		DataCompositionComparisonType.NotEqual));
	OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("Kind", PredefinedValue(
		"Enum.AgreementKinds.Standard"), DataCompositionComparisonType.NotEqual));
	OpenSettings.FormParameters = New Structure();
	OpenSettings.FormParameters.Insert("Partner", CurrentData.Partner);
	OpenSettings.FormParameters.Insert("IncludeFilterByPartner", True);
	OpenSettings.FormParameters.Insert("IncludePartnerSegments", True);
	OpenSettings.FormParameters.Insert("EndOfUseDate", Object.Date);
	OpenSettings.FormParameters.Insert("IncludeFilterByEndOfUseDate", True);
	OpenSettings.FillingData = New Structure();
	OpenSettings.FillingData.Insert("Partner", CurrentData.Partner);
	OpenSettings.FillingData.Insert("LegalName", CurrentData.Payee);
	OpenSettings.FillingData.Insert("Company", Object.Company);

	DocumentsClient.AgreementStartChoice(Object, Form, Item, ChoiceData, StandardProcessing, OpenSettings);
EndProcedure

Procedure AgreementTextChange(Object, Form, Item, Text, StandardProcessing) Export
	CurrentData = Form.Items.PaymentList.CurrentData;
	If CurrentData = Undefined Then
		Return;
	EndIf;

	ArrayOfFilters = New Array();
	ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("DeletionMark", True, ComparisonType.NotEqual));
	ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("Kind", PredefinedValue("Enum.AgreementKinds.Standard"),
		ComparisonType.NotEqual));

	AdditionalParameters = New Structure();
	AdditionalParameters.Insert("IncludeFilterByEndOfUseDate", True);
	AdditionalParameters.Insert("IncludeFilterByPartner", True);
	AdditionalParameters.Insert("IncludePartnerSegments", True);
	AdditionalParameters.Insert("EndOfUseDate", Object.Date);
	AdditionalParameters.Insert("Partner", CurrentData.Partner);
	DocumentsClient.AgreementEditTextChange(Object, Form, Item, Text, StandardProcessing, ArrayOfFilters,
		AdditionalParameters);
EndProcedure

#EndRegion

#Region EXPENSE_TYPE

Procedure PaymentListExpenseTypeStartChoice(Object, Form, Item, ChoiceData, StandardProcessing) Export
	DocumentsClient.ExpenseTypeStartChoice(Object, Form, Item, ChoiceData, StandardProcessing);
EndProcedure

Procedure PaymentListExpenseTypeEditTextChange(Object, Form, Item, Text, StandardProcessing) Export
	DocumentsClient.ExpenseTypeEditTextChange(Object, Form, Item, Text, StandardProcessing);
EndProcedure

#EndRegion

#Region FINANCIAL_MOVEMENT_TYPE

Procedure PaymentListFinancialMovementTypeStartChoice(Object, Form, Item, ChoiceData, StandardProcessing) Export
	DocumentsClient.FinancialMovementTypeStartChoice(Object, Form, Item, ChoiceData, StandardProcessing);
EndProcedure

Procedure PaymentListFinancialMovementTypeEditTextChange(Object, Form, Item, Text, StandardProcessing) Export
	DocumentsClient.FinancialMovementTypeEditTextChange(Object, Form, Item, Text, StandardProcessing);
EndProcedure

#EndRegion

#Region PAYEE

Procedure PaymentListPayeeOnChange(Object, Form, Item) Export
	ViewClient_V2.PaymentListLegalNameOnChange(Object, Form);
	
//	CurrentData = Form.Items.PaymentList.CurrentData;
//	If ValueIsFilled(CurrentData.Payee) Then
//		CurrentData.Partner = DocumentsServer.GetPartnerByLegalName(CurrentData.Payee, CurrentData.Partner);
//	EndIf;
EndProcedure

Procedure PaymentListPayeeStartChoice(Object, Form, Item, ChoiceData, StandardProcessing) Export
	OpenSettings = DocumentsClient.GetOpenSettingsStructure();

	OpenSettings.ArrayOfFilters = New Array();
	OpenSettings.ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("DeletionMark", True,
		DataCompositionComparisonType.NotEqual));
	OpenSettings.FormParameters = New Structure();
	If ValueIsFilled(Form.Items.PaymentList.CurrentData.Partner) Then
		OpenSettings.FormParameters.Insert("Partner", Form.Items.PaymentList.CurrentData.Partner);
		OpenSettings.FormParameters.Insert("FilterByPartnerHierarchy", True);
	EndIf;
	OpenSettings.FillingData = New Structure("Partner", Form.Items.PaymentList.CurrentData.Partner);

	DocumentsClient.CompanyStartChoice(Object, Form, Item, ChoiceData, StandardProcessing, OpenSettings);
EndProcedure

Procedure PaymentListPayeeEditTextChange(Object, Form, Item, Text, StandardProcessing) Export
	ArrayOfFilters = New Array();
	ArrayOfFilters.Add(DocumentsClientServer.CreateFilterItem("DeletionMark", True, ComparisonType.NotEqual));
	AdditionalParameters = New Structure();
	If ValueIsFilled(Form.Items.PaymentList.CurrentData.Partner) Then
		AdditionalParameters.Insert("Partner", Form.Items.PaymentList.CurrentData.Partner);
		AdditionalParameters.Insert("FilterByPartnerHierarchy", True);
	EndIf;
	DocumentsClient.CompanyEditTextChange(Object, Form, Item, Text, StandardProcessing, ArrayOfFilters,
		AdditionalParameters);
EndProcedure

#EndRegion

#Region ItemDescription

Procedure DescriptionClick(Object, Form, Item, StandardProcessing) Export
	StandardProcessing = False;
	CommonFormActions.EditMultilineText(Item.Name, Form);
EndProcedure

#EndRegion

#Region GroupTitleDecorationsEvents

Procedure DecorationGroupTitleCollapsedPictureClick(Object, Form, Item) Export
	DocumentsClient.ChangeTitleCollapse(Object, Form, True);
EndProcedure

Procedure DecorationGroupTitleCollapsedLabelClick(Object, Form, Item) Export
	DocumentsClient.ChangeTitleCollapse(Object, Form, True);
EndProcedure

Procedure DecorationGroupTitleUncollapsedPictureClick(Object, Form, Item) Export
	DocumentsClient.ChangeTitleCollapse(Object, Form, False);
EndProcedure

Procedure DecorationGroupTitleUncollapsedLabelClick(Object, Form, Item) Export
	DocumentsClient.ChangeTitleCollapse(Object, Form, False);
EndProcedure

#EndRegion
