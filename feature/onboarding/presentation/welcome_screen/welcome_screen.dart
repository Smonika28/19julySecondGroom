import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groomely_seller/feature/login/presentation/login_screen.dart';
import 'package:groomely_seller/feature/onboarding/presentation/welcome_screen/widgets/welcome_slide.dart';
import 'package:groomely_seller/feature/onboarding/presentation/welcome_screen/widgets/welcome_slide_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../theme/diviceHeight.dart';
import '../../../../utils/storage/local_storage.dart';


class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);

    int currentSlideNo = 1;
    final PageController pageViewController = PageController(
      initialPage: currentSlideNo,
    );
    // Box<dynamic> settingsBox = Hive.box('settings');

    LocalStorageService localStorageService = LocalStorageService();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView(
                controller: pageViewController,
                onPageChanged: (int slideNo) {

                },
                children: <Widget>[
                  WelcomeSlide(
                    deviceSizeConfig: deviceSizeConfig,
                    imageUrl: 'assets/images/groomely_graphic_01.png',
                    // imageUrl: 'assets/images/groomely_graphic_01.svg',
                    slideTitle: 'Welcome to Groomely',
                    slideText:
                        'Come fall in love with yourself at Groomely. Let us spoil you with our premium services because you deserve the best care.',
                  ),
                  WelcomeSlide(
                    deviceSizeConfig: deviceSizeConfig,
                    imageUrl: 'assets/images/groomely_graphic_02.png',
                    // imageUrl: 'assets/images/groomely_graphic_02.svg',
                    slideTitle: 'Book and Schedule',
                    slideText:
                        "It's time to get glowy! Book your favorite stylist and get the look you've always wanted with Groomely.",
                  ),
                  WelcomeSlide(
                    deviceSizeConfig: deviceSizeConfig,
                    imageUrl: 'assets/images/groomely_graphic_03.png',
                    // imageUrl: 'assets/images/groomely_graphic_03.svg',
                    slideTitle: "Let's Get Started",
                    // slideText:
                    //     'Relax, you are in the right place. We are so excited to have you here. Our exceptional grooming service is just one click away.',
                    slideText:
                        'Exceptional grooming service, just a click away. Schedule your appointment today that fits your busy lifestyle.',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: deviceSizeConfig.blockSizeVertical * 7.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  WelcomeSlideIndicator(
                    deviceSizeConfig: deviceSizeConfig,
                    isActive: currentSlideNo == 0 ? true : false,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  WelcomeSlideIndicator(
                    deviceSizeConfig: deviceSizeConfig,
                    isActive: currentSlideNo == 1 ? true : false,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  WelcomeSlideIndicator(
                    deviceSizeConfig: deviceSizeConfig,
                    isActive: currentSlideNo == 2 ? true : false,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: deviceSizeConfig.blockSizeVertical * 15.0,
              // color: Colors.amber,
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 16.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (currentSlideNo == 2) {
                        // settingsBox.put('returningUser', true);
                        localStorageService.saveToDisk(
                            LocalStorageService.RETURNING_USER, true);

                        Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen()));
                      } else {
                        int updatedSlideNo =
                            currentSlideNo == 2 ? 2 : currentSlideNo + 1;

                        // ref
                        //     .read(welcomeSlideNoProvider.notifier)
                        //     .updateCurrentSlideNo(updatedSlideNo);

                        pageViewController.animateToPage(
                          updatedSlideNo,
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.easeOutQuint,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFFD5A353),
                      foregroundColor: Colors.white,
                      elevation: 0.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      minimumSize: Size(
                        double.infinity,
                        deviceSizeConfig.blockSizeVertical * 6.5,
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.25,
                      ),
                    ),
                    child: currentSlideNo == 2
                        ? Text(
                            'Get Started',
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0),
                          )
                        : Text(
                            'Continue',
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0),
                          ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      // settingsBox.put('returningUser', true);
                      localStorageService.saveToDisk(
                          LocalStorageService.RETURNING_USER, true);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen()));
                    },
                    child: Text('Skip for now',
                        style: GoogleFonts.inter(
                            fontSize: 14.0,
                            color: const Color(0XFF1E1E1E),
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
//
//
//
//
//
// //My code
//
// import 'package:flutter/material.dart';
//
// class SplashScreen2 extends StatefulWidget {
//   // const SplashScreen2({super.key});
//
//   @override
//   State<SplashScreen2> createState() => _SplashScreen2();
// }
//
// class _SplashScreen2 extends State<SplashScreen2> {
//   List RandomImages = [
//     'https://pixlr.com/images/index/remove-bg.webp',
//     'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg',
//     'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXxlbnwwfHwwfHw%3D&w=1000&q=80',
//     'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528',
//     'https://pixlr.com/images/index/remove-bg.webp',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final _screenHeight = MediaQuery.of(context).size.height -
//         kToolbarHeight -
//         MediaQuery.of(context).padding.top;
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 3),
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
//               height: _screenHeight * 0.3,
//               width: MediaQuery.of(context).size.width * 0.6,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Stack(
//                     alignment: Alignment.bottomRight,
//                     children: [
//                       CircleAvatar(
//                           radius: 64,
//                           backgroundImage: Image.asset(
//                             ("assets/img/profile.png"),
//                             fit: BoxFit.cover,
//                           ).image),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (int i = 0; i < RandomImages.length; i++)
//                   Align(
//                     widthFactor: 0.8,
//                     child: CircleAvatar(
//                       radius: 35,
//                       backgroundImage: NetworkImage(RandomImages[i]),
//                     ),
//                   )
//               ],
//             ),
//             Container(
//               margin: const EdgeInsets.only(bottom: 10, top: 10),
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               width: MediaQuery.of(context).size.width * 0.9,
//               child: const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "More than 1M People using us",
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
//                   ),
//                 ],
//               ),
//             ),
//             const Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Refer Your Friends",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                       height: 3.9,
//                     )),
//                 // Padding(padding: EdgeInsets.all(10)),
//               ],
//             ),
//             Container(
//               width: 400,
//               padding: const EdgeInsets.only(left: 28),
//               child: const Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                       "Lorem ipsum dolor sit amet, consecrated advising elite."
//                       "Fauci's Matrices rises nisei camcorder Renan diagnosis odious incident.",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w300,
//                         color: Colors.black,
//                       )),
//                 ],
//               ),
//             ),
//             Container()
//           ],
//         ),
//       ),
//     );
//   }
// }
