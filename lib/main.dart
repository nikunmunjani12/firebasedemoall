import 'package:firebase_core/firebase_core.dart';
import 'package:firebasedemoall/Provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '0-Get-Storange.dart';
import '1-Login-Get_Storange.dart';
import '2-LogOut-Get_storange.dart';
import '3-1-Register_Page.dart';
import '3-2-Login_page.dart';
import '3-3-Home_Page.dart';
import 'Provider/counter_screen.dart';
import 'View/0_OTP_Code_.dart';
import 'View/0_OTP_Number.dart';
import 'View/1_otp_number_DEMO.dart';
import 'View/FireStore-sim.dart';
import 'View/google_sign_in.dart';
import 'View/imagepicker.dart';
import 'View/local_database.dart';
import 'View/payment_demo.dart';
import 'View/user_list.dart';
import 'demo.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    ///provider use
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider<SelectedProvider>(
          create: (context) => SelectedProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: box.read('userid') == null ? LoginScreen1() : LogoutScreen(),
        // home: box.read('userid') == null ? LoginScreen11() : homepage3(),
        home: CounterScreen(),
      ),
    );
  }
}
