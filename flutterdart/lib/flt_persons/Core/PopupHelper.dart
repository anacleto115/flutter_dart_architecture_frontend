
import 'package:flutter/material.dart';
import 'package:flutter_dart/flt_persons/Styles/Style.dart';

class PopupHelper
{
  static Widget getPopup(List<Widget> form, [double n_height = 290, double n_width = 380])
  {
    return Align(
      child: SizedBox(
        height: n_height,
        width: n_width,
        child: Material(
          color: Style.popupColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: form,
            ),
          ),
        ),
      ),
    );
  }
}