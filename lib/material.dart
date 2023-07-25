import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MaterialExamplePage extends StatefulWidget {
  const MaterialExamplePage({super.key});

  @override
  State<MaterialExamplePage> createState() => _MaterialExamplePageState();
}

class _MaterialExamplePageState extends State<MaterialExamplePage> {
  DateTime dateTime = DateTime.now();

  Future<DateTime?> pickDate() => showDatePicker(context: context, initialDate: dateTime, firstDate: DateTime(1900), lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(context: context, initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

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
                      child: const Text("Date", style: TextStyle(fontSize: 20),),
                      onPressed: () async {
                        final newDate = await pickDate();
                        if (newDate == null) return; // person pressed 'CANCEL'
            
                        // Update datetime object that's shown with new date
                        final newDateTime = DateTime(newDate.year, newDate.month, newDate.day, dateTime.hour, dateTime.minute);
                        setState(
                          () => dateTime = newDateTime,
                        );
                      }),
                  ElevatedButton(
                      child: const Text("Time", style: TextStyle(fontSize: 20),),
                      onPressed: () async {
                        final newTime = await pickTime();
                        if (newTime == null) return; // person pressed 'CANCEL'
            
                        // Update datetime object that's shown with new time
                        final newDateTime = DateTime(dateTime.year, dateTime.month, dateTime.day, newTime.hour, newTime.minute);
                        setState(
                          () => dateTime = newDateTime,
                        );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
