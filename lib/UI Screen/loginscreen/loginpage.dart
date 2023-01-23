

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/button.dart';
import '../../utils/constant.dart';
import '../../utils/responsive.dart';
import '../../utils/smalltext.dart';
import '../../utils/strings.dart';
import '../sidemenu/sidemenu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width:   ResponsiveScreens.isMobile(context)||ResponsiveScreens.isLargeMobile(context)  ?MediaQuery.of(context).size.width: ResponsiveScreens.isMobileView(context)?MediaQuery.of(context).size.width:ResponsiveScreens.isSmallMobileView(context)?MediaQuery.of(context).size.width:MediaQuery.of(context).size.width/2,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left:ResponsiveScreens.isMobile(context)?27:ResponsiveScreens.isMobileView(context)?15:ResponsiveScreens.isSmallMobileView(context)?10:ResponsiveScreens.isDesktopView(context)||ResponsiveScreens.isTablet(context)? 20:ResponsiveScreens.isTabletView(context)?10: 40.0,top: 20),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/login/yellowbench.png',
                          // width: 150,
                        ),
                        SizedBox(height: 75,),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Container(
                            width:ResponsiveScreens.isMobile(context)||ResponsiveScreens.isLargeMobile(context) ?MediaQuery.of(context).size.width/1.3:ResponsiveScreens.isMobileView(context)? MediaQuery.of(context).size.width/1.3:ResponsiveScreens.isSmallMobileView(context)? MediaQuery.of(context).size.width/1.2:ResponsiveScreens.isDesktopView(context)? MediaQuery.of(context).size.width/2.8 :ResponsiveScreens.isTablet(context)? MediaQuery.of(context).size.width/2.8 :ResponsiveScreens.isTabletView(context)?MediaQuery.of(context).size.width/2.5:MediaQuery.of(context).size.width/3.5,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(text: MyStrings.welcomeBack,size: ResponsiveScreens.isMobileView(context)?30:ResponsiveScreens.isSmallMobileView(context)||ResponsiveScreens.isTablet(context)?25:ResponsiveScreens.isTabletView(context)?20:35,fontWeight: FontWeight.w600,color: loginWhiteColor),
                                SizedBox(height: 5,),
                                SmallText(text: MyStrings.loginDetails,size:ResponsiveScreens.isMobileView(context)?14:ResponsiveScreens.isSmallMobileView(context)||ResponsiveScreens.isTablet(context)||ResponsiveScreens.isTabletView(context)?13: 16,color: loginWhiteColor,fontStyle: FontStyle.italic),
                                SizedBox(height: 40,),
                                SmallText(text:  MyStrings.emailAddress,color: loginSubTextColor),
                                SizedBox(height: 8,),
                                TextFormField(
                                  // initialValue: _value1.toString(),
                                  decoration:  InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10,0,0,0),
                                    border: InputBorder.none,
                                    hintText: "example@gmail.com",
                                    // labelText:  MyStrings.emailAddress,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          width: 1, color: whiteColor), //<-- SEE HERE
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          width: 1, color: primaryColor), //<-- SEE HERE
                                    ),
                                  ),
                                  // onChanged: (value) {
                                  //   setState(() {
                                  //     border=true;
                                  //   });
                                  // },
                                ),
                                SizedBox(height: 20,),
                                SmallText(text:  MyStrings.password,color: loginSubTextColor,),
                                SizedBox(height: 8,),
                                TextFormField(
                                  // initialValue: _value1.toString(),
                                  decoration:  InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(10,0,0,0),
                                    border: InputBorder.none,
                                    hintText: "******",
                                    // labelText:  MyStrings.emailAddress,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          width: 1, color: whiteColor ), //<-- SEE HERE
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          width: 1, color: primaryColor), //<-- SEE HERE
                                    ),
                                  ),
                                  // onChanged: (value) {
                                  //   setState(() {
                                  //     border=true;
                                  //   });
                                  // },
                                ),
                                heightspace,
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 24.0,
                                              width: 24.0,
                                              child: Theme(
                                                data: ThemeData(
                                                    unselectedWidgetColor: primaryColor.withOpacity(0.8) // Your color
                                                ),
                                                child: Checkbox(
                                                  activeColor: primaryColor,
                                                  value: _isChecked,
                                                  // onChanged: (value){},
                                                  onChanged: _handleRemeberme,
                                                ),
                                              )),
                                          SizedBox(width: 10.0),
                                          SmallText(text: "Remember Me",size: 12,color: loginWhiteColor,
                                                )
                                        ]),
                                    SmallText(text: MyStrings.forgotPassword,color: loginWhiteColor,textAlign: TextAlign.right,size: ResponsiveScreens.isMobileView(context)?13:ResponsiveScreens.isSmallMobileView(context)||ResponsiveScreens.isTablet(context)? 12:ResponsiveScreens.isTabletView(context)?12:15),
                                  ],
                                ),
                                SizedBox(height:ResponsiveScreens.isMobile(context)?60: 40,),
                                InkWell(
                                  onTap: (){

                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                            PageTransitionType.rightToLeft,
                                            child:LayOutScreen()));
                                  },
                                  child: Container(
                                      width:ResponsiveScreens.isMobile(context)||ResponsiveScreens.isLargeMobile(context) ?MediaQuery.of(context).size.width/1.3:ResponsiveScreens.isMobileView(context)? MediaQuery.of(context).size.width/1.2 :ResponsiveScreens.isSmallMobileView(context)?MediaQuery.of(context).size.width/1.2:ResponsiveScreens.isDesktopView(context)||ResponsiveScreens.isTablet(context)? MediaQuery.of(context).size.width/2.8:ResponsiveScreens.isTabletView(context)?MediaQuery.of(context).size.width/2.5:MediaQuery.of(context).size.width/3,
                                      child: Button(text: MyStrings.login,)),
                                ),
                               ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment:ResponsiveScreens.isMobile(context)? Alignment.bottomCenter :ResponsiveScreens.isMobileView(context)? Alignment.bottomCenter :ResponsiveScreens.isSmallMobileView(context)?Alignment.bottomCenter:Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,0,10),
                      child: InkWell(

                          onTap: () => launch('https://dotsnews.in/'),
                            child: SmallText(text: "Copyright © 2022 YellowBench. All Rights Reserved.",size:ResponsiveScreens.isMobile(context)||ResponsiveScreens.isMobileView(context)||ResponsiveScreens.isSmallMobileView(context)||ResponsiveScreens.isLargeMobile(context)||ResponsiveScreens.isTabletView(context)?12:15,color: whiteColor.withOpacity(0.8))),
                    ),
                  ),
                ],
              ),
            ),
            ResponsiveScreens.isMobile(context)||ResponsiveScreens.isLargeMobile(context)?SizedBox(): ResponsiveScreens.isMobileView(context)?SizedBox():  ResponsiveScreens.isSmallMobileView(context)?SizedBox():   Container(
              width: MediaQuery.of(context).size.width/2,
              child: Image.asset(
                'assets/login/backgroundImage.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );

  }
  void _handleRemeberme(value) {
    print("Handle Rember Me");
    _isChecked = value;
    // SharedPreferences.getInstance().then(
    //       (prefs) {
    //     prefs.setBool("remember_me", value);
    //     prefs.setString('email', _emailController.text);
    //     prefs.setString('password', _passwordController.text);
    //   },
    // );
    setState(() {
      _isChecked = value;
    });
  }
}
