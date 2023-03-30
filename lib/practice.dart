// import 'package:flutter/material.dart';
// import 'package:flutter_tap_payment/flutter_tap_payment.dart';

// class Method2 extends StatelessWidget {
//   const Method2({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Tap Payment',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Tap Payment Example'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: Center(
//           child: TextButton(
//               onPressed: () => {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (BuildContext context) => TapPayment(
//                             apiKey: "sk_test_gwmjLpYk2H7xB6Fl5tTr9KWE",
//                             redirectUrl: "http://your_website.com/redirect_url",
//                             // postUrl: "http://your_website.com/post_url",
//                             postUrl: "https://tap.company",
//                             paymentData: const {
//                               "amount": 10,
//                               "currency": "PKR",
//                               "threeDSecure": true,
//                               "save_card": false,
//                               "description": "Test Description",
//                               "statement_descriptor": "Sample",
//                               "metadata": {"udf1": "test 1", "udf2": "test 2"},
//                               "reference": {
//                                 "transaction": "txn_0001",
//                                 "order": "ord_0001"
//                               },
//                               "receipt": {"email": false, "sms": true},
//                               "customer": {
//                                 "first_name": "test",
//                                 "middle_name": "test",
//                                 "last_name": "test",
//                                 "email": "test@test.com",
//                                 "phone": {
//                                   "country_code": "965",
//                                   "number": "50000000"
//                                 }
//                               },
//                               // "merchant": {"id": ""},
//                               "source": {"id": "src_card"},
//                               // "destinations": {
//                               //   "destination": [
//                               //     {"id": "480593777", "amount": 2, "currency": "KWD"},
//                               //     {"id": "486374777", "amount": 3, "currency": "KWD"}
//                               //   ]
//                               // }
//                             },
//                             onSuccess: (Map params) async {
//                               print("onSuccess: $params");
//                             },
//                             onError: (error) {
//                               print("onError: $error");
//                             }),
//                       ),
//                     )
//                   },
//               child: const Text("Make Payment")),
//         ));
//   }
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Map<dynamic, dynamic> tapSDKResult = {};
//   String responseID = "";
//   String sdkStatus = "";
//   String? sdkErrorCode;
//   String? sdkErrorMessage;
//   String? sdkErrorDescription;
//   AwesomeLoaderController loaderController = AwesomeLoaderController();
//   Color? _buttonColor;

//   @override
//   void initState() {
//     super.initState();
//     _buttonColor = const Color(0xff2ace00);
//     configureSDK();
//   }

//   // configure SDK
//   Future<void> configureSDK() async {
//     // configure app
//     configureApp();
//     // sdk session configurations
//     setupSDKSession();
//   }

//   // Secret API Key Keysk_test_gwmjLpYk2H7xB6Fl5tTr9KWE
//   // Publishable API Key pk_test_Ux2pZhOBz6VPYEFLyXMtNDGq

//   // configure app key and bundle-id (You must get those keys from tap)
//   Future<void> configureApp() async {
//     GoSellSdkFlutter.configureApp(
//       bundleId: Platform.isAndroid ? "com.meetntrain" : "IOS-APP-ID",
//       productionSecreteKey:
//           Platform.isAndroid ? "Android-Live-KEY" : "iOS-Live-KEY",
//       sandBoxsecretKey: Platform.isAndroid
//           ? "Keysk_test_gwmjLpYk2H7xB6Fl5tTr9KWE"
//           : "iOS-SANDBOX-KEY",
//       lang: "en",
//     );
//   }

//   //

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> setupSDKSession() async {
//     try {
//       GoSellSdkFlutter.sessionConfigurations(
//           trxMode: TransactionMode.TOKENIZE_CARD,
//           transactionCurrency: "kwd",
//           amount: '1',
//           customer: Customer(
//               customerId: "",
//               // customer id is important to retrieve cards saved for this customer
//               email: "test@test.com",
//               isdNumber: "965",
//               number: "00000000",
//               firstName: "test",
//               middleName: "test",
//               lastName: "test",
//               metaData: null),
//           paymentItems: <PaymentItem>[
//             PaymentItem(
//                 name: "item1",
//                 amountPerUnit: 1,
//                 quantity: Quantity(value: 1),
//                 discount: {
//                   "type": "F",
//                   "value": 10,
//                   "maximum_fee": 10,
//                   "minimum_fee": 1
//                 },
//                 description: "Item 1 Apple",
//                 taxes: [
//                   Tax(
//                       amount: Amount(
//                           type: "F", value: 10, minimumFee: 1, maximumFee: 10),
//                       name: "tax1",
//                       description: "tax describtion")
//                 ],
//                 totalAmount: 100),
//           ],
//           // List of taxes
//           taxes: [
//             Tax(
//                 amount:
//                     Amount(type: "F", value: 10, minimumFee: 1, maximumFee: 10),
//                 name: "tax1",
//                 description: "tax describtion"),
//             Tax(
//                 amount:
//                     Amount(type: "F", value: 10, minimumFee: 1, maximumFee: 10),
//                 name: "tax1",
//                 description: "tax describtion")
//           ],
//           // List of shippnig
//           shippings: [
//             Shipping(
//                 name: "shipping 1",
//                 amount: 100,
//                 description: "shiping description 1"),
//             Shipping(
//                 name: "shipping 2",
//                 amount: 150,
//                 description: "shiping description 2")
//           ],
//           postURL: "https://tap.company",
//           // Payment description
//           paymentDescription: "paymentDescription",
//           // Payment Metadata
//           paymentMetaData: {
//             "a": "a meta",
//             "b": "b meta",
//           },
//           // Payment Reference
//           paymentReference: Reference(
//               acquirer: "acquirer",
//               gateway: "gateway",
//               payment: "payment",
//               track: "track",
//               transaction: "trans_910101",
//               order: "order_262625"),
//           // payment Descriptor
//           paymentStatementDescriptor: "paymentStatementDescriptor",
//           // Save Card Switch
//           isUserAllowedToSaveCard: true,
//           // Enable/Disable 3DSecure
//           isRequires3DSecure: true,
//           // Receipt SMS/Email
//           receipt: Receipt(true, false),
//           // Authorize Action [Capture - Void]
//           authorizeAction: AuthorizeAction(
//               type: AuthorizeActionType.CAPTURE, timeInHours: 10),
//           // Destinations
//           destinations: null,
//           // merchant id
//           merchantID: "",
//           // Allowed cards
//           allowedCadTypes: CardType.ALL,
//           applePayMerchantID: "applePayMerchantID",
//           allowsToSaveSameCardMoreThanOnce: true,
//           // pass the card holder name to the SDK
//           cardHolderName: "Card Holder NAME",
//           // disable changing the card holder name by the user
//           allowsToEditCardHolderName: true,
//           // select payments you need to show [Default is all, and you can choose between WEB-CARD-APPLEPAY ]
//           paymentType: PaymentType.ALL,
//           // Transaction mode
//           sdkMode: SDKMode.Sandbox);
//     } on PlatformException {
//       // platformVersion = 'Failed to get platform version.';
//     }

//     if (!mounted) return;

//     setState(() {
//       tapSDKResult = {};
//     });
//   }

//   Future<void> startSDK() async {
//     setState(() {
//       loaderController.start();
//     });

//     var tapSDKResult = await GoSellSdkFlutter.startPaymentSDK;
//     loaderController.stopWhenFull();
//     debugPrint('>>>> ${tapSDKResult['sdk_result']}');

//     setState(() {
//       switch (tapSDKResult['sdk_result']) {
//         case "SUCCESS":
//           sdkStatus = "SUCCESS";
//           handleSDKResult();
//           break;
//         case "FAILED":
//           sdkStatus = "FAILED";
//           handleSDKResult();
//           break;
//         case "SDK_ERROR":
//           debugPrint('sdk error............');
//           debugPrint(tapSDKResult['sdk_error_code']);
//           debugPrint(tapSDKResult['sdk_error_message']);
//           debugPrint(tapSDKResult['sdk_error_description']);
//           debugPrint('sdk error............');
//           sdkErrorCode = tapSDKResult['sdk_error_code'].toString();
//           sdkErrorMessage = tapSDKResult['sdk_error_message'];
//           sdkErrorDescription = tapSDKResult['sdk_error_description'];
//           break;

//         case "NOT_IMPLEMENTED":
//           sdkStatus = "NOT_IMPLEMENTED";
//           break;
//       }
//     });
//   }

//   void handleSDKResult() {
//     debugPrint('>>>> ${tapSDKResult['trx_mode']}');

//     switch (tapSDKResult['trx_mode']) {
//       case "CHARGE":
//         printSDKResult('Charge');
//         break;

//       case "AUTHORIZE":
//         printSDKResult('Authorize');
//         break;

//       case "SAVE_CARD":
//         printSDKResult('Save Card');
//         break;

//       case "TOKENIZE":
//         debugPrint('TOKENIZE token : ${tapSDKResult['token']}');
//         debugPrint(
//             'TOKENIZE token_currency  : ${tapSDKResult['token_currency']}');
//         debugPrint(
//             'TOKENIZE card_first_six : ${tapSDKResult['card_first_six']}');
//         debugPrint(
//             'TOKENIZE card_last_four : ${tapSDKResult['card_last_four']}');
//         debugPrint('TOKENIZE card_object  : ${tapSDKResult['card_object']}');
//         debugPrint(
//             'TOKENIZE card_exp_month : ${tapSDKResult['card_exp_month']}');
//         debugPrint(
//             'TOKENIZE card_exp_year    : ${tapSDKResult['card_exp_year']}');

//         responseID = tapSDKResult['token'];
//         break;
//     }
//   }

//   void printSDKResult(String trxMode) {
//     debugPrint('$trxMode status                : ${tapSDKResult['status']}');
//     debugPrint('$trxMode id               : ${tapSDKResult['charge_id']}');
//     debugPrint('$trxMode  description        : ${tapSDKResult['description']}');
//     debugPrint('$trxMode  message           : ${tapSDKResult['message']}');
//     debugPrint('$trxMode  card_first_six : ${tapSDKResult['card_first_six']}');
//     debugPrint(
//         '$trxMode  card_last_four   : ${tapSDKResult['card_last_four']}');
//     debugPrint(
//         '$trxMode  card_object         : ${tapSDKResult['card_object']}');
//     debugPrint('$trxMode  card_brand          : ${tapSDKResult['card_brand']}');
//     debugPrint('$trxMode  card_exp_month  : ${tapSDKResult['card_exp_month']}');
//     debugPrint('$trxMode  card_exp_year: ${tapSDKResult['card_exp_year']}');
//     debugPrint('$trxMode  acquirer_id  : ${tapSDKResult['acquirer_id']}');
//     debugPrint(
//         '$trxMode  acquirer_response_code : ${tapSDKResult['acquirer_response_code']}');
//     debugPrint(
//         '$trxMode  acquirer_response_message: ${tapSDKResult['acquirer_response_message']}');
//     debugPrint('$trxMode  source_id: ${tapSDKResult['source_id']}');
//     debugPrint(
//         '$trxMode  source_channel     : ${tapSDKResult['source_channel']}');
//     debugPrint(
//         '$trxMode  source_object      : ${tapSDKResult['source_object']}');
//     debugPrint(
//         '$trxMode source_payment_type : ${tapSDKResult['source_payment_type']}');

//     responseID = tapSDKResult['charge_id'];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(
//         title: const Text('Plugin example app'),
//         backgroundColor: Colors.grey,
//       ),
//       body: SafeArea(
//         child: Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             Positioned(
//               top: 300,
//               left: 18,
//               right: 18,
//               child: Text("Status: [$sdkStatus $responseID ]",
//                   style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w400,
//                       fontFamily: "Roboto",
//                       fontStyle: FontStyle.normal,
//                       fontSize: 15.0),
//                   textAlign: TextAlign.center),
//             ),
//             Positioned(
//               bottom: Platform.isIOS ? 0 : 10,
//               left: 18,
//               right: 18,
//               child: SizedBox(
//                   height: 45,
//                   child: ElevatedButton(
//                     clipBehavior: Clip.hardEdge,
//                     style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all(_buttonColor),
//                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)))),
//                     onPressed: startSDK,
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             width: 25,
//                             height: 25,
//                             child: AwesomeLoader(
//                               outerColor: Colors.white,
//                               innerColor: Colors.white,
//                               strokeWidth: 3.0,
//                               controller: loaderController,
//                             ),
//                           ),
//                           const Spacer(),
//                           const Text('PAY',
//                               style: TextStyle(
//                                   color: Colors.white, fontSize: 16.0)),
//                           const Spacer(),
//                           const Icon(
//                             Icons.lock_outline,
//                             color: Colors.white,
//                           ),
//                         ]),
//                   )),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
