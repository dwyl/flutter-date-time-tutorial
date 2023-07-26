import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final cupertinoDateButtonKey = UniqueKey();
final cupertinoTimeButtonKey = UniqueKey();
final cupertinoDateTimeButtonKey = UniqueKey();

class WebScrollBehaviour extends MaterialScrollBehavior {
  // Override behaviour methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

/// Cupertino example page.
/// Showcases the usage of `DatePicker` and `TimePicker` to change date and time.
class CupertinoExamplePage extends StatefulWidget {
  const CupertinoExamplePage({super.key});

  @override
  State<CupertinoExamplePage> createState() => _CupertinoExamplePageState();
}

class _CupertinoExamplePageState extends State<CupertinoExamplePage> {
  DateTime dateTime = DateTime.utc(2023, 7, 26);

  // This function displays a CupertinoModalPopup with a reasonable fixed height
  // which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => ScrollConfiguration(
        behavior: WebScrollBehaviour(),
        child: Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system
          // navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('yyyy-MM-dd').format(dateTime),
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat(' kk:mm').format(dateTime),
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      key: cupertinoDateButtonKey,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade300),
                      onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: dateTime,
                              mode: CupertinoDatePickerMode.date,
                              use24hFormat: true,
                              // This shows day of week alongside day of month
                              showDayOfWeek: true,
                              // This is called when the user changes the date.
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() => dateTime = newDate);
                              },
                            ),
                          ),
                      child: const Text(
                        "Date",
                        style: TextStyle(fontSize: 20),
                      )),
                  ElevatedButton(
                      key: cupertinoTimeButtonKey,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade300),
                      child: const Text(
                        "Time",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: dateTime,
                              mode: CupertinoDatePickerMode.time,
                              use24hFormat: true,
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() => dateTime = newDate);
                              },
                            ),
                          ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      key: cupertinoDateTimeButtonKey,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade400),
                      onPressed: () => _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: dateTime,
                              mode: CupertinoDatePickerMode.dateAndTime,
                              use24hFormat: true,
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() => dateTime = newDate);
                              },
                            ),
                          ),
                      child: const Text(
                        "DateTime",
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
