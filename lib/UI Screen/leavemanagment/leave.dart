
import 'dart:io';
import 'dart:math';
import 'package:demo_project/utils/button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../utils/constant.dart';
import '../../utils/smalltext.dart';
import '../../utils/strings.dart';
import 'leaveapplication.dart';

class Leavedata {
  String? month;
  String? date;
  String? reason;
  String? leaveType;
  String? status;

  Leavedata({
    this.month,
    this.date,
    this.reason,
    this.leaveType,
    this.status,
  });
}

enum leaveItem { itemOne, itemTwo }

class LeaveSummary extends StatefulWidget {
  const LeaveSummary({Key? key}) : super(key: key);

  @override
  State<LeaveSummary> createState() => _LeaveSummaryState();
}

class _LeaveSummaryState extends State<LeaveSummary> {
  final List<String> menuItem = [
    MyStrings.summary,
    MyStrings.holidayList,
    MyStrings.history,
    MyStrings.policy,
  ];
  final List<String> ApplyItem = [
    MyStrings.applyLeave,
    MyStrings.applySwipe,
    MyStrings.shiftChange,
  ];
  List leaveHistory = [
    Leavedata(
        month: "September",
        date: "28",
        reason: "Moving to native",
        leaveType: "CL",
        status: "Pending"),
    Leavedata(
        month: "November",
        date: "2-5",
        reason: "Not Felling Well",
        leaveType: "SL",
        status: "Approved"),
    Leavedata(
        month: "December",
        date: "15",
        reason: "I am going out",
        leaveType: "PM",
        status: "Approved"),
    Leavedata(
        month: "December",
        date: "25-27",
        reason: "I am going to trip to Goa with my family and friends",
        leaveType: "CL",
        status: "Rejected"),
    Leavedata(
        month: "December",
        date: "25-27",
        reason: "I am working in villupuram branch",
        leaveType: "OD",
        status: "Pending"),
    Leavedata(
        month: "October",
        date: "12",
        reason: "Comp off used",
        leaveType: "Com Off",
        status: "Approved"),
  ];


  final int _counter = 0;
  String? _selectedMenu;
  String? _selectedApply;
  String state = 'Animation start';
  String? _chosenValue;
  String? _chosenday;
  List<dynamic> imageList = [];
  String radioButtonItem = 'One day';
  int id = 1;
  List<bool>? isSelected;
  List<bool>? isSelected1;
  String? difficulty;
  String? _chosenMode;
  String? type;
  String? exshift;
  String? newshift;
  TextEditingController _txtTimeController = TextEditingController();
  leaveItem? selectedMenu;


  final MaskTextInputFormatter timeMaskFormatter =
      MaskTextInputFormatter(mask: '##:##', filter: {"#": RegExp(r'[0-9]')});

  bool isloading = false;
  String? holidayData = "";

  void initState() {
    super.initState();
    initUser();
    var formatter = DateFormat('dd/MM/yyyy');
    String formatted = formatter.format(selectedDate);
    enddate?.value = TextEditingValue(text: formatted.toString());
    swipedate?.value = TextEditingValue(text: formatted.toString());
    fromdate?.value = TextEditingValue(text: formatted.toString());
    enddate?.value = TextEditingValue(text: formatted.toString());
  }

  void initUser() {
    fromdate = TextEditingController();
    enddate = TextEditingController();
    swipedate = TextEditingController();
  }



  @override
  Widget build(BuildContext context,) {
    var different = selectedendDate.difference(selectedDate).inDays + 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: SmallText(
          text: MyStrings.leaveManagement,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0, right: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: LeaveApplication()));
              },
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightspace,
            heightspace,
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 42,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton<String>(
                      value: _selectedApply,
                      onChanged: (value) {
                        setState(() {
                          _selectedMenu = null;
                          _selectedApply = value;
                          print(_selectedApply);
                        });
                      },
                      hint: Center(
                          child: SmallText(
                        text: "Apply",
                        color: whiteColor,
                      )),
                      underline: Container(),
                      isExpanded: true,
                      iconEnabledColor: whiteColor,
                      items: ApplyItem.map((Value) => DropdownMenuItem(
                            value: Value,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: SmallText(
                                text: Value,
                                size: 15,
                              ),
                            ),
                          )).toList(),
                      selectedItemBuilder: (BuildContext context) =>
                          ApplyItem.map((Value) => Center(
                                child: SmallText(
                                  text: Value,
                                  color: whiteColor,
                                  fontWeight: FontWeight.w500,
                                  size: 15,
                                ),
                              )).toList(),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: 42,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton<String>(
                      value: _selectedMenu,
                      onChanged: (data) {
                        setState(() {
                          _selectedApply = null;
                          _selectedMenu = data;
                          print(_selectedMenu);
                        });
                      },
                      hint: Center(
                          child: SmallText(
                        text: "Others",
                        color: whiteColor,
                      )),
                      underline: Container(),
                      isExpanded: true,
                      iconEnabledColor: whiteColor,
                      items: menuItem
                          .map((Data) => DropdownMenuItem(
                                value: Data,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: SmallText(
                                    text: Data,
                                    size: 16,
                                  ),
                                ),
                              ))
                          .toList(),
                      selectedItemBuilder: (BuildContext context) => menuItem
                          .map((Data) => Center(
                                child: SmallText(
                                  text: Data,
                                  color: whiteColor,
                                  fontWeight: FontWeight.w500,
                                  size: 16,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            heightspace,
            heightspace,
            _selectedMenu == MyStrings.history ||
                    _selectedMenu == MyStrings.policy ||
                    _selectedApply == MyStrings.leave ||
                    _selectedApply == MyStrings.applySwipe ||
                    _selectedApply == MyStrings.shiftChange
                ? const SizedBox(
                    height: 8,
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SmallText(
                                text: _selectedMenu == MyStrings.holidayList
                                    ? MyStrings.holidayList
                                    : MyStrings.leaveSummary,
                                fontWeight: FontWeight.w400,
                                size: 15,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            _selectedMenu == MyStrings.policy
                                ? SizedBox()
                                : SmallText(
                                    text: DateFormat("(yyyy)")
                                        .format(DateTime.now()),
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                          ],
                        ),
                        _selectedMenu == MyStrings.holidayList ||
                                _selectedMenu == MyStrings.policy
                            ? SizedBox()
                            : InkWell(
                                onTap: () {
                                  // );
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.segment),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('Filter')
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
            _selectedMenu == MyStrings.holidayList
                ? Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 10, 15),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: SmallText(
                                    text: "Date",
                                    size: 15,
                                    color: blueGreyColor,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: SmallText(
                                    text: "Day",
                                    size: 15,
                                    color: blueGreyColor,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: SmallText(
                                    text: "Remarks",
                                    size: 15,
                                    color: blueGreyColor,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : _selectedMenu == MyStrings.history
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: whiteColor),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 28.0,
                                          lineWidth: 3.5,
                                          animation: true,
                                          percent: .6,
                                          animationDuration: 1500,
                                          animateFromLastPercent: true,
                                          center: Image.asset(
                                            'assets/leavemanagment/casualleave.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          // footer: Text(
                                          //   state,
                                          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                          // ),
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: casualLeaveBorder,
                                          onAnimationEnd: () =>
                                              setState(() => state = ''),
                                        ),
                                        widthspace,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SmallText(
                                              text: "18 days",
                                              size: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            SmallText(
                                              text: "Casual Leave",
                                              size: 15,
                                              color: containerTextGreyColor
                                                  .withOpacity(0.7),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 28.0,
                                          lineWidth: 3.5,
                                          animation: true,
                                          percent: .7,
                                          animationDuration: 1500,
                                          animateFromLastPercent: true,
                                          center: Image.asset(
                                            'assets/leavemanagment/sickleave.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                          // footer: Text(
                                          //   state,
                                          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                          // ),
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor: sickLeaveBorder,
                                          onAnimationEnd: () =>
                                              setState(() => state = ''),
                                        ),
                                        widthspace,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SmallText(
                                              text: "8 days",
                                              size: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            SmallText(
                                              text: "Sick Leave",
                                              size: 15,
                                              color: containerTextGreyColor
                                                  .withOpacity(0.7),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            heightspace,
                            heightspace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmallText(
                                  text: "Leave Requests".toUpperCase(),
                                  size: 14,
                                ),
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return FractionallySizedBox(
                                          heightFactor: 0.3,
                                          child: showBottomModal(),
                                        );
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(Icons.segment),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('Filter')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: leaveHistory.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color:
                                                  borderColor.withOpacity(0.5)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SmallText(
                                                        text:
                                                            '${leaveHistory[index].date} ${leaveHistory[index].month[0]}${leaveHistory[index].month[1]}${leaveHistory[index].month[2]} ',
                                                        size: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      widthspace,
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: leaveHistory[index]
                                                                            .leaveType ==
                                                                        "PM"
                                                                    ? Color(
                                                                        0xffe1fff3)
                                                                    : leaveHistory[index].leaveType ==
                                                                            "SL"
                                                                        ? const Color(
                                                                            0xffffeaf6)
                                                                        : leaveHistory[index].leaveType ==
                                                                                "OD"
                                                                            ? const Color(0xfffff9e8)
                                                                            : leaveHistory[index].leaveType == "Com Off"
                                                                                ? const Color(0xfffff5f1)
                                                                                : Color(0xffdffaff)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: SmallText(
                                                            text: leaveHistory[
                                                                    index]
                                                                .leaveType,
                                                            color: leaveHistory[index]
                                                                        .leaveType ==
                                                                    "OD"
                                                                ? const Color(
                                                                    0xffd39c06)
                                                                : leaveHistory[index]
                                                                            .leaveType ==
                                                                        "CL"
                                                                    ? const Color(
                                                                        0xff33b5ce)
                                                                    : leaveHistory[index].leaveType ==
                                                                            "SL"
                                                                        ? const Color(
                                                                            0xffc988ad)
                                                                        : leaveHistory[index].leaveType ==
                                                                                "PM"
                                                                            ? const Color(0xff3cc68f)
                                                                            : leaveHistory[index].leaveType == "Com Off"
                                                                                ? const Color(0xffff8659)
                                                                                : blueGreyColor,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            size: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  PopupMenuButton<leaveItem>(
                                                    icon:
                                                        Icon(Icons.more_horiz),
                                                    iconSize: 18,
                                                    initialValue: selectedMenu,
                                                    // Callback that sets the selected popup menu item.
                                                    onSelected:
                                                        (leaveItem item) {
                                                      setState(() {
                                                        selectedMenu = item;
                                                      });
                                                    },
                                                    itemBuilder: (BuildContext
                                                            context) =>
                                                        <
                                                            PopupMenuEntry<
                                                                leaveItem>>[
                                                      PopupMenuItem<leaveItem>(
                                                        value:
                                                            leaveItem.itemOne,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.edit,
                                                              color:
                                                                  blueGreyColor,
                                                            ),
                                                            widthspace,
                                                            SmallText(
                                                                text: MyStrings
                                                                    .edit),
                                                          ],
                                                        ),
                                                      ),
                                                      PopupMenuItem<leaveItem>(
                                                        value:
                                                            leaveItem.itemOne,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.delete,
                                                              color:
                                                                  blueGreyColor,
                                                            ),
                                                            widthspace,
                                                            SmallText(
                                                                text: MyStrings
                                                                    .delete),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.6,
                                                    child: SmallText(
                                                      text: leaveHistory[index]
                                                          .reason,
                                                      size: 13,
                                                      color: drawerTextColor,
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4.6,
                                                    // decoration: BoxDecoration(
                                                    //     borderRadius:
                                                    //         BorderRadius.circular(5),
                                                    //     color: leaveHistory[index].status ==
                                                    //             "Approved"
                                                    //         ? const Color(0xffdff8ee)
                                                    //         : leaveHistory[index].status ==
                                                    //                 "Rejected"
                                                    //             ? const Color(0xfffcdfe1)
                                                    //             : const Color(0xfffff5e6)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                              'assets/leavemanagment/timer.png',
                                                              width: 12,
                                                              height: 12,
                                                              color: leaveHistory[
                                                                              index]
                                                                          .status ==
                                                                      "Approved"
                                                                  ? blueGreyColor
                                                                  // const Color(0xff569b5f)
                                                                  : leaveHistory[index]
                                                                              .status ==
                                                                          "Rejected"
                                                                      ? const Color(
                                                                          0xffff3d49)
                                                                      : const Color(
                                                                          0xfffe9502)),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          SmallText(
                                                            text: leaveHistory[
                                                                    index]
                                                                .status,
                                                            textAlign:
                                                                TextAlign.end,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: leaveHistory[
                                                                            index]
                                                                        .status ==
                                                                    "Approved"
                                                                ? blueGreyColor
                                                                // const Color(0xff569b5f)
                                                                : leaveHistory[index]
                                                                            .status ==
                                                                        "Rejected"
                                                                    ? const Color(
                                                                        0xffff3d49)
                                                                    : const Color(
                                                                        0xfffe9502),
                                                            size: 12,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    : _selectedMenu == MyStrings.policy
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: "Guidelines and Overview",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data: "<ol>"
                                      "<li>Any kind of leave can be granted or refused depending upon the business demands. Leave or absence from work without proper approval will call for disciplinary action.</li>"
                                      "<li>The calendar year for leave is from January to December.</li>"
                                      "<li>All leave records of the employees shall be maintained in the Human Resources Department.</li>"
                                      "<li>All leaves should be applied (clearly with the reason) to the Reporting Manager before proceeding on leave. In case of an emergency when leave cannot be applied in advance, telephonic intimation to the immediate reporting manager should be done and it must be applied on the immediate day of reporting to work.</li>"
                                      "<li>Leaves will be credited to the employee’s account at the beginning of every month. Employees may apply for leave depending upon their need and the leave balance available to their credit.</li>"
                                      "<li>Every confirmed employee is entitled with one day of SL and one day of CL every month.</li>"
                                      "<li>Employees on probation can avail of one-day Sick leave every month.</li>"
                                      "<li>Un-availed SL will lapse in December and un-availed CL will be carried forward to the next calendar year.</li>"
                                      "<li>Maximum 2 days of leaves can be taken in a month.</li>"
                                      "<li>Sunday will be considered as LOP for employees taking leave on Saturday & Monday.</li>"
                                      "<li>Saturday & Sunday will be considered as Leave/LOP for employees taking leave on Friday and Monday.</li>"
                                      "<li>On the day of reporting to work after 3 consecutive days due to sickness, medical documents need to be produced to the HR Department on the day to resume duty.</li>"
                                      "<li>If you fail to report to work within the sanctioned leave days, it will be considered that you are no longer interested in continuing your services with the company and that you have left the employment on your own without giving notice.</li>"
                                      "<li>If you fail to report to work within the sanctioned leave days, it will be considered that you are no longer interested in continuing your services with the company and that you have left the employment on your own without giving notice. </li>"
                                      "</ol>",
                                  style: {
                                    'body': Style(),
                                    'li': Style(
                                        margin: EdgeInsets.only(bottom: 20),
                                        lineHeight: LineHeight.number(1.2),
                                        padding: EdgeInsets.only(top: 2),
                                        textAlign: TextAlign.justify),
                                    // 'ol':Style(padding: EdgeInsets.only(top: 20)),
                                  },
                                ),
                                heightspace,
                                SmallText(
                                  text: "Permissions",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data:
                                      "Due to emergency reasons/unavoidable circumstances, any employee who wishes to avail the permission could follow the below said protocols."
                                      "<ol>"
                                      "<li>Any kind of leave can be granted or refused depending upon the business demands. Leave or absence from work without proper approval will call for disciplinary action.</li>"
                                      "<li>If you fail to report to work within the sanctioned leave days, it will be considered that you are no longer interested in continuing your services with the company and that you have left the employment on your own without giving notice. </li>"
                                      "</ol>",
                                  style: {
                                    'body': Style(
                                        textAlign: TextAlign.justify,
                                        lineHeight: LineHeight.number(1.2)),
                                    'li': Style(
                                        margin: EdgeInsets.only(bottom: 20),
                                        lineHeight: LineHeight.number(1.2),
                                        padding: EdgeInsets.only(top: 2),
                                        textAlign: TextAlign.justify),
                                    'ol': Style(
                                        padding: EdgeInsets.only(top: 20)),
                                  },
                                ),
                                heightspace,
                                SmallText(
                                  text: "Marriage Leave",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data:
                                      "10 days (including weekends) of leave can be availed. This will be not adjusted in their CL/SL.",
                                  style: {
                                    'body': Style(
                                        textAlign: TextAlign.justify,
                                        lineHeight: LineHeight.number(1.2)),
                                  },
                                ),
                                heightspace,
                                SmallText(
                                  text: "Bereavement  Leave",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data:
                                      "Bereavementnt leaves shall be applicable only for the loss of blood relations -the first level of relations – parents, spouse, brother, sister, and children. This can be availed for up to 3 to 5 days maximum (including weekends). These leaves will be not adjusted in their CL/SL.",
                                  style: {
                                    'body': Style(
                                        textAlign: TextAlign.justify,
                                        lineHeight: LineHeight.number(1.2)),
                                  },
                                ),
                                heightspace,
                                SmallText(
                                  text: "Casual Leaves",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data: "<ol class='adf'>"
                                      "<li><span>ELIGIBILITY</span><p>Employees joined on or before 15th of the month, shall gain one CL for the month.</p></li>"
                                      "<li>ENTITLEMENT<p>Casual Leave shall be credited to the employee’s account at the beginning of the month.</p></li>"
                                      "<li>ACCUMULATION<p>You can accumulate/carry forward your Casual leaves up to a maximum value of 15 only.</p></li>"
                                      "<li>ENCASHMENT<p>Un-availed Casual leaves can be carry forwarded to the next year. It can be encashed or adjusted against notice pay at the time of separation. This will be on the discretion of your Reporting manager.</p></li>"
                                      "<li>PROCESS<ul><li class = 'i'>Employee can request for Casual Leave for personal matters. These would be granted at the discretion of the Reporting Manager. The employee is required to apply for Casual Leave in advance.</li>"
                                      "<li class = 'i'>Employee has to apply for the Casual Leave and get the leave approval from the respective Reporting Manager prior to availing the same.</li>"
                                      "<li class = 'i'>In case of leave above 3 days, the employee has to get approval 2 weeks prior to availing the same.</li>"
                                      "<li class = 'i'>Mode of communication to pass any information – The respective employee should directly call and inform only their Reporting Manager about permissions / leaves or any other exigencies and for not attending work. Any other mode of communication (WhatsApp or SMS) will be considered as ABSENCE FROM WORK.</li>"
                                      "<li class = 'i'>In case of exigencies where he/she shall submit the leave approval request to the Reporting Manager within 48 hours of resuming duty.</li>"
                                      "</ul></li>"
                                      "</ol>",
                                  style: {
                                    'li': Style(
                                        margin: EdgeInsets.only(bottom: 20),
                                        lineHeight: LineHeight.number(1.2),
                                        padding: EdgeInsets.only(top: 2),
                                        textAlign: TextAlign.justify,
                                        color: blueGreyColor,
                                        fontWeight: FontWeight.w500),
                                    'li.i': Style(
                                        lineHeight: LineHeight.number(1.2),
                                        textAlign: TextAlign.justify,
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'p': Style(
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                  },
                                ),
                                heightspace,
                                SmallText(
                                  text: "Sick Leaves",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data: "<ol>"
                                      "<li>ELIGIBILITY<p>All Probationary/Permanent employees at AnnexMed Pvt Ltd are eligible for Sick Leave.</p></li>"
                                      "<li>ENTITLEMENT<ul>"
                                      "<li class = 'i'>Sick Leave shall be credited to the employee’s account at the beginning of the month.</li>"
                                      "<li class = 'i'>Sick Leave shall be credited to the employee’s account at the beginning of the month.</li></ul></li>"
                                      "<li>ACCUMULATION<p>Un-availed Sick leaves will lapse at the end of the calendar year.</p></li>"
                                      "<li>ENCASHMENT<p>Sick leaves cannot be encashed or adjusted against notice pay at the time of separation.</p></li>"
                                      "<li>PROCESS<ul><li class = 'i'>Sick leave is to be taken in cases of injury/illness to the employee.</li>"
                                      "<li class = 'i'>Employee has to apply for the Casual Leave and get the leave approval from the respective Reporting Manager prior to availing the same.</li>"
                                      "<li class = 'i'>Mode of communication to pass any information - The respective employee should directly call and inform only their Reporting Manager about permissions/leaves or any other exigencies and for not attending work. Any other mode of communication (WhatsApp or SMS) will be considered as ABSENCE FROM WORK.</li>"
                                      "<li class = 'i'>3 or more days of Sick Leave will require a medical certificate from a qualified and registered medical practitioner. Notwithstanding such a certificate, the company can in its sole discretion consider the same as a loss of pay.</li>"
                                      "<li class = 'i'>Exceptional cases of injury/illness of a serious nature will be viewed on a case-to-case basis. These however need to be communicated in writing, for getting the necessary approval from the Reporting Manager. Clubbing of sick leaves with the other leaves in such cases will be at the discretion of the Manager in consultation with HR.</li>"
                                      "</ul></li>"
                                      "</ol>",
                                  style: {
                                    // 'body':Style(textAlign: TextAlign.justify,lineHeight: LineHeight.number(1.2)),
                                    'li': Style(
                                        margin: EdgeInsets.only(bottom: 20),
                                        lineHeight: LineHeight.number(1.2),
                                        padding: EdgeInsets.only(top: 2),
                                        textAlign: TextAlign.justify,
                                        color: blueGreyColor,
                                        fontWeight: FontWeight.w500),
                                    'li.i': Style(
                                        lineHeight: LineHeight.number(1.2),
                                        textAlign: TextAlign.justify,
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'p': Style(
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                  },
                                ),
                                heightspace,
                                SmallText(
                                  text: "Maternity Leave (MTL)",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data: "<ol>"
                                      "<li>ELIGIBILITY"
                                      "<ul>"
                                      "<li class = 'i'>Eligibility of Maternity leave, varies from case to case.</li>"
                                      "<li class = 'i'>Maternity leave is a statutory leave.</li>"
                                      "<li class = 'i'>Women Employees covered under ESI will be eligible for Maternity benefits for 6 months as per Maternity ACT.</li>"
                                      "<li class = 'i'>Women Employees not covered under ESI and who completed 24 months of continuous service with the company will be eligible for 90 days of Maternity leave.</li>"
                                      "<li class = 'i'>If you are on probation, you are entitled to avail of maternity leave, provided the above condition is fulfilled.</li>"
                                      "</ul></li>"
                                      "<li>ENTITLEMENT<ul>"
                                      "<li class = 'i'>Maternity leave is restricted to two live births during the service with the company.</li>"
                                      "<li class = 'i'>Women employees who have worked for a minimum period of 24 months prior to the delivery shall be entitled to Maternity Leave of up to 90 days in case of delivery, 30 days in case of miscarriage, from the date of miscarriage.</li>"
                                      "<li class = 'i'>This leave shall not be extended beyond a period of 1 month, without a certificate from a Qualified Medical Practitioner and approval of the Human Resources.</li>"
                                      "<li class = 'i'>All leave/s beyond the statutory limit of 90 days will be charged to Casual Leave.</li>"
                                      "<li class = 'i'>Maternity Leave can be clubbed with Casual and Sick Leave.</li>"
                                      "</ul></li>"
                                      "<li>PROCESS<ul><li class = 'i'>Apply for Maternity Leave 4 weeks before you go on leave.</li>"
                                      "<li class = 'i'>Apply for Maternity Leave 4 weeks before you go on leave.</li>"
                                      "</ul></li>"
                                      "</ol>",
                                  style: {
                                    // 'body':Style(textAlign: TextAlign.justify,lineHeight: LineHeight.number(1.2)),
                                    'li': Style(
                                        margin: EdgeInsets.only(bottom: 20),
                                        lineHeight: LineHeight.number(1.2),
                                        padding: EdgeInsets.only(top: 2),
                                        textAlign: TextAlign.justify,
                                        color: blueGreyColor,
                                        fontWeight: FontWeight.w500),
                                    'li.i': Style(
                                        lineHeight: LineHeight.number(1.2),
                                        textAlign: TextAlign.justify,
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'p': Style(
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'ol': Style(
                                        color: Colors.red,
                                        fontWeight: FontWeight.normal),
                                  },
                                ),
                                heightspace,
                                SmallText(
                                  text: "Paternity Leave (PTL)",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data: "<ol>"
                                      "<li>ELIGIBILITY"
                                      "<ul>"
                                      "<li class = 'i'>Permanent Employees can avail of paternity leave of 3 working days after the birth of the child.</li>"
                                      "<li class = 'i'>Any leaves availed beyond 3 working days are subject to the approval of the reporting authority or HR Dept.</li>"
                                      "<li class = 'i'>Employees under probation are not eligible for Paternity Leave.</li>"
                                      "</ul></li>"
                                      "<li>ENTITLEMENT<ul>"
                                      "<li class = 'i'>Paternity leave is restricted to two live births during the service with the company.</li>"
                                      "<li class = 'i'>Paternity leave is restricted to two live births during the service with the company.</li>"
                                      "</ul></li>"
                                      "<li>PROCESS<ul><li class = 'i'>Apply for Paternity Leave a week before you go on leave. </li>"
                                      "<li class = 'i'>Get the approval from your Reporting Manager in the mail copying the HR Department.</li>"
                                      "</ul></li>"
                                      "</ol>",
                                  style: {
                                    // 'body':Style(textAlign: TextAlign.justify,lineHeight: LineHeight.number(1.2)),
                                    'li': Style(
                                        margin: EdgeInsets.only(bottom: 20),
                                        lineHeight: LineHeight.number(1.2),
                                        padding: EdgeInsets.only(top: 2),
                                        textAlign: TextAlign.justify,
                                        color: blueGreyColor,
                                        fontWeight: FontWeight.w500),
                                    'li.i': Style(
                                        lineHeight: LineHeight.number(1.2),
                                        textAlign: TextAlign.justify,
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'p': Style(
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'ol': Style(
                                        color: Colors.red,
                                        fontWeight: FontWeight.normal),
                                  },
                                ),
                                heightspace,
                                SmallText(
                                  text: "Marriage Leave (MRL)",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data: "<ol>"
                                      "<li>ELIGIBILITY"
                                      "<ul>"
                                      "<li class = 'i'>Permanent Employees can avail of Marriage Leaves.</li>"
                                      "<li class = 'i'>As a gesture of sharing a happy moment in our employee's family, AnnexMed grants 10 calendar days as marriage Leave (including Saturday and Sunday)</li>"
                                      "<li class = 'i'>Any leaves availed beyond 10 working days are subject to the approval of the reporting authority or HR Dept.</li>"
                                      "<li class = 'i'>Availed leaves of more than 10 days (including weekends) will not be approved and paid.</li>"
                                      "<li class = 'i'>Employees under probation are not eligible for Marriage Leave.</li>"
                                      "</ul></li>"
                                      "<li>ENTITLEMENT<ul>"
                                      "<li class = 'i'>Marriage leaves are restricted to one marriage during the service with the company.</li>"
                                      "<li class = 'i'>Marriage Leaves can be clubbed with Casual Leaves.</li>"
                                      "</ul></li>"
                                      "<li>PROCESS<ul><li class = 'i'>Apply for Marriage Leave 4 weeks before you go on leave.</li>"
                                      "<li class = 'i'>Get the approval from your Reporting Manager in the mail copying the HR Department.</li>"
                                      "</ul></li>"
                                      "</ol>",
                                  style: {
                                    // 'body':Style(textAlign: TextAlign.justify,lineHeight: LineHeight.number(1.2)),
                                    'li': Style(
                                        margin: EdgeInsets.only(bottom: 20),
                                        lineHeight: LineHeight.number(1.2),
                                        padding: EdgeInsets.only(top: 2),
                                        textAlign: TextAlign.justify,
                                        color: blueGreyColor,
                                        fontWeight: FontWeight.w500),
                                    'li.i': Style(
                                        lineHeight: LineHeight.number(1.2),
                                        textAlign: TextAlign.justify,
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'p': Style(
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'ol': Style(
                                        color: Colors.red,
                                        fontWeight: FontWeight.normal),
                                  },
                                ),
                                heightspace,
                                SmallText(
                                  text: "Bereavement Leave (BL)",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data: "<ol>"
                                      "<li>ELIGIBILITY"
                                      "<ul>"
                                      "<li class = 'i'>All Employees are entitled to avail of Bereavement Leaves.</li>"
                                      "<li class = 'i'>Employees under probation  - Employees under probation are eligible for this Leave of upto 2 days. This leave shall not be adjusted with their SL. And, this should not be clubbed with the SL.</li>"
                                      "</ul></li>"
                                      "<li>ENTITLEMENT<ul>"
                                      "<li class = 'i'>Any employee's first-level relation on their unfortunate event will be entitled to Bereavement leave for 7 days. (including weekends) (First Level Relation - Spouse, children, father, mother, brother, sister, If the request is more than 7 days (including weekends), it is subject to the approval of the reporting authority and HR).</li>"
                                      "<li class = 'i'>Bereavement Leaves cannot be clubbed with Casual Leaves.</li>"
                                      "</ul></li>"
                                      "<li>PROCESS<ul><li class = 'i'>Mode of communication - The respective employee should directly call and inform only their Reporting Manager of these leaves. Any other mode of communication (WhatsApp or SMS) will be considered as ABSENCE FROM WORK.</li>"
                                      "<li class = 'i'>Apply for Bereavement Leave as soon as you resume your work.</li>"
                                      "<li class = 'i'>Get approval from your Reporting Manager by mail copying the HR Department.</li>"
                                      "</ul></li>"
                                      "</ol>",
                                  style: {
                                    // 'body':Style(textAlign: TextAlign.justify,lineHeight: LineHeight.number(1.2)),
                                    'li': Style(
                                        margin: EdgeInsets.only(bottom: 20),
                                        lineHeight: LineHeight.number(1.2),
                                        padding: EdgeInsets.only(top: 2),
                                        textAlign: TextAlign.justify,
                                        color: blueGreyColor,
                                        fontWeight: FontWeight.w500),
                                    'li.i': Style(
                                        lineHeight: LineHeight.number(1.2),
                                        textAlign: TextAlign.justify,
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'p': Style(
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'ol': Style(
                                        color: Colors.red,
                                        fontWeight: FontWeight.normal),
                                  },
                                ),
                                heightspace,
                                SmallText(
                                  text: "Medical Leave (ML)",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data: "<ol>"
                                      "<li>ELIGIBILITY"
                                      "<ul>"
                                      "<li class = 'i'>Permanent Employees can avail of Medical Leaves.</li>"
                                      "<li class = 'i'>Employees under probation are not eligible for this Leave.</li>"
                                      "<li class = 'i'>Employees can avail of medical leave on critical medical conditions like surgery, accident or any other medical leave.</li>"
                                      "</ul></li>"
                                      "<li>ENTITLEMENT<ul>"
                                      "<li class = 'i'>Maximum of 7 working days (including weekend) availed will be paid. </li>"
                                      "<li class = 'i'>Anything beyond the 7 working days will be adjusted in your existing CL or SL and the rest will be considered as LOP.</li>"
                                      "<li class = 'i'>Medical Leaves can be clubbed with Sick Leaves.</li>"
                                      "</ul></li>"
                                      "<li>PROCESS<ul><li class = 'i'>Mode of communication - The respective employee should directly call and inform only their Reporting Manager of these leaves. Any other mode of communication (WhatsApp or SMS) will be considered as ABSENCE FROM WORK.</li>"
                                      "<li class = 'i'>Apply for Medical Leave as soon as you resume your work.</li>"
                                      "<li class = 'i'>Proper medical reports and medical fitness certificate is required to be submitted by the employee.</li>"
                                      "<li class = 'i'>Get the approval from your Reporting Manager by mail copying the HR Department</li>"
                                      "</ul></li>"
                                      "</ol>",
                                  style: {
                                    // 'body':Style(textAlign: TextAlign.justify,lineHeight: LineHeight.number(1.2)),
                                    'li': Style(
                                        margin: EdgeInsets.only(bottom: 20),
                                        lineHeight: LineHeight.number(1.2),
                                        padding: EdgeInsets.only(top: 2),
                                        textAlign: TextAlign.justify,
                                        color: blueGreyColor,
                                        fontWeight: FontWeight.w500),
                                    'li.i': Style(
                                        lineHeight: LineHeight.number(1.2),
                                        textAlign: TextAlign.justify,
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'p': Style(
                                        color: blackColor,
                                        fontWeight: FontWeight.normal),
                                    'ol': Style(
                                        color: Colors.red,
                                        fontWeight: FontWeight.normal),
                                  },
                                ),
                                heightspace,
                                SmallText(
                                  text: "Non-Compliance and Consequence",
                                  fontWeight: FontWeight.w600,
                                ),
                                Html(
                                  data:
                                      "Non-compliance or frequent inconsistencies in adherence to this policy will lead to disciplinary action or legal proceedings by AnnexMed depending upon the type and severity of the violation.",
                                  style: {
                                    'body': Style(
                                        lineHeight: LineHeight.number(1.2),
                                        textAlign: TextAlign.justify),
                                    // 'li':Style(margin: EdgeInsets.only(bottom: 20),lineHeight: LineHeight.number(1.2),padding: EdgeInsets.only(top: 2),textAlign: TextAlign.justify),
                                    // 'ol':Style(padding: EdgeInsets.only(top: 20)),
                                  },
                                ),
                              ],
                            ),
                          )
                        : _selectedApply == MyStrings.applyLeave
                            ? Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    color: whiteColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        18, 25, 18, 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                            child: SmallText(
                                          text: MyStrings.requestLeave,
                                          size: 18,
                                          fontWeight: FontWeight.w600,
                                        )),
                                        heightspace,
                                        heightspace,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SmallText(
                                              text: 'Today\'s date',
                                              color: textGreyColor,
                                              size: 16,
                                            ),
                                            SmallText(
                                              text: DateFormat("dd/MM/yyyy")
                                                  .format(DateTime.now()),
                                              size: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                        heightspace,
                                        heightspace,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SmallText(
                                              text: MyStrings.leaveType,
                                              color: drawerTextColor,
                                              size: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.5,
                                              height: 35.0,
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1.0,
                                                      color: borderColor),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                ),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: ButtonTheme(
                                                  alignedDropdown: true,
                                                  child: DropdownButton<String>(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    value: _chosenValue,
                                                    underline: SizedBox(),
                                                    isExpanded: true,
                                                    items: <String>[
                                                      MyStrings.casualLeave,
                                                      MyStrings.sickLeave,
                                                      MyStrings.compOff,
                                                      MyStrings.marriageLeave,
                                                      MyStrings.maternityLeave,
                                                      MyStrings.paternityLeave,
                                                      MyStrings.medicalLeave,
                                                      MyStrings.bereavementLeave
                                                    ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: SmallText(
                                                            text: value),
                                                      );
                                                    }).toList(),
                                                    // hint: SmallText(
                                                    //   text: MyStrings.leaveType,
                                                    //   color: drawerTextColor,
                                                    //   size: 16,
                                                    //   fontWeight: FontWeight.w400,
                                                    // ),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        _chosenValue = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        heightspace,
                                        heightspace,
                                        _chosenValue ==
                                                    MyStrings.marriageLeave ||
                                                _chosenValue ==
                                                    MyStrings.maternityLeave
                                            ? SizedBox()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SmallText(
                                                    text: "Apply for",
                                                    color: drawerTextColor,
                                                    size: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    height: 35.0,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    decoration: ShapeDecoration(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            width: 1.0,
                                                            color: borderColor),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    5.0)),
                                                      ),
                                                    ),
                                                    child:
                                                        DropdownButtonHideUnderline(
                                                      child: ButtonTheme(
                                                        alignedDropdown: true,
                                                        child: DropdownButton<
                                                            String>(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          value: _chosenday,
                                                          underline: SizedBox(),
                                                          isExpanded: true,

                                                          items: <String>[
                                                            "Single day",
                                                            "Multiple day",
                                                            "First Half",
                                                            "Second Half"
                                                          ].map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              value) {
                                                            return DropdownMenuItem<
                                                                String>(
                                                              value: value,
                                                              child: SmallText(
                                                                  text: value),
                                                            );
                                                          }).toList(),
                                                          // hint: SmallText(
                                                          //   text: MyStrings.leaveType,
                                                          //   color: drawerTextColor,
                                                          //   size: 16,
                                                          //   fontWeight: FontWeight.w400,
                                                          // ),
                                                          onChanged:
                                                              (String? value) {
                                                            setState(() {
                                                              _chosenday =
                                                                  value;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        // StatefulBuilder(builder:
                                        //     (context, StateSetter setModalState) {
                                        //   return Row(
                                        //       children: [
                                        //         Transform.scale(
                                        //           scale: 1.0,
                                        //           child: Row(
                                        //             children: [
                                        //               Radio(
                                        //                   fillColor: MaterialStateColor
                                        //                       .resolveWith(
                                        //                           (states) =>
                                        //                               primaryColor),
                                        //                   value: 1,
                                        //                   groupValue: id,
                                        //                   onChanged: (value) {
                                        //                     // set is changed here
                                        //                     setModalState(() {
                                        //                       difficulty =
                                        //                           value.toString();
                                        //                       id = 1;
                                        //                     });
                                        //                   }),
                                        //               SmallText(
                                        //                 text:"Single",
                                        //                 size: 13,
                                        //               )
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         Transform.scale(
                                        //           scale: 1.0,
                                        //           child: Row(
                                        //             children: [
                                        //               Radio(
                                        //                   fillColor: MaterialStateColor
                                        //                       .resolveWith(
                                        //                           (states) =>
                                        //                               primaryColor),
                                        //                   value: 2,
                                        //                   groupValue: id,
                                        //                   onChanged: (value) {
                                        //                     // set is changed here
                                        //                     setModalState(() {
                                        //                       difficulty =
                                        //                           value.toString();
                                        //                       id = 2;
                                        //                     });
                                        //                   }),
                                        //               SmallText(
                                        //                 text:"Multiple",
                                        //                 size: 13,
                                        //               )
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         Transform.scale(
                                        //           scale: 1.0,
                                        //           child: Row(
                                        //             children: [
                                        //               Radio(
                                        //                   fillColor: MaterialStateColor
                                        //                       .resolveWith(
                                        //                           (states) =>
                                        //                               primaryColor),
                                        //                   value: 3,
                                        //                   groupValue: id,
                                        //                   onChanged: (value) {
                                        //                     // set is changed here
                                        //                     setModalState(() {
                                        //                       difficulty =
                                        //                           value.toString();
                                        //                       id = 3;
                                        //                     });
                                        //                   }),
                                        //               SmallText(
                                        //                 text:"1st half",
                                        //                 size: 13,
                                        //               )
                                        //             ],
                                        //           ),
                                        //         ),
                                        //         Transform.scale(
                                        //           scale: 1.0,
                                        //           child: Row(
                                        //             children: [
                                        //               Radio(
                                        //                   fillColor: MaterialStateColor
                                        //                       .resolveWith(
                                        //                           (states) =>
                                        //                               primaryColor),
                                        //                   value: 4,
                                        //                   groupValue: id,
                                        //                   onChanged: (value) {
                                        //                     // set is changed here
                                        //                     setModalState(() {
                                        //                       difficulty =
                                        //                           value.toString();
                                        //                       id = 4;
                                        //                     });
                                        //                   }),
                                        //               SmallText(
                                        //                 text: "2nd half",
                                        //                 size: 13,
                                        //               )
                                        //             ],
                                        //           ),
                                        //         )
                                        //       ]);
                                        // }),
                                        _chosenValue ==
                                                    MyStrings.marriageLeave ||
                                                _chosenValue ==
                                                    MyStrings.maternityLeave
                                            ? SizedBox()
                                            : SizedBox(
                                                height: 20,
                                              ),

                                        _chosenday == "Multiple day" ||
                                                _chosenValue ==
                                                    MyStrings.marriageLeave ||
                                                _chosenValue ==
                                                    MyStrings.maternityLeave
                                            ? Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SmallText(
                                                        text:
                                                            MyStrings.fromDate,
                                                        color: textGreyColor,
                                                        size: 16,
                                                      ),
                                                      heightspace,
                                                      GestureDetector(
                                                        onTap: () {
                                                          selectDate1(context);
                                                        },
                                                        child: Form(
                                                          key: formKey,
                                                          child: AbsorbPointer(
                                                            child: Container(
                                                              height: 35,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2.5,
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    fromdate,
                                                                readOnly: true,
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      const OutlineInputBorder(),
                                                                  suffixIcon:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            4.0),
                                                                    child:
                                                                        IconButton(
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .calendar_today_sharp,
                                                                        size:
                                                                            15,
                                                                      ),
                                                                      onPressed:
                                                                          () =>
                                                                              selectDate1(context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  heightspace,
                                                  heightspace,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SmallText(
                                                        text: MyStrings.toDate,
                                                        color: textGreyColor,
                                                        size: 16,
                                                      ),
                                                      heightspace,
                                                      GestureDetector(
                                                        onTap: () {
                                                          selectendDate1(
                                                              context);
                                                        },
                                                        child: Form(
                                                          key: formKey1,
                                                          child: AbsorbPointer(
                                                            child: SizedBox(
                                                              height: 35,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  2.5,
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    enddate,
                                                                readOnly: true,
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      const OutlineInputBorder(),
                                                                  suffixIcon:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            4.0),
                                                                    child:
                                                                        IconButton(
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .calendar_today_sharp,
                                                                        size:
                                                                            15,
                                                                      ),
                                                                      onPressed:
                                                                          () =>
                                                                              selectendDate1(context),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  _chosenday == "Single day"
                                                      ? SmallText(
                                                          text: "Apply date",
                                                          color: textGreyColor,
                                                          size: 16,
                                                        )
                                                      : SmallText(
                                                          text: MyStrings
                                                              .fromDate,
                                                          color: textGreyColor,
                                                          size: 16,
                                                        ),
                                                  heightspace,
                                                  GestureDetector(
                                                    onTap: () {
                                                      selectDate1(context);
                                                    },
                                                    child: Form(
                                                      key: formKey,
                                                      child: AbsorbPointer(
                                                        child: Container(
                                                          height: 35,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                          child: TextFormField(
                                                            // textAlignVertical:
                                                            //     TextAlignVertical
                                                            //         .center,
                                                            // textAlign:
                                                            //     TextAlign.left,
                                                            // style: font15,
                                                            controller:
                                                                fromdate,
                                                            readOnly: true,
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  const OutlineInputBorder(),
                                                              suffixIcon:
                                                                  Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            4.0),
                                                                child:
                                                                    IconButton(
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .calendar_today_sharp,
                                                                    size: 14,
                                                                  ),
                                                                  onPressed: () =>
                                                                      selectDate1(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                        heightspace,
                                        heightspace,
                                        _chosenday == "Multiple day" ||
                                                _chosenValue ==
                                                    MyStrings.marriageLeave ||
                                                _chosenValue ==
                                                    MyStrings.maternityLeave
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SmallText(
                                                    text: "Total days",
                                                    color: textGreyColor,
                                                    size: 16,
                                                  ),
                                                  Container(
                                                    height: 35,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color: borderColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 12.0,
                                                              right: 12),
                                                      child: SmallText(
                                                          text:
                                                              '$different days'),
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                ],
                                              )
                                            : SizedBox(),
                                        _chosenday == "Multiple day" ||
                                                _chosenValue ==
                                                    MyStrings.marriageLeave ||
                                                _chosenValue ==
                                                    MyStrings.maternityLeave
                                            ? SizedBox(
                                                height: 20,
                                              )
                                            : SizedBox(),
                                        SmallText(
                                          text: MyStrings.reason,
                                          color: textGreyColor,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextField(
                                          maxLines: 2,
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: borderColor),
                                            ),
                                          ),
                                        ),
                                        heightspace,
                                        heightspace,
                                        _chosenValue == MyStrings.casualLeave ||
                                                _chosenValue ==
                                                    MyStrings.compOff ||
                                                _chosenValue ==
                                                    MyStrings.paternityLeave ||
                                                _chosenValue ==
                                                    MyStrings.bereavementLeave
                                            ? SizedBox()
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // SmallText(
                                                  //   text: MyStrings.attachFile,
                                                  //   color: textGreyColor,
                                                  //   size: 16,
                                                  // ),
                                                  imageList.length > 2
                                                      ? SizedBox()
                                                      : InkWell(
                                                          onTap:
                                                              _uploadImageModalBottomSheet,
                                                          child: Container(
                                                            height: 35,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2.4,
                                                            decoration:
                                                                BoxDecoration(
                                                                    // color: containerGreyColor,

                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0xff8c8c8c),
                                                                    )),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const Icon(
                                                                  Icons.add,
                                                                  color: Color(
                                                                      0xff8c8c8c),
                                                                ),
                                                                SmallText(
                                                                  text: MyStrings
                                                                      .uploadFile,
                                                                  size: 14,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                ],
                                              ),
                                        heightspace,
                                        // ListView.builder(
                                        //   physics:
                                        //       const BouncingScrollPhysics(),
                                        //   shrinkWrap: true,
                                        //   itemCount: imageList.length + 1,
                                        //   itemBuilder:
                                        //       (BuildContext context,
                                        //           int index) {
                                        //     final item = index + 1 ==
                                        //             imageList.length + 1
                                        //         ? null
                                        //         : imageList[index];
                                        //     return index + 1 ==
                                        //             imageList.length + 1
                                        //         ? (imageList.length > 2)
                                        //             ? SizedBox()
                                        //             : InkWell(
                                        //                 onTap:
                                        //                     _uploadImageModalBottomSheet,
                                        //                 child: Container(
                                        //                   height: 75,
                                        //                   decoration:
                                        //                       BoxDecoration(
                                        //                     color:
                                        //                         containerGreyColor,
                                        //                   ),
                                        //                   child: SmallText(
                                        //                     text: MyStrings
                                        //                         .uploadFile,
                                        //                     size: 12,
                                        //                   ),
                                        //                 ),
                                        //               )
                                        //         : Stack(
                                        //             children: [
                                        //               Container(
                                        //                 width: 75.0,
                                        //                 height: 75.0,
                                        //                 decoration:
                                        //                     BoxDecoration(
                                        //                         border:
                                        //                             Border
                                        //                                 .all(
                                        //                   color:
                                        //                       primaryColor,
                                        //                   width: 2,
                                        //                 )),
                                        //                 child: Image.file(
                                        //                   item,
                                        //                   fit: BoxFit.cover,
                                        //                 ),
                                        //               ),
                                        //              Positioned(
                                        //                left: 80,
                                        //                child:
                                        //                GestureDetector(
                                        //                  onTap: () {
                                        //                    deleteImageDialogue(
                                        //                        index);
                                        //                  },
                                        //                  child:
                                        //                  const Align(
                                        //                    alignment:
                                        //                    Alignment
                                        //                        .topRight,
                                        //                    child:
                                        //                    CircleAvatar(
                                        //                      radius: 10.0,
                                        //                      backgroundColor:
                                        //                      Colors
                                        //                          .teal,
                                        //                      child: Icon(
                                        //                        Icons.close,
                                        //                        color: Colors
                                        //                            .white,
                                        //                        size: 15.0,
                                        //                      ),
                                        //                    ),
                                        //                  ),
                                        //                ),
                                        //               ),
                                        //             ],
                                        //           );
                                        //   },
                                        // ),

                                        imageList.isEmpty
                                            ? SizedBox()
                                            : GridView.builder(
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        childAspectRatio:
                                                            2 / 2.5,
                                                        crossAxisCount: 4,
                                                        crossAxisSpacing: 15,
                                                        mainAxisSpacing: 15),
                                                itemCount: imageList.length + 1,
                                                primary: false,
                                                // physics: NeverScrollableScrollPhysFics(),
                                                // controller: ScrollController(keepScrollOffset: false),
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (BuildContext ctx, index) {
                                                  final item = index + 1 ==
                                                          imageList.length + 1
                                                      ? null
                                                      : imageList[index];
                                                  return index + 1 ==
                                                          imageList.length + 1
                                                      ? (imageList.length > 2)
                                                          ? Container()
                                                          : SizedBox()
                                                      // InkWell(
                                                      //             onTap:
                                                      //                 _uploadImageModalBottomSheet,
                                                      //             child: Container(
                                                      //               decoration:
                                                      //                   BoxDecoration(
                                                      //                 color:
                                                      //                     containerGreyColor,
                                                      //               ),
                                                      //               child: Column(
                                                      //                 mainAxisAlignment:
                                                      //                     MainAxisAlignment
                                                      //                         .center,
                                                      //                 children: [
                                                      //                   const Icon(
                                                      //                       Icons
                                                      //                           .add),
                                                      //                   const SizedBox(
                                                      //                     height: 5,
                                                      //                   ),
                                                      //                   SmallText(
                                                      //                     text: MyStrings
                                                      //                         .uploadFile,
                                                      //                     size: 12,
                                                      //                   )
                                                      //                 ],
                                                      //               ),
                                                      //             ),
                                                      //           )
                                                      : Stack(
                                                          children: [
                                                            Container(
                                                              width: 200.0,
                                                              height: 200.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                color:
                                                                    primaryColor,
                                                                width: 2,
                                                              )),
                                                              child: Image.file(
                                                                item,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Positioned(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  deleteImageDialogue(
                                                                      index);
                                                                },
                                                                child:
                                                                    const Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius:
                                                                        10.0,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .teal,
                                                                    child: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                }),
                                        heightspace,
                                        heightspace,
                                        Center(
                                            child: Button(
                                          text: MyStrings.applyLeave,
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : _selectedApply == MyStrings.applySwipe
                                ? Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.5,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        color: whiteColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            18, 25, 18, 25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                                child: SmallText(
                                              text: MyStrings.requestSwipe,
                                              size: 18,
                                              fontWeight: FontWeight.w600,
                                            )),
                                            heightspace,
                                            heightspace,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SmallText(
                                                  text: "Today's Date",
                                                  color: textGreyColor,
                                                  size: 16,
                                                ),
                                                SmallText(
                                                  text: DateFormat("dd/MM/yyyy")
                                                      .format(DateTime.now()),
                                                  size: 14,
                                                  fontWeight: FontWeight.w500,
                                                )
                                              ],
                                            ),
                                            heightspace,
                                            heightspace,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SmallText(
                                                  text: MyStrings.leaveType,
                                                  color: drawerTextColor,
                                                  size: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  height: 35.0,
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1.0,
                                                          color: borderColor),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  5.0)),
                                                    ),
                                                  ),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child: ButtonTheme(
                                                      alignedDropdown: true,
                                                      child: DropdownButton<
                                                          String>(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        value: _chosenMode,
                                                        underline: SizedBox(),
                                                        isExpanded: true,
                                                        items: <String>[
                                                          MyStrings.permission,
                                                          MyStrings.od,
                                                        ].map<
                                                            DropdownMenuItem<
                                                                String>>((String
                                                            value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: SmallText(
                                                                text: value),
                                                          );
                                                        }).toList(),
                                                        hint: SmallText(
                                                          text: MyStrings
                                                              .selectType,
                                                          color:
                                                              drawerTextColor,
                                                          size: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                        onChanged:
                                                            (String? value) {
                                                          setState(() {
                                                            _chosenMode = value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            heightspace,
                                            heightspace,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SmallText(
                                                  text: MyStrings.date,
                                                  color: textGreyColor,
                                                  size: 16,
                                                ),
                                                heightspace,
                                                GestureDetector(
                                                  onTap: () {
                                                    selectSwipeDate(context);
                                                  },
                                                  child: Form(
                                                    key: swipeKey,
                                                    child: AbsorbPointer(
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                        height: 35.0,
                                                        child: TextFormField(
                                                          controller: swipedate,
                                                          readOnly: true,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                const OutlineInputBorder(),
                                                            suffixIcon: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 4.0),
                                                              child: IconButton(
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .calendar_today_sharp,
                                                                  size: 15,
                                                                ),
                                                                onPressed: () =>
                                                                    selectSwipeDate(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            heightspace,
                                            heightspace,
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment
                                            //           .spaceBetween,
                                            //   children: [
                                            //     SmallText(
                                            //       text: MyStrings.mode,
                                            //       color: textGreyColor,
                                            //       size: 16,
                                            //     ),
                                            //     heightspace,
                                            //     Container(
                                            //       width: MediaQuery.of(context)
                                            //               .size
                                            //               .width /
                                            //           2.5,
                                            //       height: 35.0,
                                            //       padding:
                                            //           const EdgeInsets.all(0.0),
                                            //       decoration: ShapeDecoration(
                                            //         shape:
                                            //             RoundedRectangleBorder(
                                            //           side: BorderSide(
                                            //               width: 1.0,
                                            //               color: borderColor),
                                            //           borderRadius:
                                            //               const BorderRadius
                                            //                       .all(
                                            //                   Radius.circular(
                                            //                       5.0)),
                                            //         ),
                                            //       ),
                                            //       child:
                                            //           DropdownButtonHideUnderline(
                                            //         child: Padding(
                                            //           padding:
                                            //               const EdgeInsets.only(
                                            //                   left: 8.0,
                                            //                   right: 8),
                                            //           child: DropdownButton(
                                            //             value: type,
                                            //             hint: const Text(
                                            //                 "Select Slot"),
                                            //             items: <String>[
                                            //               MyStrings.inTime,
                                            //               MyStrings.out,
                                            //               MyStrings.both,
                                            //             ].map<
                                            //                 DropdownMenuItem<
                                            //                     String>>((String
                                            //                 value) {
                                            //               return DropdownMenuItem<
                                            //                   String>(
                                            //                 value: value,
                                            //                 child: SmallText(
                                            //                     text: value),
                                            //               );
                                            //             }).toList(),
                                            //             onChanged: (newType) {
                                            //               setState(() {
                                            //                 type = newType
                                            //                     as String?;
                                            //               });
                                            //             },
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                            // type == ""
                                            //     ? SizedBox()
                                            //     : heightspace,
                                            // heightspace,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SmallText(
                                                  text: "In Time",
                                                  color: textGreyColor,
                                                  size: 16,
                                                ),
                                                SizedBox(
                                                  height: 35,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: TextFormField(
                                                    controller:
                                                        _txtTimeController,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(
                                                            decimal: false),
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        hintText: '00:00',
                                                        border:
                                                            const OutlineInputBorder(),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color:
                                                                  borderColor),
                                                        ),
                                                        suffixIcon: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 7.0),
                                                          child: SmallText(
                                                            text: "AM",
                                                          ),
                                                        )),
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      timeMaskFormatter
                                                      // Not sure if it can be done with RegExp or a custom class here instead
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            heightspace,
                                            heightspace,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SmallText(
                                                  text: "Out Time",
                                                  color: textGreyColor,
                                                  size: 16,
                                                ),
                                                heightspace,
                                                SizedBox(
                                                  height: 35,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  child: TextFormField(
                                                    controller:
                                                        _txtTimeController,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(
                                                            decimal: false),
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        hintText: '00:00',
                                                        border:
                                                            const OutlineInputBorder(),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 1,
                                                              color:
                                                                  borderColor),
                                                        ),
                                                        suffixIcon: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 7.0,
                                                          ),
                                                          child: SmallText(
                                                            text: "PM",
                                                          ),
                                                        )),
                                                    inputFormatters: <
                                                        TextInputFormatter>[
                                                      timeMaskFormatter
                                                      // Not sure if it can be done with RegExp or a custom class here instead
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // type == "In"
                                            //     ? Row(
                                            //         mainAxisAlignment:
                                            //             MainAxisAlignment
                                            //                 .spaceBetween,
                                            //         children: [
                                            //           SmallText(
                                            //             text: "In Time",
                                            //             color: textGreyColor,
                                            //             size: 16,
                                            //           ),
                                            //           SizedBox(
                                            //             height: 40,
                                            //             width: MediaQuery.of(
                                            //                         context)
                                            //                     .size
                                            //                     .width /
                                            //                 2.5,
                                            //             child: TextFormField(
                                            //               controller:
                                            //                   _txtTimeController,
                                            //               textAlign:
                                            //                   TextAlign.justify,
                                            //               keyboardType: TextInputType
                                            //                   .numberWithOptions(
                                            //                       decimal:
                                            //                           false),
                                            //               decoration:
                                            //                   InputDecoration(
                                            //                       contentPadding:
                                            //                           EdgeInsets.only(
                                            //                               top:
                                            //                                   12.0,
                                            //                               left:
                                            //                                   10,
                                            //                               right:
                                            //                                   5),
                                            //                       hintText:
                                            //                           '00:00',
                                            //                       border:
                                            //                           const OutlineInputBorder(),
                                            //                       focusedBorder:
                                            //                           OutlineInputBorder(
                                            //                         borderSide: BorderSide(
                                            //                             width:
                                            //                                 1,
                                            //                             color:
                                            //                                 borderColor),
                                            //                       ),
                                            //                       suffixIcon:
                                            //                           Padding(
                                            //                         padding: const EdgeInsets
                                            //                                 .only(
                                            //                             top:
                                            //                                 8.0,
                                            //                             left:
                                            //                                 5),
                                            //                         child:
                                            //                             SmallText(
                                            //                           text:
                                            //                               "AM",
                                            //                         ),
                                            //                       )),
                                            //               inputFormatters: <
                                            //                   TextInputFormatter>[
                                            //                 timeMaskFormatter
                                            //                 // Not sure if it can be done with RegExp or a custom class here instead
                                            //               ],
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       )
                                            //     : type == "Out"
                                            //         ? Row(
                                            //             mainAxisAlignment:
                                            //                 MainAxisAlignment
                                            //                     .spaceBetween,
                                            //             children: [
                                            //               SmallText(
                                            //                 text: "Out Time",
                                            //                 color:
                                            //                     textGreyColor,
                                            //                 size: 16,
                                            //               ),
                                            //               SizedBox(
                                            //                 height: 40,
                                            //                 width: MediaQuery.of(
                                            //                             context)
                                            //                         .size
                                            //                         .width /
                                            //                     2.5,
                                            //                 child:
                                            //                     TextFormField(
                                            //                   controller:
                                            //                       _txtTimeController,
                                            //                   textAlign:
                                            //                       TextAlign
                                            //                           .justify,
                                            //                   keyboardType: TextInputType
                                            //                       .numberWithOptions(
                                            //                           decimal:
                                            //                               false),
                                            //                   decoration:
                                            //                       InputDecoration(
                                            //                           contentPadding: EdgeInsets.only(
                                            //                               top:
                                            //                                   12.0,
                                            //                               left:
                                            //                                   10,
                                            //                               right:
                                            //                                   5),
                                            //                           hintText:
                                            //                               '00:00',
                                            //                           border:
                                            //                               const OutlineInputBorder(),
                                            //                           focusedBorder:
                                            //                               OutlineInputBorder(
                                            //                             borderSide: BorderSide(
                                            //                                 width:
                                            //                                     1,
                                            //                                 color:
                                            //                                     borderColor),
                                            //                           ),
                                            //                           suffixIcon:
                                            //                               Padding(
                                            //                             padding: const EdgeInsets.only(
                                            //                                 top:
                                            //                                     8.0,
                                            //                                 left:
                                            //                                     5),
                                            //                             child:
                                            //                                 SmallText(
                                            //                               text:
                                            //                                   "PM",
                                            //                             ),
                                            //                           )),
                                            //                   inputFormatters: <
                                            //                       TextInputFormatter>[
                                            //                     timeMaskFormatter
                                            //                     // Not sure if it can be done with RegExp or a custom class here instead
                                            //                   ],
                                            //                 ),
                                            //               ),
                                            //             ],
                                            //           )
                                            //         : type == "Both"
                                            //             ? Row(
                                            //                 mainAxisAlignment:
                                            //                     MainAxisAlignment
                                            //                         .spaceBetween,
                                            //                 children: [
                                            //                   Column(
                                            //                     crossAxisAlignment:
                                            //                         CrossAxisAlignment
                                            //                             .start,
                                            //                     children: [
                                            //                       SmallText(
                                            //                         text:
                                            //                             "In Time",
                                            //                         color:
                                            //                             textGreyColor,
                                            //                         size: 16,
                                            //                       ),
                                            //                       SizedBox(
                                            //                         height: 40,
                                            //                         width: MediaQuery.of(context)
                                            //                                 .size
                                            //                                 .width /
                                            //                             2.5,
                                            //                         child:
                                            //                             TextFormField(
                                            //                           controller:
                                            //                               _txtTimeController,
                                            //                           textAlign:
                                            //                               TextAlign
                                            //                                   .justify,
                                            //                           keyboardType:
                                            //                               TextInputType.numberWithOptions(
                                            //                                   decimal: false),
                                            //                           decoration: InputDecoration(
                                            //                               contentPadding: EdgeInsets.only(top: 20.0, left: 10, right: 5),
                                            //                               hintText: '00:00',
                                            //                               border: const OutlineInputBorder(),
                                            //                               focusedBorder: OutlineInputBorder(
                                            //                                 borderSide:
                                            //                                     BorderSide(width: 1, color: borderColor),
                                            //                               ),
                                            //                               suffixIcon: Padding(
                                            //                                 padding:
                                            //                                     const EdgeInsets.only(top: 10.0, left: 5),
                                            //                                 child:
                                            //                                     SmallText(
                                            //                                   text: "AM",
                                            //                                 ),
                                            //                               )),
                                            //                           inputFormatters: <
                                            //                               TextInputFormatter>[
                                            //                             timeMaskFormatter
                                            //                             // Not sure if it can be done with RegExp or a custom class here instead
                                            //                           ],
                                            //                         ),
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                   Column(
                                            //                     crossAxisAlignment:
                                            //                         CrossAxisAlignment
                                            //                             .start,
                                            //                     children: [
                                            //                       SmallText(
                                            //                         text:
                                            //                             "Out Time",
                                            //                         color:
                                            //                             textGreyColor,
                                            //                         size: 16,
                                            //                       ),
                                            //                       heightspace,
                                            //                       SizedBox(
                                            //                         height: 40,
                                            //                         width: MediaQuery.of(context)
                                            //                                 .size
                                            //                                 .width /
                                            //                             2.5,
                                            //                         child:
                                            //                             TextFormField(
                                            //                           controller:
                                            //                               _txtTimeController,
                                            //                           textAlign:
                                            //                               TextAlign
                                            //                                   .justify,
                                            //                           keyboardType:
                                            //                               TextInputType.numberWithOptions(
                                            //                                   decimal: false),
                                            //                           decoration: InputDecoration(
                                            //                               contentPadding: EdgeInsets.only(top: 20.0, left: 10, right: 5),
                                            //                               hintText: '00:00',
                                            //                               border: const OutlineInputBorder(),
                                            //                               focusedBorder: OutlineInputBorder(
                                            //                                 borderSide:
                                            //                                     BorderSide(width: 1, color: borderColor),
                                            //                               ),
                                            //                               suffixIcon: Padding(
                                            //                                 padding:
                                            //                                     const EdgeInsets.only(top: 10.0, left: 5),
                                            //                                 child:
                                            //                                     SmallText(
                                            //                                   text: "PM",
                                            //                                 ),
                                            //                               )),
                                            //                           inputFormatters: <
                                            //                               TextInputFormatter>[
                                            //                             timeMaskFormatter
                                            //                             // Not sure if it can be done with RegExp or a custom class here instead
                                            //                           ],
                                            //                         ),
                                            //                       ),
                                            //                     ],
                                            //                   )
                                            //                 ],
                                            //               )
                                            //             : SizedBox(),
                                            heightspace,
                                            heightspace,
                                            SmallText(
                                              text: MyStrings.reason,
                                              color: textGreyColor,
                                              size: 16,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Expanded(
                                              child: TextField(
                                                maxLines: 3,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: borderColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            heightspace,
                                            heightspace,
                                            Center(
                                                child: Button(
                                              text: MyStrings.request,
                                            ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : _selectedApply == MyStrings.shiftChange
                                    ? Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.7,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            color: whiteColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                18, 25, 18, 25),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                    child: SmallText(
                                                  text: MyStrings
                                                      .requestShiftChange,
                                                  size: 18,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                                heightspace,
                                                heightspace,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SmallText(
                                                      text: "Today's Date",
                                                      color: textGreyColor,
                                                      size: 16,
                                                    ),
                                                    SmallText(
                                                      text: DateFormat(
                                                              "dd/MM/yyyy")
                                                          .format(
                                                              DateTime.now()),
                                                      size: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )
                                                  ],
                                                ),
                                                heightspace,
                                                heightspace,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SmallText(
                                                      text: MyStrings.date,
                                                      color: textGreyColor,
                                                      size: 16,
                                                    ),
                                                    heightspace,
                                                    GestureDetector(
                                                      onTap: () {
                                                        selectSwipeDate(
                                                            context);
                                                      },
                                                      child: Form(
                                                        key: swipeKey,
                                                        child: AbsorbPointer(
                                                          child: SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2.5,
                                                            height: 35.0,
                                                            child:
                                                                TextFormField(
                                                              // textAlignVertical:
                                                              //     TextAlignVertical
                                                              //         .center,
                                                              // textAlign:
                                                              //     TextAlign
                                                              //         .left,

                                                              controller:
                                                                  swipedate,
                                                              readOnly: true,
                                                              decoration:
                                                                  InputDecoration(
                                                                border:
                                                                    const OutlineInputBorder(),
                                                                suffixIcon:
                                                                    Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 4.0),
                                                                  child:
                                                                      IconButton(
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .calendar_today_sharp,
                                                                      size: 15,
                                                                    ),
                                                                    onPressed: () =>
                                                                        selectSwipeDate(
                                                                            context),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                heightspace,
                                                heightspace,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SmallText(
                                                      text: "Existing Shift",
                                                      color: textGreyColor,
                                                      size: 16,
                                                    ),
                                                    heightspace,
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      height: 35.0,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      decoration:
                                                          ShapeDecoration(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              width: 1.0,
                                                              color:
                                                                  borderColor),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          5.0)),
                                                        ),
                                                      ),
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8),
                                                          child: DropdownButton(
                                                            value: exshift,
                                                            hint: const Text(
                                                                "Select Shift"),
                                                            items: <String>[
                                                              MyStrings.morning,
                                                              MyStrings.noon,
                                                              MyStrings.night,
                                                            ].map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                value) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child: SmallText(
                                                                    text:
                                                                        value),
                                                              );
                                                            }).toList(),
                                                            onChanged:
                                                                (newType) {
                                                              setState(() {
                                                                exshift = newType
                                                                    as String?;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                heightspace,
                                                heightspace,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SmallText(
                                                      text: "New Shift",
                                                      color: textGreyColor,
                                                      size: 16,
                                                    ),
                                                    heightspace,
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      height: 35.0,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      decoration:
                                                          ShapeDecoration(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              width: 1.0,
                                                              color:
                                                                  borderColor),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          5.0)),
                                                        ),
                                                      ),
                                                      child:
                                                          DropdownButtonHideUnderline(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8),
                                                          child: DropdownButton(
                                                            value: newshift,
                                                            hint: const Text(
                                                                "Change Shift"),
                                                            items: <String>[
                                                              MyStrings.morning,
                                                              MyStrings.noon,
                                                              MyStrings.night,
                                                            ].map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                value) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child: SmallText(
                                                                    text:
                                                                        value),
                                                              );
                                                            }).toList(),
                                                            onChanged:
                                                                (newType) {
                                                              setState(() {
                                                                newshift = newType
                                                                    as String?;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                heightspace,
                                                heightspace,
                                                SmallText(
                                                  text: MyStrings.reason,
                                                  color: textGreyColor,
                                                  size: 16,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Expanded(
                                                  child: TextField(
                                                    maxLines: 3,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    decoration: InputDecoration(
                                                      border:
                                                          const OutlineInputBorder(),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            width: 1,
                                                            color: borderColor),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                heightspace,
                                                heightspace,
                                                Center(
                                                    child: Button(
                                                  text: MyStrings.request,
                                                ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : DataTable(
                                        //border: TableBorder.all(width: 0.3, color:prescriptionDivideColor),
                                        headingRowColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Color(0xffd6edee)),
                                        headingRowHeight: 50,
                                        showBottomBorder: true,
                                        columnSpacing: 35,
                                        horizontalMargin: 10,
                                        dataRowHeight: 50,
                                        columns: [
                                          DataColumn(
                                              label: Center(
                                                  child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: SmallText(
                                              text: "Type",
                                              color: blueGreyColor,
                                              size: 14,
                                              textAlign: TextAlign.center,
                                            ),
                                          ))),
                                          DataColumn(
                                              label: SmallText(
                                            text: "OB+",
                                            color: blueGreyColor,
                                            size: 14,
                                            textAlign: TextAlign.center,
                                          )),
                                          DataColumn(
                                              label: SmallText(
                                            text: "Paid",
                                            color: blueGreyColor,
                                            size: 14,
                                            textAlign: TextAlign.center,
                                          )),
                                          DataColumn(
                                              label: SmallText(
                                            text: "Avail",
                                            color: blueGreyColor,
                                            size: 14,
                                            textAlign: TextAlign.center,
                                          )),
                                          DataColumn(
                                              label: SmallText(
                                            text: "Balance",
                                            color: blueGreyColor,
                                            size: 15,
                                            textAlign: TextAlign.center,
                                          )),
                                        ],
                                        rows: [
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(
                                                SmallText(
                                                  text: MyStrings.casualLeave,
                                                  size: 14,
                                                  color: drawerTextColor,
                                                ),
                                              ),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '12',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '12',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '3.5',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '3.5',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(SmallText(
                                                text: MyStrings.sickLeave,
                                                size: 14,
                                                color: drawerTextColor,
                                              )),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '12',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '12',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '5',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '2',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(SmallText(
                                                text: MyStrings.compOff,
                                                size: 14,
                                                color: drawerTextColor,
                                              )),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '1',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(SmallText(
                                                text: MyStrings.marriageLeave,
                                                size: 14,
                                                color: drawerTextColor,
                                              )),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '20',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(SmallText(
                                                text: MyStrings.maternityLeave,
                                                size: 14,
                                                color: drawerTextColor,
                                              )),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '20',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(SmallText(
                                                text: MyStrings.paternityLeave,
                                                size: 14,
                                                color: drawerTextColor,
                                              )),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '130',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '52',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(SmallText(
                                                text: MyStrings.medicalLeave,
                                                size: 14,
                                                color: drawerTextColor,
                                              )),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '2',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '1',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                            ],
                                          ),
                                          DataRow(
                                            cells: <DataCell>[
                                              DataCell(SmallText(
                                                text:
                                                    MyStrings.bereavementLeave,
                                                size: 14,
                                                color: drawerTextColor,
                                              )),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                              DataCell(Center(
                                                  child: SmallText(
                                                text: '0',
                                                size: 14,
                                                color: drawerTextColor,
                                              ))),
                                            ],
                                          ),
                                        ],
                                      ),
          ],
        ),
      ),
    );
  }

  DateTime selectedSwipeDate = DateTime.now();
  DateTime time = DateTime.now();
  TextEditingController? swipedate;
  final swipeKey = GlobalKey<FormState>();

  Future<void> selectSwipeDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedSwipeDate,
      firstDate: DateTime(2010, 1),
      lastDate: DateTime(2070, 1),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor, // <-- SEE HERE
              onPrimary: whiteColor, // <-- SEE HERE
              onSurface: blackColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedSwipeDate = picked;

        var formatter = new DateFormat('dd/MM/yyyy');
        String formatted = formatter.format(selectedSwipeDate);
        swipedate?.value = TextEditingValue(text: formatted.toString());
      });
    }
  }

  //From date
  DateTime selectedDate = new DateTime.now();
  late DateTime selectedfromDate;
  TextEditingController? fromdate;
  final formKey = GlobalKey<FormState>();

  Future<void> selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010, 1),
      lastDate: DateTime(2070, 1),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor, // <-- SEE HERE
              onPrimary: whiteColor, // <-- SEE HERE
              onSurface: blackColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        selectedfromDate = picked;
        var formatter = DateFormat('dd/MM/yyyy');
        String formatted = formatter.format(selectedDate);
        fromdate?.value = TextEditingValue(text: formatted.toString());
      });
    }
  }

  // end date
  DateTime selectedendDate = DateTime.now();
  late DateTime selectedendleaveDate;
  TextEditingController? enddate;
  final formKey1 = GlobalKey<FormState>();

  Future<void> selectendDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate,
      lastDate: DateTime(2070, 1),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor, // <-- SEE HERE
              onPrimary: whiteColor, // <-- SEE HERE
              onSurface: blackColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedendDate = picked;
        selectedendleaveDate = picked;
        var formatter = new DateFormat('dd/MM/yyyy');
        String formatted = formatter.format(selectedendDate);
        enddate?.value = TextEditingValue(text: formatted.toString());
      });
    }
  }

  Widget showBottomModal() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Filters',
                  style: TextStyle(fontFamily: 'medium', fontSize: 16),
                ),
                Text(
                  'Clear Filter',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Wrap(
              children: [
                filterContainer('2022'),
                filterContainer('2021'),
                filterContainer('2020'),
                filterContainer('2019'),
                filterContainer('2018'),
                filterContainer('Older'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade400))),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400)),
                  child: const Center(
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(color: primaryColor),
                  child: const Center(
                    child: Text(
                      'Apply',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'medium',
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget filterContainer(text) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
      child: Text(text),
    );
  }

  // upload file

  final picker = ImagePicker();
  File? _image;

  void _uploadImageModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          double width = MediaQuery.of(context).size.width;
          return Container(
            color: Colors.white,
            margin: EdgeInsets.all(fixPadding),
            child: Wrap(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: SmallText(
                                text: MyStrings.uploadFile,
                              )),
                          IconButton(
                            icon: Icon(Icons.close, color: primaryColor),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(10.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: fixPadding * 2.0,
                                  bottom: fixPadding * 2.0,
                                  left: fixPadding * 4.0,
                                  right: fixPadding * 4.0),
                              color: Colors.grey[200],
                              child: Container(
                                height: 50.0,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      width: 0.8,
                                      color: Colors.grey.withOpacity(0.6)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    getCameraImage();
                                  },
                                  child: Container(
                                    width: width,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                                color: Color(0xffcefdff),
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                            )),
                                        widthspace,
                                        SmallText(text: MyStrings.camera)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: fixPadding * 2.0,
                                  left: fixPadding * 4.0,
                                  right: fixPadding * 4.0),
                              color: Colors.grey[200],
                              child: Container(
                                height: 50.0,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      width: 0.8,
                                      color: Colors.grey.withOpacity(0.6)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    getGalleryImage();
                                  },
                                  child: Container(
                                    width: width,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                                color: Color(0xffcefdff),
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.photo_library,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                            )),
                                        widthspace,
                                        SmallText(text: MyStrings.gallery)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future getCameraImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      var getFileSize = getFileSizeString(bytes: _image!.lengthSync());
      if ((getFileSize.contains('kb'))) {
      } else if (getFileSize.contains('mb')) {
        if (getFileSize.length >= 2) {
          getFileSize = getFileSize.substring(0, getFileSize.length - 2);
        }
        int fileSize = int.parse(getFileSize);
        if (fileSize > 2) {
          // Fluttertoast.showToast(msg: MyStrings.FILE_SIZE_VALIDATE_TXT);
          return;
        }
      } else {
        return;
      }
      setState(() {
        imageList.add(_image);
        if (imageList.length > 0) {
          // submitBtnText = "Upload & Continue";
        }
        // uploadPrescriptionImageDialogue();
      });
    } else {
      setState(() {
        _image = null;
        if (imageList.length > 0) {
          // submitBtnText = "Upload & Continue";
        }
      });
    }
  }

  Future getGalleryImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      _image = File(result.files.single.path!);
      var getFileSize = getFileSizeString(bytes: _image!.lengthSync());
      if ((getFileSize.contains('kb'))) {
      } else if (getFileSize.contains('mb')) {
        if (getFileSize.length >= 2) {
          getFileSize = getFileSize.substring(0, getFileSize.length - 2);
        }
        int fileSize = int.parse(getFileSize);
        if (fileSize > 2) {
          // Fluttertoast.showToast(msg: MyStrings.FILE_SIZE_VALIDATE_TXT);
          return;
        }
      } else {
        return;
      }
      setState(() {
        imageList.add(_image);
        if (imageList.length > 0) {
          // submitBtnText = "Upload & Continue";
        }
        // uploadPrescriptionImageDialogue();
      });
    } else {
      // User canceled the picker
    }
  }

  // Format File Size
  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  deleteImageDialogue(index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: MediaQuery.of(context).size.height / 4.5,
            padding:
                EdgeInsets.only(left: 20.0, top: 10, bottom: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Are you sure  you want to delete this image?",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width / 3.5),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          MyStrings.no,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          imageList.removeAt(index);
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        width: (MediaQuery.of(context).size.width / 3.5),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: SmallText(
                          text: MyStrings.yes,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
