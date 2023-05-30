import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DemoPayment extends StatefulWidget {
  const DemoPayment({super.key});

  @override
  State<DemoPayment> createState() => _DemoPaymentState();
}

class _DemoPaymentState extends State<DemoPayment> {
  final Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print('SUCCESS');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print('FAIL');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Pay'),
          onPressed: () {
            var options = {
              'key': 'rzp_test_4Y7Nhiv0EAzD3m',
              'amount': 100,
              'name': 'Acme Corp.',
              'description': 'Fine T-Shirt',
              'prefill': {
                'contact': '8888888888',
                'email': 'test@razorpay.com',
              }
            };
            _razorpay.open(options);
          },
        ),
      ),
    );
  }
}
