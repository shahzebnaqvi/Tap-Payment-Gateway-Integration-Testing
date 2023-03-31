import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_sell_sdk_flutter/go_sell_sdk_flutter.dart';
import 'package:go_sell_sdk_flutter/model/models.dart';
import 'package:paymentgatewayimplement/payment_controller.dart';
import 'awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tap_payment/flutter_tap_payment.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Tap Payment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Tap Payment Example'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  PaymentController paymentControl = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GetBuilder(
            init: paymentControl,
            builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: TextButton(
                          onPressed: () => {paymentControl.paymentfunc()},
                          child: const Text("Make Payment")),
                    ),
                    Text("${paymentControl.statusCode}"),
                    Text("${paymentControl.responseData}")
                  ],
                ),
              );
            }));
  }
}
