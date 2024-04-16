import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/features/history/views/history_view.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List tabs = [
      {
        "title": "Home",
        "screen": const Scaffold(),
        "icon": const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.tealAccent,
          child: Icon(Icons.home_outlined, color: Colors.black, size: 32,),
        )
      },{
        "title": "Send",
        "screen": const Scaffold(),
        "icon": const Icon(Icons.send_to_mobile)
      },{
        "title": "History",
        "screen": const HistoryView(),
        "icon": const Icon(Icons.text_snippet_outlined)
      },{
        "title": "Scheduled",
        "screen": const Scaffold(),
        "icon": const Icon(Icons.calendar_today_rounded)
      },
    ];
    return Scaffold(
      body: tabs[currentIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedLabelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, ),
        selectedItemColor: Colors.black,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey[400]!,
          size: 32
        ),
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 32
        ),
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,
        items: tabs.map((e) => BottomNavigationBarItem(icon: e['icon'], label: e['title'])).toList(),
      ),
    );
  }
}
