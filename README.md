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