
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spinner_date_time_picker/spinner_date_time_picker.dart';
import '../../utils/constant.dart';
import '../../utils/smalltext.dart';
import '../../utils/strings.dart';

class BookCalendar extends StatefulWidget {
  const BookCalendar({Key? key}) : super(key: key);

  @override
  State<BookCalendar> createState() => _BookCalendarState();
}

class _BookCalendarState extends State<BookCalendar> {

  bool status1 = false;
  String? _chosenProductionHead;
  String? _chosenAnchor;
  String? _chosenCameraMan;
  String? _chosenEditor;
  String? _chosenShootingSpot;
  DateTime selectedDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: containerColor,
      appBar: AppBar(
        backgroundColor: sideMenuColor,
        leadingWidth: 90,
        leading: InkWell(
            onTap: (){Navigator.of(context).pop();},
            child: Center(child: SmallText(text: MyStrings.cancel))),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: SmallText(text: MyStrings.newEvent),
        actions: [
          Center(child: Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: SmallText(text: MyStrings.save),
          ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,20,0,0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border(
                    top: BorderSide(width:1.0, color: borderColor),
                    bottom: BorderSide(width:1.0, color: borderColor),
                  ),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10,0,0,0),
                    border: InputBorder.none,
                    hintText: "Program Name",

                  ),
                ),
              ),
              heightspace,
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border(
                    top: BorderSide(width:1.0, color: borderColor),
                    bottom: BorderSide(width:1.0, color: borderColor),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    // buttonColor: primaryColor,
                    child: DropdownButton<String>(
                      iconEnabledColor: primaryColor,
                      iconSize: 40,
                      borderRadius: BorderRadius.circular(10),
                      value: _chosenProductionHead,
                      underline: SizedBox(),
                      isExpanded: true,
                      // style: font15.copyWith(color: Colors.black.withOpacity(0.7)),
                      items: <String>[
                        "productionHead1",
                        "productionHead2",
                        "productionHead3",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: SmallText(text: value),
                        );
                      }).toList(),
                      hint: SmallText(
                        text: MyStrings.productionHead,
                        // color: drawerTextColor,
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _chosenProductionHead = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              heightspace,
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border(
                    top: BorderSide(width:1.0, color: borderColor),
                    bottom: BorderSide(width:1.0, color: borderColor),
                  ),
                ),
                child: TextFormField(
                  decoration:const  InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10,0,0,0),
                    border: InputBorder.none,
                    hintText: "Guest Name",
                  ),
                ),
              ),
              heightspace,
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border(
                    top: BorderSide(width:1.0, color: borderColor),
                    bottom: BorderSide(width:1.0, color: borderColor),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    // buttonColor: primaryColor,
                    child: DropdownButton<String>(
                      iconEnabledColor: primaryColor,
                      iconSize: 40,
                      borderRadius: BorderRadius.circular(10),
                      value: _chosenAnchor,
                      underline: SizedBox(),
                      isExpanded: true,
                      // style: font15.copyWith(color: Colors.black.withOpacity(0.7)),
                      items: <String>[
                        "Anchor 1",
                        "Anchor 2",
                        "Anchor 3",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: SmallText(text: value),
                        );
                      }).toList(),
                      hint: SmallText(
                        text: MyStrings.anchorName,
                        // color: drawerTextColor,
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _chosenAnchor = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              heightspace,
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border(
                    top: BorderSide(width:1.0, color: borderColor),
                    bottom: BorderSide(width:1.0, color: borderColor),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    // buttonColor: primaryColor,
                    child: DropdownButton<String>(
                      iconEnabledColor: primaryColor,
                      iconSize: 40,
                      borderRadius: BorderRadius.circular(10),
                      value: _chosenCameraMan,
                      underline: SizedBox(),
                      isExpanded: true,
                      // style: font15.copyWith(color: Colors.black.withOpacity(0.7)),
                      items: <String>[
                        "Camera Man 1",
                        "Camera Man 2",
                        "Camera Man 3",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: SmallText(text: value),
                        );
                      }).toList(),
                      hint: SmallText(
                        text: MyStrings.cameraName,
                        // color: drawerTextColor,
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _chosenCameraMan = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              heightspace,
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border(
                    top: BorderSide(width:1.0, color: borderColor),
                    bottom: BorderSide(width:1.0, color: borderColor),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    // buttonColor: primaryColor,
                    child: DropdownButton<String>(
                      iconEnabledColor: primaryColor,
                      iconSize: 40,
                      borderRadius: BorderRadius.circular(10),
                      value: _chosenEditor,
                      underline: SizedBox(),
                      isExpanded: true,
                      // style: font15.copyWith(color: Colors.black.withOpacity(0.7)),
                      items: <String>[
                        "Editor 1",
                        "Editor 2",
                        "Editor 3",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: SmallText(text: value),
                        );
                      }).toList(),
                      hint: SmallText(
                        text: MyStrings.editor,
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _chosenEditor = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              heightspace,
              Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border(
                      top: BorderSide(width:1.0, color: borderColor),
                      bottom: BorderSide(width:1.0, color: borderColor),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12,15,12,15),
                    child: InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (context) {
                              var today = DateTime.now();
                              return Dialog(
                                child: SpinnerDateTimePicker(
                                  initialDateTime: today,
                                  maximumDate: today.add(const Duration(days: 365)),
                                  minimumDate:
                                  today.subtract(const Duration(days: 1)),
                                  mode: CupertinoDatePickerMode.dateAndTime,
                                  use24hFormat: false,
                                  didSetTime: (value) {
                                    setState(() {
                                      selectedDate = value;
                                    });
                                  },
                                ),
                              );
                            });
                      },
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(text: "Start Time",color: eventTextColor),
                          SmallText(
                            text: '${DateFormat.MMMEd().format(selectedDate)}  ${DateFormat.jm().format(selectedDate)}',
                          ),
                        ],
                      ),
                    ),
                  )
              ),
              heightspace,
              Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border(
                      top: BorderSide(width:1.0, color: borderColor),
                      bottom: BorderSide(width:1.0, color: borderColor),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12,15,12,15),
                    child: InkWell(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (context) {
                              var today = DateTime.now();
                              return Dialog(
                                child: SpinnerDateTimePicker(
                                  initialDateTime: today,
                                  maximumDate: today.add(const Duration(days: 365)),
                                  minimumDate:
                                  today.subtract(const Duration(days: 1)),
                                  mode: CupertinoDatePickerMode.dateAndTime,
                                  use24hFormat: false,
                                  didSetTime: (value) {
                                    setState(() {
                                      selectedEndDate = value;
                                    });
                                  },
                                ),
                              );
                            });
                      },
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(text: "End Time",color: eventTextColor),
                          SmallText(
                            text: '${DateFormat.MMMEd().format(selectedEndDate)}  ${DateFormat.jm().format(selectedEndDate)}',
                          ),
                        ],
                      ),
                    ),
                  )
              ),
              heightspace,
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border(
                    top: BorderSide(width:1.0, color: borderColor),
                    bottom: BorderSide(width:1.0, color: borderColor),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    // buttonColor: primaryColor,
                    child: DropdownButton<String>(
                      iconEnabledColor: primaryColor,
                      iconSize: 40,
                      borderRadius: BorderRadius.circular(10),
                      value: _chosenShootingSpot,
                      underline: SizedBox(),
                      isExpanded: true,
                      // style: font15.copyWith(color: Colors.black.withOpacity(0.7)),
                      items: <String>[
                        "Indoor",
                        "Outdoor",
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: SmallText(text: value),
                        );
                      }).toList(),
                      hint: SmallText(
                        text: "Shooting spot",
                        size: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _chosenShootingSpot = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              heightspace,
              Container(

                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border(
                    top: BorderSide(width:1.0, color: borderColor),
                    bottom: BorderSide(width:1.0, color: borderColor),
                  ),
                ),
                child: TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10,15,0,0),
                    border: InputBorder.none,
                    hintText: "Address",

                  ),
                ),
              ),
              heightspace,
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SmallText(text: "Notes",color: eventTextColor),
              ),
              heightspace,
              Container(

                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border(
                    top: BorderSide(width:1.0, color: borderColor),
                    bottom: BorderSide(width:1.0, color: borderColor),
                  ),
                ),
                child: TextFormField(
                  maxLines: 6,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10,15,0,0),
                    border: InputBorder.none,
                    // hintText: "Program Name",

                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
