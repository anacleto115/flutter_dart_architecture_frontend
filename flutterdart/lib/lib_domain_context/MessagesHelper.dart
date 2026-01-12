// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: avoid_init_to_null
import 'IMessage.dart';

enum Message
{
  MESSAGE, QUESTION
}

class MessagesHelper
{
  static IMessage? iMessage = null;

  static void set(IMessage i) { iMessage = i; }

  static dynamic show(String message, [Message type = Message.MESSAGE]) async
  {
    if (iMessage == null)
      return false;
    return await iMessage!.show(message, type);
  }
}