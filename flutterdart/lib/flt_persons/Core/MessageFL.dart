// ignore_for_file: prefer_const_constructors,
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: avoid_init_to_null
import '../../lib_domain_context/IMessage.dart';
import '../../lib_domain_context/MessagesHelper.dart';
import 'package:flutter/material.dart';
import '../../lib_language/Bundle.dart';
import '../Styles/Style.dart';
import 'PopupHelper.dart';

class MessageFL implements IMessage
{
  static BuildContext? context = null;

  @override
  dynamic show(String message, [Message type = Message.MESSAGE]) async
  {
    if (MessageFL.context == null)
      return;

    var response = await showDialog<bool>(
      context: MessageFL.context!,
      builder: (BuildContext context) {
        return PopupHelper.getPopup([
          Text(
              Bundle.get("RsMenu", 'lbMessage'),
              style: Style.titles,
          ),
          Text(
              message,
              style: Style.labels
          ),

          SizedBox(height: 50),
          if (type == Message.MESSAGE)
            TextButton(
              style: Style.buttons,
              onPressed: () { Navigator.pop(context); },
              child: Text(Bundle.get("RsMenu", 'lbClose')),
            ),

          if (type == Message.QUESTION)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: Style.buttons,
                  onPressed: () { Navigator.of(context).pop(true); },
                  child: Text(Bundle.get("RsMenu", 'lbAccept')),
                ),
                SizedBox(width: 2),
                TextButton(
                  style: Style.buttons,
                  onPressed: () { Navigator.of(context).pop(false); },
                  child: Text(Bundle.get("RsMenu", 'lbCancel')),
                ),
              ]
            )
        ]);
      },
    );
    return response ?? false;
  }
}