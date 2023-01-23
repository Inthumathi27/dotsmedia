import 'package:flutter/material.dart';

import 'constant.dart';

class Button extends StatelessWidget {
  final String text;
  double? size;
  TextOverflow? overflow;
  final Color? color;

  Button({Key? key, required this.text, this.color=const Color(0xff000000),this.size=18,this.overflow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      width: MediaQuery.of(context).size.width/2,
      height: 50,
      child: Center(child: Text(text,overflow: overflow,
        style: TextStyle(  color:color,fontSize: size,fontWeight: FontWeight.w600),)),
    );
  }
}
