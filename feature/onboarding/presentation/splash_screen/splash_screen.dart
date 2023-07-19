import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theme/diviceHeight.dart';
import '../../../../utils/storage/local_storage.dart';
import '../../../login/presentation/login_screen.dart';

class SplashScreen extends StatefulWidget {
   const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocalStorageService localStorageService = LocalStorageService();

  String? get loginScreen => null;

  String? get welcomeScreen => null;
  @override
  void initState() {
    super.initState();
    _authCheck();
  }
  _authCheck() async {
    var authToken =
        await localStorageService.getFromDisk(LocalStorageService.ACCESS_TOKEN_KEY);
    final returningUser = await localStorageService
        .getFromDisk(LocalStorageService.RETURNING_USER);
    Future<void>.delayed(
      const Duration(seconds: 3),
      () {
        if (returningUser == true) {
          if (authToken != null) {
            if (mounted) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                LoginScreen() as String,
                (Route<dynamic> route) => false,
              );
            }
          } else {
            if (mounted) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                // signInScreen,
                loginScreen!,
                (Route<dynamic> route) => false,
              );
            }
          }
        } else {
          if (mounted) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=> LoginScreen()), (route) => false);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_screen_background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SizedBox(
            height: deviceSizeConfig.blockSizeVertical * 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/groomely_logo.png',
                  height: 85.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'GROOMELY',
                      style: GoogleFonts.sanchez(
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    Text(
                      'APPOINTMENTS MADE EASY',
                      style: GoogleFonts.teko(
                        color: Colors.white,
                        fontSize: 15.0,
                        letterSpacing: 2.25,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
