import 'package:flutter/material.dart';

class ResponsiveScreens extends StatelessWidget {

  final Widget? largeDesktopScreen;
  final Widget? mobileViewScreen;
  final Widget? tabletView;
  final Widget? middesktop;
  final Widget? desktopViewScreen;
  final Widget? smallMobileViewScreen;
  final Widget? largeMobile;
  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;

  const ResponsiveScreens({Key? key,

    this.mobileViewScreen,
    this.tabletView,
    this.desktopViewScreen,
    this.middesktop,
    this.smallMobileViewScreen,
    this.largeDesktopScreen,
    this.largeMobile,
    this.desktop,
    this.tablet,
    this.mobile,


  }) : super(key: key);


// This isMobile, isTablet, isDesktop help us later


  static bool isSmallMobileView(BuildContext context) =>
      MediaQuery.of(context).size.width < 320;

  static bool isMobileView(BuildContext context) =>
      MediaQuery.of(context).size.width < 375 &&
          MediaQuery.of(context).size.width >= 320;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 425 &&
          MediaQuery.of(context).size.width >= 375;

  static bool isLargeMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <600 &&
          MediaQuery.of(context).size.width >= 425;

  static bool isTabletView(BuildContext context) =>
      MediaQuery.of(context).size.width <768 &&
          MediaQuery.of(context).size.width >= 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 850 &&
          MediaQuery.of(context).size.width >= 768;

  static bool isDesktopView(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024 &&
          MediaQuery.of(context).size.width >=850;

  static bool isMidDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width < 1440 &&
          MediaQuery.of(context).size.width >=1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width < 2000 &&
          MediaQuery.of(context).size.width >=1440;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 2000;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          if (constraints.maxWidth >= 2000){
            return largeDesktopScreen!;
          }

          else if(constraints.maxWidth>=1440){
            return desktop!;
          }

          else if(constraints.maxWidth>=1024){
            return middesktop!;
          }
          else if (constraints.maxWidth >= 850) {
            return desktopViewScreen!;
          }
          else if (constraints.maxWidth >= 768) {
            return tablet!;
          }
          // If width it less then 1100 and more then 650 we consider it as tablet
          else if (constraints.maxWidth >= 600) {
            return tabletView!;
          }
          else if (constraints.maxWidth >= 425) {
            return largeMobile!;
          }
          // Or less then that we called it mobile
          else if(constraints.maxWidth>= 375){
            return mobile!;
          }
          else if(constraints.maxWidth>= 320){
            return mobileViewScreen!;
          }
          {
            return smallMobileViewScreen!;
          }
        }
    );
  }
}