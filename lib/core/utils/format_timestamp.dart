import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String formatTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  DateFormat formatter = DateFormat('MMMM d, yyyy - HH:mm a');
  return formatter.format(dateTime);
}

String formatTimeFromTimestamp(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  DateFormat dateFormat = DateFormat.jm(); // 'jm' is for time format like 10 AM, 2 PM
  return dateFormat.format(dateTime);
}
