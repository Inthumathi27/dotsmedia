import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../utils/smalltext.dart';
import '../../utils/strings.dart';

class LeaveSummary extends StatefulWidget {
  const LeaveSummary({Key? key}) : super(key: key);

  @override
  State<LeaveSummary> createState() => _LeaveSummaryState();
}

class _LeaveSummaryState extends State<LeaveSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: SmallText(
          text: MyStrings.leaveSummary,
        ),
      ),
      body: DataTable(
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
    );
  }
}
