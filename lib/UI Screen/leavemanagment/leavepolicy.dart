import 'package:demo_project/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../utils/constant.dart';
import '../../utils/smalltext.dart';

class LeavePolicy extends StatefulWidget {
  const LeavePolicy({Key? key}) : super(key: key);

  @override
  State<LeavePolicy> createState() => _LeavePolicyState();
}

class _LeavePolicyState extends State<LeavePolicy> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: SmallText(
          text: MyStrings.leavePolicy,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
        ),
      ),
    );
  }
}
