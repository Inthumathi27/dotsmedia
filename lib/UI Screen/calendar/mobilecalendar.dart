
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import '../../utils/constant.dart';
import '../../utils/responsive.dart';
import '../../utils/smalltext.dart';
import 'bookcalendar.dart';
import 'calendardata.dart';

class mobileCalendar extends StatefulWidget {
  @override
  _mobileCalendarState createState() => _mobileCalendarState();
}

class _mobileCalendarState extends State<mobileCalendar> {
  final CalendarWeekController _controller = CalendarWeekController();

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: Container(
          height: 50.0,
          width: 50.0,
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type:
                      PageTransitionType.rightToLeft,
                      child:BookCalendar()));
              setState(() {});
            },
            child: Icon(Icons.add,size: 25,),
          ),
        ),
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor:sideMenuColor,
        //   title:Text(
        //     DateFormat.yMMMM().format(DateTime time),
        //     overflow: TextOverflow.ellipsis,
        //     textAlign: TextAlign.center,
        //     style:  TextStyle(
        //         color: Colors.white, fontWeight: FontWeight.w600),
        //   ),
        // ),
        body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                decoration: BoxDecoration(boxShadow: [
                  // BoxShadow(
                  //     color: Colors.black.withOpacity(0.2),
                  //     blurRadius: 10,
                  //     spreadRadius: 1)
                ]),
                child: CalendarWeek(
                  controller: _controller,
                  height: ResponsiveScreens.isMobile(context)
                      ? MediaQuery.of(context).size.width / 2.6
                      : ResponsiveScreens.isMobileView(context)
                          ? MediaQuery.of(context).size.width / 2.3
                          : ResponsiveScreens.isSmallMobileView(context)
                              ? MediaQuery.of(context).size.width / 2.2
                              : ResponsiveScreens.isLargeMobile(context)
                                  ? MediaQuery.of(context).size.width / 3
                                  : MediaQuery.of(context).size.width / 3.3,
                  showMonth: true,
                  minDate: DateTime.now().add(
                    Duration(days: -365),
                  ),
                  maxDate: DateTime.now().add(
                    Duration(days: 365),
                  ),
                  onDatePressed: (DateTime datetime) {
                    // Do something
                    setState(() {});
                  },
                  onDateLongPressed: (DateTime datetime) {
                    // Do something
                  },
                  onWeekChanged: () {
                    // Do something
                  },
                  monthViewBuilder: (DateTime time) => Container(
                      // margin: const EdgeInsets.symmetric(vertical: 4),
                      color: sideMenuColor,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: whiteColor,
                                  size: 20,
                                )),
                            Text(
                              DateFormat.yMMMM().format(time),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: whiteColor, fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                                    onTap: () {
                                      _controller.jumpToDate(DateTime.now());
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.calendar_month_outlined,
                                      color: whiteColor,
                                      size: 20,
                                    ))
                          ],
                        ),
                      )),
                  // decorations: [
                  //   DecorationItem(
                  //       decorationAlignment: FractionalOffset.bottomRight,
                  //       date: DateTime.now(),
                  //       decoration: Icon(
                  //         Icons.today,
                  //         color: sideMenuColor,
                  //       )),
                  //   DecorationItem(
                  //       date: DateTime.now().add(Duration(days: 5)),
                  //       decoration: const Text(
                  //         'Holiday',
                  //         style: TextStyle(
                  //           color: Colors.brown,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       )),
                  // ],
                )),
            heightspace,
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Expanded(
            //     child: SmallText(text:   '${_controller.selectedDate.day}/${_controller.selectedDate.month}/${_controller.selectedDate.year}',
            //     ),
            //   ),
            // ),
            Container(color: Color(0xffeaeaec),
              width: MediaQuery.of(context).size.width,
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    text: '${DateFormat.MMMEd().format(_controller.selectedDate)}',
                  ),
                  heightspace,
                  SmallText(text: "No Events",color: primaryColor,size: 15,),
                ],
              ),
            ),

            Container(color: Color(0xffeaeaec),
            width: MediaQuery.of(context).size.width,
              height: 3,
            )
          ]),
        ),
      );
}
