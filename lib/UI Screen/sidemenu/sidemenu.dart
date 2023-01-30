
import 'package:demo_project/UI%20Screen/leavemanagment/leavepolicy.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/constant.dart';
import '../../utils/responsive.dart';
import '../../utils/smalltext.dart';
import '../../utils/strings.dart';
import '../calendar/mobilecalendar.dart';
import '../dashboardscreen/dashboard.dart';
import '../leavemanagment/leave.dart';

class LayOutScreen extends StatefulWidget {
  const LayOutScreen({Key? key}) : super(key: key);

  @override
  _LayOutScreenState createState() => _LayOutScreenState();
}

class _LayOutScreenState extends State<LayOutScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int active = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 11 , initialIndex: 0,)
      ..addListener(() {
        setState(() {
          active = tabController!.index;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void showMenuSelection(String value) {
    print("pressed");
  }

  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: sideMenuColor,
        automaticallyImplyLeading: ResponsiveScreens.isLargeMobile(context) ||
                ResponsiveScreens.isMobile(context) ||
                ResponsiveScreens.isSmallMobileView(context) ||
                ResponsiveScreens.isMobileView(context)
            ? true
            : false,
        title: ResponsiveScreens.isLargeMobile(context) ||
            ResponsiveScreens.isMobile(context) ||
            ResponsiveScreens.isSmallMobileView(context) ||
            ResponsiveScreens.isMobileView(context)
            ?SizedBox():Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: const Image(
          image: AssetImage(
              'assets/sidemenu/yellowbenchlogo.png',),
        ),
            ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications,
                  color: whiteColor,
                  size: 30,
                ),
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 5),
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffc32c37),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: Text(
                          _counter.toString(),
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ResponsiveScreens.isLargeMobile(context) ||
              ResponsiveScreens.isMobile(context) ||
              ResponsiveScreens.isSmallMobileView(context) ||
              ResponsiveScreens.isMobileView(context)
              ?Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SizedBox(),
              ):Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 10),
            child: PopupMenuButton<String>(
              offset: Offset(0.0, 50),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              // icon: const Icon(Icons.account_circle_rounded),
              child: Row(
                children: [
                  Icon(Icons.account_circle_rounded, color: whiteColor),
                  SizedBox(width: 5,),
                  SmallText(
                    text: "Mark Autony",
                    color: whiteColor,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: whiteColor,
                  )
                ],
              ),
              onSelected: showMenuSelection,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                    child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 18,
                      color: blueGreyColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SmallText(
                      text: MyStrings.profile,
                      color: blueGreyColor,
                    )
                  ],
                )),
                PopupMenuItem<String>(
                    child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 18,
                      color: blueGreyColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SmallText(
                      text: MyStrings.logout,
                      color: blueGreyColor,
                    )
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          ResponsiveScreens.isLargeMobile(context) ||
                  ResponsiveScreens.isMobile(context) ||
                  ResponsiveScreens.isSmallMobileView(context) ||
                  ResponsiveScreens.isMobileView(context)
              ? SizedBox()
              : Container(
                  width: ResponsiveScreens.isMidDesktop(context)
                      ? MediaQuery.of(context).size.width * 0.13
                      : ResponsiveScreens.isDesktopView(context)
                          ? MediaQuery.of(context).size.width * 0.17
                          : ResponsiveScreens.isTabletView(context)
                              ? MediaQuery.of(context).size.width * 0.17
                              : MediaQuery.of(context).size.width * 0.12,
                  color: sideMenuColor,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: ResponsiveScreens.isTablet(context) ? 5 : 8.0),
                    child: listDrawerItems(false),
                  )),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                dashboardScreen(),
                LeaveSummary(),
                dashboardScreen(),
                dashboardScreen(),
                dashboardScreen(),
                dashboardScreen(),
                dashboardScreen(),
                dashboardScreen(),
                dashboardScreen(),
                dashboardScreen(),
                dashboardScreen(),
              ],
            ),
          ),
        ],
      ),
      drawer: ResponsiveScreens.isLargeMobile(context) ||
              ResponsiveScreens.isMobile(context) ||
              ResponsiveScreens.isSmallMobileView(context) ||
              ResponsiveScreens.isMobileView(context)
          ? Drawer(
             backgroundColor:secondaryColor ,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: blackColor,
                    ),
                    child:const Image(
                        image: AssetImage(
                          'assets/yellowbench.png',
                        ),
                    ),
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/dashboard.png',
                              ),color: blackColor,
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.dashboard,
                                size: 15,
                              color: blackColor,
                           )
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 5,),
                  Container(
                     height: 1,
                     width: MediaQuery.of(context).size.width,
                     color: sideMenuColor.withOpacity(0.1),
                   ),
                  SizedBox(height: 5,),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/calendar.png',
                              ),
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.calendar,
                                size: 15,
                                color: blackColor)
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type:
                              PageTransitionType.rightToLeft,
                              child:mobileCalendar()));

                    },
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: sideMenuColor.withOpacity(0.1),
                  ),
                  SizedBox(height: 5,),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/leavemanagment.png',
                              ),
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.taskBoard,
                                size: 15,
                                color: blackColor)
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                    onTap: () {

                    },
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: sideMenuColor.withOpacity(0.1),
                  ),
                  SizedBox(height: 5,),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/assets.png',
                              ),
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.asset,
                                size: 15,
                                color: blackColor)
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: sideMenuColor.withOpacity(0.1),
                  ),
                  SizedBox(height: 5,),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/leavemanagment.png',
                              ),
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.finance,
                                size: 15,
                                color: blackColor)
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: sideMenuColor.withOpacity(0.1),
                  ),
                  SizedBox(height: 5,),
                  // ListTile(
                  //   title: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Image(
                  //             image: const AssetImage(
                  //               'assets/sidemenu/leavemanagment.png',
                  //             ),
                  //           ),
                  //           widthspace,
                  //           SmallText(
                  //               text: MyStrings.hr,
                  //               size: 15,
                  //               color: blackColor)
                  //         ],
                  //       ),
                  //       Icon(Icons.keyboard_arrow_right)
                  //     ],
                  //   ),
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  // ),
                   Theme(
                     data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                     child: ExpansionTile(
                       iconColor: primaryColor,
                      initiallyExpanded: false,
                      title: Row(
                        children: [
                          Image(
                            image: const AssetImage(
                              'assets/sidemenu/leavemanagment.png',
                            ),
                          ),
                          widthspace,
                          SmallText(
                              text: MyStrings.hr,
                              size: 15,
                              color: blackColor)
                        ],
                      ),
                      children: <Widget>[
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: sideMenuColor.withOpacity(0.1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0,left: 30,bottom: 15),
                          child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type:
                                        PageTransitionType.rightToLeft,
                                        child:   const LeaveSummary()));
                              },
                              child:  Row(
                                children: [
                                 Icon(Icons.arrow_right_sharp),
                                  SmallText(
                                      text: MyStrings.leaveManagement,
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: blackColor),
                                ],
                              )),
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          color: sideMenuColor.withOpacity(0.1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0,left: 30,bottom: 15),
                          child: InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type:
                                        PageTransitionType.rightToLeft,
                                        child:   const LeavePolicy()));
                              },
                              child:  Row(
                                children: [
                                 Icon(Icons.arrow_right_sharp),
                                  SmallText(
                                      text: MyStrings.leavePolicy,
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: blackColor),
                                ],
                              )),
                        ),
                      ],
                  ),
                   ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: sideMenuColor.withOpacity(0.1),
                  ),
                  SizedBox(height: 5,),

                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/leavemanagment.png',
                              ),
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.reports,
                                size: 15,
                                color: blackColor)
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: sideMenuColor.withOpacity(0.1),
                  ),
                  SizedBox(height: 5,),

                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/leavemanagment.png',
                              ),
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.helpdesk,
                                size: 15,
                                color: blackColor)
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: sideMenuColor.withOpacity(0.1),
                  ),

                ],
              ),
            )
          : listDrawerItems(false),
    );
  }

  Widget listDrawerItems(bool drawerStatus) {
    return ListView(
      children: [
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            tabController!.animateTo(0);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              // borderRadius: BorderRadius.circular(10),
              color: tabController!.index == 0 ? blackColor : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child: ResponsiveScreens.isTablet(context) ||
                      ResponsiveScreens.isTabletView(context)
                  ? Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/dashboard.png',
                              ),
                              color: tabController!.index == 0
                                  ? primaryColor
                                  : sideMenuTextColor,
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.dashboard,
                                size: 15,
                                color: tabController!.index == 0
                                    ? primaryColor
                                    : sideMenuTextColor)
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Image(
                          image: const AssetImage(
                            'assets/sidemenu/dashboard.png',
                          ),
                          color: tabController!.index == 0
                              ? primaryColor
                              : sideMenuTextColor,
                        ),
                        widthspace,
                        SmallText(
                            text: MyStrings.dashboard,
                            size: 15,
                            color: tabController!.index == 0
                                ? primaryColor
                                : sideMenuTextColor)
                      ],
                    ),
            ),
          ),
        ),
        heightspace,
        InkWell(
          onTap: () {
            tabController!.animateTo(1);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: tabController!.index == 1 ? blackColor : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child: ResponsiveScreens.isTablet(context) ||
                      ResponsiveScreens.isTabletView(context)
                  ? Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/calendar.png',
                              ),
                              color: tabController!.index == 1
                                  ? primaryColor
                                  : sideMenuTextColor,
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.calendar,
                                size: 15,
                                color: tabController!.index == 1
                                    ? primaryColor
                                    : sideMenuTextColor)
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Image(
                          image: const AssetImage(
                            'assets/sidemenu/calendar.png',
                          ),
                          color: tabController!.index == 1
                              ? primaryColor
                              : sideMenuTextColor,
                        ),
                        widthspace,
                        SmallText(
                            text: MyStrings.calendar,
                            size: 15,
                            color: tabController!.index == 1
                                ? primaryColor
                                : sideMenuTextColor)
                      ],
                    ),
            ),
          ),
        ),
        heightspace,
        InkWell(
          onTap: () {
            tabController!.animateTo(2);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: tabController!.index == 2 ? blackColor : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child: ResponsiveScreens.isTablet(context) ||
                      ResponsiveScreens.isTabletView(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/calendar.png',
                              ),
                              color: tabController!.index == 2
                                  ? primaryColor
                                  : sideMenuTextColor,
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.leave,
                                size: 15,
                                color: tabController!.index == 2
                                    ? primaryColor
                                    : sideMenuTextColor)
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Image(
                          image: const AssetImage(
                            'assets/sidemenu/calendar.png',
                          ),
                          color: tabController!.index == 2
                              ? primaryColor
                              : sideMenuTextColor,
                        ),
                        widthspace,
                        SmallText(
                            text: MyStrings.leave,
                            size: 15,
                            color: tabController!.index == 2
                                ? primaryColor
                                : sideMenuTextColor)
                      ],
                    ),
            ),
          ),
        ),
        heightspace,
        InkWell(
          onTap: () {
            tabController!.animateTo(3);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: tabController!.index == 3 ? blackColor : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child: ResponsiveScreens.isTablet(context) ||
                      ResponsiveScreens.isTabletView(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/calendar.png',
                              ),
                              color: tabController!.index == 3
                                  ? primaryColor
                                  : sideMenuTextColor,
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.attandance,
                                size: 15,
                                color: tabController!.index == 3
                                    ? primaryColor
                                    : sideMenuTextColor)
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Image(
                          image: const AssetImage(
                            'assets/sidemenu/calendar.png',
                          ),
                          color: tabController!.index == 3
                              ? primaryColor
                              : sideMenuTextColor,
                        ),
                        widthspace,
                        SmallText(
                            text: MyStrings.attandance,
                            size: 15,
                            color: tabController!.index == 3
                                ? primaryColor
                                : sideMenuTextColor)
                      ],
                    ),
            ),
          ),
        ),
        heightspace,
        InkWell(
          onTap: () {
            tabController!.animateTo(4);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: tabController!.index == 4 ? blackColor : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child: ResponsiveScreens.isTablet(context) ||
                      ResponsiveScreens.isTabletView(context)
                  ? Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/sidemenu/calendar.png',
                              ),
                              color: tabController!.index == 4
                                  ? primaryColor
                                  : sideMenuTextColor,
                            ),
                            widthspace,
                            SmallText(
                                text: MyStrings.asset,
                                size: 15,
                                color: tabController!.index == 4
                                    ? primaryColor
                                    : sideMenuTextColor)
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Image(
                          image: const AssetImage(
                            'assets/sidemenu/calendar.png',
                          ),
                          color: tabController!.index == 4
                              ? primaryColor
                              : sideMenuTextColor,
                        ),
                        widthspace,
                        SmallText(
                            text: MyStrings.asset,
                            size: 15,
                            color: tabController!.index == 4
                                ? primaryColor
                                : sideMenuTextColor)
                      ],
                    ),
            ),
          ),
        ),
        heightspace,
        InkWell(
          onTap: () {
            tabController!.animateTo(5);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: tabController!.index == 5 ? blackColor : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child:ResponsiveScreens.isTablet(context) ||
                  ResponsiveScreens.isTabletView(context)
                  ? Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                children: [
                      Image(
                        image: const AssetImage(
                          'assets/sidemenu/calendar.png',
                        ),
                        color: tabController!.index == 5
                            ? primaryColor
                            : sideMenuTextColor,
                      ),
                      widthspace,
                      SmallText(
                          text: MyStrings.taskBoard,
                          size: 15,
                          color: tabController!.index == 5
                              ? primaryColor
                              : sideMenuTextColor)
                ],
              ),
                    ],
                  ): Row(
                children: [
                  Image(
                    image: const AssetImage(
                      'assets/sidemenu/calendar.png',
                    ),
                    color: tabController!.index == 5
                        ? primaryColor
                        : sideMenuTextColor,
                  ),
                  widthspace,
                  SmallText(
                      text: MyStrings.taskBoard,
                      size: 15,
                      color: tabController!.index == 5
                          ? primaryColor
                          : sideMenuTextColor)
                ],
              ),
            ),
          ),
        ),
        heightspace,
        InkWell(
          onTap: () {
            tabController!.animateTo(6);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: tabController!.index == 6 ? blackColor : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child:ResponsiveScreens.isTablet(context) ||
                  ResponsiveScreens.isTabletView(context)
                  ? Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                children: [
                      Image(
                        image: const AssetImage(
                          'assets/sidemenu/calendar.png',
                        ),
                        color: tabController!.index == 6
                            ? primaryColor
                            : sideMenuTextColor,
                      ),
                      widthspace,
                      SmallText(
                          text: MyStrings.reports,
                          size: 15,
                          color: tabController!.index == 6
                              ? primaryColor
                              : sideMenuTextColor)
                ],
              ),
                    ],
                  ):
              Row(
                children: [
                  Image(
                    image: const AssetImage(
                      'assets/sidemenu/calendar.png',
                    ),
                    color: tabController!.index == 6
                        ? primaryColor
                        : sideMenuTextColor,
                  ),
                  widthspace,
                  SmallText(
                      text: MyStrings.reports,
                      size: 15,
                      color: tabController!.index == 6
                          ? primaryColor
                          : sideMenuTextColor)
                ],
              ),
            ),
          ),
        ),
        heightspace,
        InkWell(
          onTap: () {
            tabController!.animateTo(7);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: tabController!.index == 7 ? blackColor : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child:ResponsiveScreens.isTablet(context) ||
                  ResponsiveScreens.isTabletView(context)
                  ? Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Column(
                      children: [
                      Image(
                        image: const AssetImage(
                          'assets/sidemenu/calendar.png',
                        ),
                        color: tabController!.index == 7
                            ? primaryColor
                            : sideMenuTextColor,
                      ),
                      widthspace,
                      SmallText(
                          text: MyStrings.hr,
                          size: 15,
                          color: tabController!.index == 7
                              ? primaryColor
                              : sideMenuTextColor)
                ],
              ),
                    ],
                  ): Row(
                children: [
                  Image(
                    image: const AssetImage(
                      'assets/sidemenu/calendar.png',
                    ),
                    color: tabController!.index == 7
                        ? primaryColor
                        : sideMenuTextColor,
                  ),
                  widthspace,
                  SmallText(
                      text: MyStrings.hr,
                      size: 15,
                      color: tabController!.index == 7
                          ? primaryColor
                          : sideMenuTextColor)
                ],
              ),
            ),
          ),
        ),

        heightspace,
        InkWell(
          onTap: () {
            tabController!.animateTo(8);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: tabController!.index == 8 ? blackColor : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child:ResponsiveScreens.isTablet(context) ||
                  ResponsiveScreens.isTabletView(context)
                  ? Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                children: [
                      Image(
                        image: const AssetImage(
                          'assets/sidemenu/calendar.png',
                        ),
                        color: tabController!.index == 8
                            ? primaryColor
                            : sideMenuTextColor,
                      ),
                      widthspace,
                      SmallText(
                          text: MyStrings.expense,
                          size: 15,
                          color: tabController!.index == 8
                              ? primaryColor
                              : sideMenuTextColor)
                ],
              ),
                    ],
                  ): Row(
                children: [
                  Image(
                    image: const AssetImage(
                      'assets/sidemenu/calendar.png',
                    ),
                    color: tabController!.index == 8
                        ? primaryColor
                        : sideMenuTextColor,
                  ),
                  widthspace,
                  SmallText(
                      text: MyStrings.expense,
                      size: 15,
                      color: tabController!.index == 8
                          ? primaryColor
                          : sideMenuTextColor)
                ],
              ),
            ),
          ),
        ),
        heightspace,
        InkWell(
          onTap: () {
            tabController!.animateTo(9);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: tabController!.index == 9 ? blackColor : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child:ResponsiveScreens.isTablet(context) ||
                  ResponsiveScreens.isTabletView(context)
                  ? Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                children: [
                      Image(
                        image: const AssetImage(
                          'assets/sidemenu/calendar.png',
                        ),
                        color: tabController!.index == 9
                            ? primaryColor
                            : sideMenuTextColor,
                      ),
                      widthspace,
                      SmallText(
                          text: MyStrings.finance,
                          size: 15,
                          color: tabController!.index == 9
                              ? primaryColor
                              : sideMenuTextColor)
                ],
              ),
                    ],
                  ): Row(
                children: [
                  Image(
                    image: const AssetImage(
                      'assets/sidemenu/calendar.png',
                    ),
                    color: tabController!.index == 9
                        ? primaryColor
                        : sideMenuTextColor,
                  ),
                  widthspace,
                  SmallText(
                      text: MyStrings.finance,
                      size: 15,
                      color: tabController!.index == 9
                          ? primaryColor
                          : sideMenuTextColor)
                ],
              ),
            ),
          ),
        ),
        heightspace,
        InkWell(
          onTap: () {
            tabController!.animateTo(10);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: tabController!.index == 10 ? blackColor : null,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child:ResponsiveScreens.isTablet(context) ||
                  ResponsiveScreens.isTabletView(context)
                  ? Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                children: [
                      Image(
                        image: const AssetImage(
                          'assets/sidemenu/calendar.png',
                        ),
                        color: tabController!.index == 10
                            ? primaryColor
                            : sideMenuTextColor,
                      ),
                      widthspace,
                      SmallText(
                          text: MyStrings.helpdesk,
                          size: 15,
                          color: tabController!.index == 10
                              ? primaryColor
                              : sideMenuTextColor)
                ],
              ),
                    ],
                  ): Row(
                children: [
                  Image(
                    image: const AssetImage(
                      'assets/sidemenu/calendar.png',
                    ),
                    color: tabController!.index == 10
                        ? primaryColor
                        : sideMenuTextColor,
                  ),
                  widthspace,
                  SmallText(
                      text: MyStrings.helpdesk,
                      size: 15,
                      color: tabController!.index == 10
                          ? primaryColor
                          : sideMenuTextColor)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
