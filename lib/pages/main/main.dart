import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import 'initialize_items.dart';

class FMMainPage extends StatefulWidget {
  @override
  _FMMainPageState createState() => _FMMainPageState();
}

class _FMMainPageState extends State<FMMainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        items: items,
        onTap: (index){
            setState(() {
              _currentIndex = index;
            });
        },
      ),
    );
  }
}


