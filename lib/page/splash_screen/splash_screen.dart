import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // autoLogin();
    // Future.delayed(const Duration(seconds: 2), () {
    //   // token = await LocalDataStorage.getCurrentUser();
    //   // AutoRouter.of(context).replaceNamed('/dashboard');
    //   context.router.pushNamed('/dashboard');
    //   // if (token != '') {
    //   //   // Navigator.pushReplacement(
    //   //   //   context,
    //   //   //   MaterialPageRoute(builder: (context) => const ButtomNavigationBar()),
    //   //   // );
    //   // } else {
    //   //   // Navigator.pushReplacement(
    //   //   //   context,
    //   //   //   MaterialPageRoute(builder: (context) => const LoginPage()),
    //   //   // );
    //   // }
    // });
    Future.delayed(const Duration(seconds: 2), () {
      AutoRouter.of(context).replaceNamed('/dashboard');
    });
    super.initState();
  }

  // String? token;
  // autoLogin() async {
  //   Future.delayed(const Duration(seconds: 2), () {
  //     // token = await LocalDataStorage.getCurrentUser();
  //     // AutoRouter.of(context).replaceNamed('/dashboard');
  //     context.router.replaceNamed('/dashboard/');
  //     // if (token != '') {
  //     //   // Navigator.pushReplacement(
  //     //   //   context,
  //     //   //   MaterialPageRoute(builder: (context) => const ButtomNavigationBar()),
  //     //   // );
  //     // } else {
  //     //   // Navigator.pushReplacement(
  //     //   //   context,
  //     //   //   MaterialPageRoute(builder: (context) => const LoginPage()),
  //     //   // );
  //     // }
  //   });

  //   debugPrint('token $token');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222B33),
      body: Stack(
        children: [
          // SizedBox(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   child: const Image(
          //     image: AssetImage('asset/background.jpg'),
          //     fit: BoxFit.cover,
          //     // filterQuality: FilterQuality.low,
          //   ),
          // ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/logo.png',
                  height: 300,
                ),
                LoadingAnimationWidget.halfTriangleDot(
                  color: const Color.fromARGB(255, 255, 189, 45),
                  size: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
