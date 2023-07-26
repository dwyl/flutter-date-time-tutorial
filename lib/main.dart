import 'package:app/cupertino.dart';
import 'package:flutter/material.dart';

import 'material.dart';

final materialPageKey = UniqueKey();
final materialButtonKey = UniqueKey();
final cupertinoPageKey = UniqueKey();
final cupertinoButtonKey = UniqueKey();

// coverage:ignore-start
void main() => runApp(const App());
// coverage:ignore-end

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
  final List<Widget> _pages = <Widget>[MaterialExamplePage(key: materialPageKey), CupertinoExamplePage(key: cupertinoPageKey)];

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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(key: materialButtonKey,Icons.adjust),
            label: 'Material',
          ),
          BottomNavigationBarItem(
            icon: Icon(key: cupertinoButtonKey, Icons.power_input_sharp),
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
