import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  String str;
  Function function;
  Widget child;
  bool isCallRunning = false;
  Color backgroundColor;
  Color textColor;
  bool toUppercase = true;
  bool disable = false;
  double horizontalMargin = 15.0;
  double verticalMargin = 10.0;

  RoundedButton(this.str,this.function,
      {this.child,
        this.isCallRunning = false,
        this.backgroundColor,
        this.textColor,
        this.toUppercase = true,
        this.disable = false,
        this.horizontalMargin = 15.0,
        this.verticalMargin = 10.0});

  @override
  Widget build(BuildContext context) {
    str = toUppercase ? str.toUpperCase() : str;
    return RawMaterialButton(
      child: child ??
          Container(
            margin: EdgeInsets.only(
                left: horizontalMargin,
                right: horizontalMargin,
                top: verticalMargin,
                bottom: verticalMargin),
            child:Text(str,style: const TextStyle(color: Colors.white),),
          ),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      fillColor: disable?Colors.grey:Colors.blue,
      onPressed: disable
          ? null
          : () {
        function();
      },
    );
  }
}
