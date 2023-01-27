import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import '../../utils/constant.dart';
import '../../utils/responsive.dart';
import '../../utils/smalltext.dart';
import 'bookcalendar.dart';
import 'calendardata.dart';

class Event {
  String? time;
  String? eventName;
  String? guestName;
  String? shootingSpot;
  String? address;

  Event({
    this.time,
    this.eventName,
    this.guestName,
    this.shootingSpot,
    this.address,
  });
}

class mobileCalendar extends StatefulWidget {
  @override
  _mobileCalendarState createState() => _mobileCalendarState();
}

class _mobileCalendarState extends State<mobileCalendar> {
  final CalendarWeekController _controller = CalendarWeekController();

  List eventList = [
    Event(
        time: "4:00 Pm",
        eventName: "Ajith fans celebrated with fireworks",
        guestName: "Public Review",
        shootingSpot: "Outdoor",
        address: "Rohini Theatre, Koyambedu"
    ),
    Event(
        time: "6:00 Pm",
        eventName: "Red Giant to vacate Vijay's place ",
        guestName: "Person A",
        shootingSpot: "Indoor",
        address: "Velachery"),
    Event(
        time: "6:00 Pm",
        eventName: "Kasethan Kadavulada & Chilla Chilla",
        guestName: "Person B",
        shootingSpot: "Indoor",
        address: "Velachery"),
  ];

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
                  type: PageTransitionType.rightToLeft,
                  child: BookCalendar()));
          setState(() {});
        },
        child: Icon(
          Icons.add,
          size: 25,
        ),
      ),
    ),
    body: SingleChildScrollView(
      child: SafeArea(
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CalendarWeek(
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
          ),
          heightspace,
          Container(
            color: Color(0xffeaeaec),
            width: MediaQuery.of(context).size.width,
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  text: DateFormat.MMMEd().format(_controller.selectedDate),
                ),
                heightspace,
                SmallText(
                  text: "No Events",
                  color: primaryColor,
                  size: 15,
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xffeaeaec),
            width: MediaQuery.of(context).size.width,
            height: 3,
          ),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: eventList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5),
                      border:
                      Border.all(color: borderColor.withOpacity(0.5)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 7,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              )),
                          height: MediaQuery.of(context).size.height / 7.5, // height: 5,
                        ),
                        widthspace,
                        Row(
                          children: [
                            SmallText(
                              text: '${eventList[index].time} ',
                              size: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        widthspace,
                        Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: '${eventList[index].guestName}',
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SmallText(
                                    text: '${eventList[index].eventName}',
                                    maxline: 1,
                                    size: 13),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                        'assets/calendar/shootingspot.png',),

                                    ),
                                    SizedBox(width: 10,),
                                    SmallText(
                                        text: '${eventList[index].shootingSpot}',
                                        maxline: 1,
                                        size: 13),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,size: 18,color: textColor,),
                                    SmallText(text:' ${eventList[index].address}',size: 13,)
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xffeaeaec),
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  ),
                ],
              );
            },
          ),
        ]),
      ),
    ),
  );
}
