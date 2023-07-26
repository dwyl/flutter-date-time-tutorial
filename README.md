<div align="center">

# `Flutter` Date Time Tutorial

📱 📅 A quick intro to date &amp; time input/selection in your Flutter app. ⌚ 🤷‍♀️

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/dwyl/flutter-date-time-tutorial/ci.yml?label=build&style=flat-square&branch=main)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/flutter-date-time-tutorial/master.svg?style=flat-square)](https://codecov.io/github/dwyl/flutter-date-time-tutorial?branch=master)
[![HitCount](https://hits.dwyl.com/dwyl/flutter-date-time-tutorial.svg?style=flat-square&show=unique)](https://hits.dwyl.com/dwyl/flutter-date-time-tutorial)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/flutter-date-time-tutorial/issues)


</div>
<br />

- [`Flutter` Date Time Tutorial](#flutter-date-time-tutorial)
- [Why? 🤷‍](#why-)
- [What? 💭](#what-)
- [Who? 👤](#who-)
- [_How_? 👩‍💻](#how-)
  - [Prerequisites? 📝](#prerequisites-)
  - [0. Project setup](#0-project-setup)
  - [1. Setting up both pages](#1-setting-up-both-pages)
  - [2. (Option 1) `Material` Date/Time Pickers](#2-option-1-material-datetime-pickers)
    - [2.1 Editing **date** and **time** separately](#21-editing-date-and-time-separately)
    - [2.2 Editing **date** and **time** with single button](#22-editing-date-and-time-with-single-button)


# Why? 🤷‍

Because our [`app`](https://github.com/dwyl/app)
will rely heavily on setting dates and times
to track the time spent on each todo item,
we ought to go over the available options
that are available to us in `Flutter`-land.

# What? 💭

Setting *date* and *time* in `Flutter` apps
can be done in a variety of ways.
There are [several packages/components](https://fluttergems.dev/date-time-picker/)
that serve this purpose,
on top of the official Material widgets.

This repo will showcase a general introduction
to using the official [`DatePicker`](https://api.flutter.dev/flutter/material/showDatePicker.html) 
and [`TimerPicker`](https://api.flutter.dev/flutter/material/showTimePicker.html).


# Who? 👤

This quick demo is aimed at people in the @dwyl team
or anyone who is interested in learning 
more about setting date and time values
in their `Flutter` applications.

# _How_? 👩‍💻

## Prerequisites? 📝

This demo assumes you have foundational knowledge of `Flutter`.
If this is your first time tinkering with `Flutter`,
we suggest you first take a look at 
https://github.com/dwyl/learn-flutter.

In the linked repo, you will learn 
how to install the needed dependencies
and how to debug your app on both an emulator
or a physical device.


## 0. Project setup

To create a new project in `Flutter`,
follow the steps in 
https://github.com/dwyl/learn-flutter#0-setting-up-a-new-project.

After completing these steps,
you should have a boilerplate `Flutter` project.

If you run the app, you should see the template Counter app.
The tests should also run correctly.
Executing `flutter test --coverage` should yield
this output on the terminal.

```sh
00:02 +1: All tests passed!   
```

This means everything is correctly setup!
We are ready to start implementing!


## 1. Setting up both pages

Before adding our date and time pickers,
we are going to add two different pages:

- the first page will showcase the implementation 
of the official `DatePicker` and `TimePicker`,
the official **`Material`** widgets that are commonly used in `Flutter` apps.
- the second page will pertain to **`Cupertino`** widgets.

> **Note:**
>
> We **do not like modals**.
> Both of these widget types make use of modals/popups.
> While we're wanting to build our own pickers that 
> *do not* use these as a crutch, 
> we'll have to settle for these *for now* to speed up the development
> of our [`app`](https://github.com/dwyl/app).
> 
> If you want to know *why* we're wanting to
> **not** use modals,
> visit https://github.com/dwyl/product-ux-research/issues/38 for more context.

With this in mind,
let's set up a [`BottomNavigationBar`](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html)
to toggle between these two scenarios.
In `lib/main.dart`,
change it to:

```dart
import 'package:flutter/material.dart';

void main() => runApp(const App());

/// App class
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

/// HomePage with BottomBarNavigation
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  /// List of pages
  final List<Widget> _pages = <Widget>[
    const Text(
      'Material widget',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    const Text(
      'Cupertino widget',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    )
  ];

  /// Callback function that changes the index to show the selected page
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Date Time Pickers'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust),
            label: 'Material',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.power_input_sharp),
            label: 'Cupertino',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
```

Whenever the person taps on either `BottomNavigationBar` item,
they change the index of the page being shown
(this is handled by `_onItemTapped`).
If you run the app,
you should see this in action.

<p align='center'>
    <img width="250" src="https://github.com/dwyl/flutter-date-time-tutorial/assets/17494745/9d960e8d-0814-412e-9e9b-7f150683cc6d">
</p>

Awesome!
Now we're ready to rock 🎸!


## 2. (Option 1) `Material` Date/Time Pickers

Let's go over the first option,
which is arguably the most "mainstream" and common approach
when it comes to editing `DateTime` objects. 

With [`showDatePicker`](https://api.flutter.dev/flutter/material/showDatePicker.html)
and [`TimePicker`](https://api.flutter.dev/flutter/material/showTimePicker.html),
we can respectively spawn a Material Design date and time picker,
respectively. 

Let's see how this happens!
Before implementing,
we're going to be using the 
[`intl`](https://pub.dev/packages/intl)
package to correctly format the `DateTime` object
that is going to be shown and mutated.

Run `dart pub add intl`
and wait for the dependency to download.

After this, create `lib/material.dart`.
This file will contain the Material example page.


### 2.1 Editing **date** and **time** separately 

Head over to `lib/material.dart`
and add the following code:

```dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Material example page.
/// Showcases the usage of `DatePicker` and `TimePicker` to change date and time.
class MaterialExamplePage extends StatefulWidget {
  const MaterialExamplePage({super.key});

  @override
  State<MaterialExamplePage> createState() => _MaterialExamplePageState();
}

class _MaterialExamplePageState extends State<MaterialExamplePage> {
  DateTime dateTime = DateTime.now();

  /// Opens date picker and returns possible `DateTime` object.
  Future<DateTime?> pickDate() => showDatePicker(context: context, initialDate: dateTime, firstDate: DateTime(1900), lastDate: DateTime(2100));

  /// Opens time picker and returns possible `TimeOfDay` object.
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
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade300),
                      child: const Text(
                        "Date",
                        style: TextStyle(fontSize: 20),
                      ),
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
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade300),
                      child: const Text(
                        "Time",
                        style: TextStyle(fontSize: 20),
                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
```

Let's break down the code we've implemented.

- we've created a *stateful widget page* called `MaterialExamplePage`
which will be the page being shown when the person
selects the `Material` option in the bottom navigation bar.
- inside `_MaterialExamplePageState`,
we have a `DateTime` field, 
which pertains to the [`DateTime`](https://api.flutter.dev/flutter/dart-core/DateTime-class.html) 
object being shown and edited by the person.
- we've created **`pickDate`** and **`pickTime`**
functions that, when invoked,
use `showDatePicker` and `showTimePicker`, respectively.
Calling these functions will show the picker widget dialogue.
- we are using the [`DateFormat`](https://api.flutter.dev/flutter/intl/DateFormat-class.html) 
class from `intl` package
to correctly format the `dateTime` object
and show it to the person.
- we are rendering two `ElevatedButtons`
that call `pickDate` and `pickTime` functions.

Now, we just need to use this page
in `lib/main.dart`.
Change the `_pages` field so it uses this newly created page.

```dart
final List<Widget> _pages = <Widget>[
  const MaterialExamplePage(),
  const Text(
    'Cupertino widget',
    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  )
];
```

If we run the app,
we'll be able to *separately* 
set the date and the time components
of the `dateTime` object.


<p align='center'>
    <img width="250" src="https://github.com/dwyl/flutter-date-time-tutorial/assets/17494745/81701f8d-3e32-42b4-958c-486e0303b67f">
</p>


### 2.2 Editing **date** and **time** with single button

Instead of having separate buttons
to edit the `date` and `time` in an isolated manner,
let's change both at the same time by just clicking a single button.

For this, add a new `ElevatedButton` below the ones
we've already added.

```dart
@override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Other widgets...

            // Add this line
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                      onPressed: pickDateTime,
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
```

Let's implement the `pickDateTime` function.
In the same class `_MaterialExamplePageState`,
create this function above the `build` one.

```dart
  /// Opens date picker and time picker consecutively and sets the `DateTime` field of the page.
  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return; // pressed 'CANCEL'

    TimeOfDay? time = await pickTime();
    if (time == null) return; // pressed 'CANCEL'

    // Update datetime object that's shown with new date
    final newDateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(
      () => dateTime = newDateTime,
    );
  }
```

As you can see, 
we are simply calling the functions
we've already implemented (`pickDate` and `pickTime`)
and are updating the `dateTime` field accordingly.
Pretty simple, right?

Run the app and click the `DateTime` button
we've just added.
You should be able to set both *date* and *time*.


<p align='center'>
    <img width="250" src="https://github.com/dwyl/flutter-date-time-tutorial/assets/17494745/177751aa-408f-4887-9b7e-64f72b0d4351">
</p>
 
Great job! 🥳

