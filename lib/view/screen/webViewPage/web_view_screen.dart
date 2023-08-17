library flutter_bkash;

import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../util/InternetCheck.dart';
import '../../../util/dimensions.dart';
import '../../../util/styles.dart';


typedef PaymentStatus<A, B> = void Function(A status, B data);

class WebViewPage extends StatefulWidget {
  /// default the sandbox is true

  final String url;
  final String title;


  const WebViewPage({
    Key? key,
    required this.url, required this.title,
  }) : super(key: key);

  @override
  BkashPaymentState createState() => BkashPaymentState();
}

class BkashPaymentState extends State<WebViewPage> {
  InAppWebViewController? webViewController;

  bool isLoading = true;
  // define the payment empty dynamic variable for payment data
  var paymentData = {};
  bool isOnline = true;
  // payment handler as payment status
  /*void _paymentHandler(status, data) {
    widget.paymentStatus.call(status, data);
  }*/
  void checkOnline() async {
    isOnline = await InternetCheck.checkUserConnection();
  }
  @override
  void initState() {
    super.initState();
   checkOnline();
    // payment data create as like below
    /* paymentData = {
      'paymentRequest': {
        'amount': widget.amount,
        'intent': widget.intent,
        'ref_no': widget.refNo ?? '',
        'currency': widget.currency ?? '',
      },
      'paymentConfig': {
        /// sandbox is sandbox or live mode, change the value depend on it
        'createCheckoutURL': widget.isSandbox
            ? BkashConstants.sandboxCreateUrlBKash
            : widget.createBKashUrl,
        'executeCheckoutURL': widget.isSandbox
            ? BkashConstants.sandboxExecuteUrlBKash
            : widget.executeBKashUrl,
        'scriptUrl': widget.scriptUrl,
      },
      'accessToken': widget.accessToken ?? '',
    };*/
    // print(paymentData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('${widget.title}',style: robotoMedium.copyWith(color: Colors.white,fontSize: Dimensions.fontSizeLarge),),backgroundColor: Theme.of(context).primaryColor,



      ),
      /*appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.pink,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Navigator.pop(context, true),
          ),
          title: const Text('bKash Checkout')),*/
      body: Container(
        height:Get.height,
        child:isOnline?Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    // access the html file on local
                    initialUrlRequest: URLRequest(
                        url: Uri.parse(widget.url)
                    ),
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        useShouldOverrideUrlLoading: true,
                        mediaPlaybackRequiresUserGesture: false,
                        javaScriptCanOpenWindowsAutomatically: true,
                        useShouldInterceptFetchRequest: true,
                      ),
                      android: AndroidInAppWebViewOptions(
                        useShouldInterceptRequest: true,
                        useHybridComposition: true,
                      ),
                      ios: IOSInAppWebViewOptions(
                        allowsInlineMediaPlayback: true,
                      ),
                    ),
                    onWebViewCreated: (controller) {
                      webViewController = controller;
                      //sending data from dart to js the data of payment
                      /* controller.addJavaScriptHandler(
                              handlerName: 'handlerFoo',
                              callback: (args) {
                                // return data to the JavaScript side!
                                return paymentData;
                              });*/

                      controller.clearCache();
                    },

                    onLoadStop: ((controller, url) {
                      // print('url $url');

                      /// for payment success
                      controller.addJavaScriptHandler(
                          handlerName: 'paymentSuccess',
                          callback: (success) {
                            // print("bkashSuccess $success");
                            //_paymentHandler('paymentSuccess', success[0]);
                          });

                      /// for payment failed
                      controller.addJavaScriptHandler(
                          handlerName: 'paymentFailed',
                          callback: (failed) {
                            print("bkashFailed $failed");
                            //_paymentHandler('paymentFailed', failed);
                          });

                      /// for payment error
                      controller.addJavaScriptHandler(
                          handlerName: 'paymentError',
                          callback: (error) {
                            print("paymentError => $error");
                            // _paymentHandler('paymentError', error[0]);
                          });

                      /// for payment failed
                      controller.addJavaScriptHandler(
                          handlerName: 'paymentClose',
                          callback: (close) {
                            print("paymentClose => $close");
                            // _paymentHandler('paymentClose', close[0]);
                          });

                      /// set state is loading or not loading depend on page data
                      setState(() => isLoading = false);
                    }),

                    onConsoleMessage: (controller, consoleMessage) {
                      /// for view the console log as message on flutter side
                      dev.log(consoleMessage.toString());
                    },
                  ),
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Container(),
                ],
              ),
            ),
          ],
        ):Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icon/no_internet.png"),
              SizedBox(height: 20,),
              Text("No Internet Connection",style: robotoMedium,),
              Text("Check your connection and try again",style: robotoMedium),
            ],
          ),
        ),
      ),
    );
  }
}