
import 'package:demo_project/utils/strings.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  double? size;
  TextOverflow? overflow;
  FontWeight? fontWeight;
  int? maxline;
  FontStyle? fontStyle;
  TextAlign? textAlign;
  double?height;
  String? fontFamliy;

  SmallText({Key? key, required this.text, this.color,this.size=16,this.fontWeight,this.maxline,this.overflow,this.fontStyle,this.textAlign,this.height,this.fontFamliy=MyStrings.fontFamily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,overflow: overflow,
      maxLines: maxline,
      textAlign: textAlign,
      style: TextStyle( color:color,fontSize: size,fontWeight: fontWeight,fontStyle:fontStyle,height: height,fontFamily: fontFamliy),
    );
  }
}
