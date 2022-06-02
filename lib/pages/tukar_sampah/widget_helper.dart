import 'package:flutter/material.dart';

class WidgetHelper {
  ButtonStyle btnCategoryStyle(bool changeColor){
    return ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
      foregroundColor: changeColor ? MaterialStateProperty.all<Color>( Colors.white) : MaterialStateProperty.all<Color>(const Color(0XFFE8EEF6)),
      backgroundColor: changeColor ? MaterialStateProperty.all<Color>( const Color(0XFFE8EEF6)) : MaterialStateProperty.all<Color>(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0XFFE8EEF6))
        )
      )
    );
  }
}