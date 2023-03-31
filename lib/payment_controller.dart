import 'package:flutter/material.dart';
import 'package:flutter_tap_payment/flutter_tap_payment.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  var statusCode = "";
  var responseData = "";
  paymentfunc() {
    Get.to(
      TapPayment(
          apiKey: "sk_test_gwmjLpYk2H7xB6Fl5tTr9KWE",
          redirectUrl: "http://your_website.com/redirect_url",
          // postUrl: "http://your_website.com/post_url",
          postUrl: "https://tap.company",
          paymentData: const {
            "amount": 10,
            "currency": "SAR",
            "threeDSecure": true,
            "save_card": false,
            "description": "Test Description",
            "statement_descriptor": "Sample",
            "metadata": {
              // "udf1": "test 1", "udf2": "test 2"
            },
            "reference": {"transaction": "txn_0001", "order": "ord_0001"},
            "receipt": {"email": false, "sms": true},
            "customer": {
              "first_name": "test",
              "middle_name": "test",
              "last_name": "test",
              "email": "test@test.com",
              "phone": {"country_code": "965", "number": "50000000"}
            },
            "merchant": {"id": "1124340"},
            "source": {"id": "src_card"},
            // "destinations": {
            //   "destination": [
            //     {"id": "480593777", "amount": 2, "currency": "KWD"},
            //     {"id": "486374777", "amount": 3, "currency": "KWD"}
            //   ]
            // }
          },
          onSuccess: (Map params) async {
            print("onSuccess--------: $params");
            statusCode = "Success";
            responseData = "${params}";
            update();
          },
          onError: (error) {
            print("onError--------: $error");
            statusCode = "Error";
            responseData = "${error}";
            update();
          }),
    );
  }
}
