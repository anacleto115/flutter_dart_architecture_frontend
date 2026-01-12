
import 'package:flutter/material.dart';

class DatePicker
{
  static Future<DateTime?> selectDate(BuildContext context, DateTime? date) async
  {
    date = date ?? DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));
    return pickedDate;
  }
}