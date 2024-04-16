import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hubtel_coding_challenge/features/history/views/history_tab.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8)
                ),
                child: TabBar(
                  indicatorColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  indicatorPadding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Center(child: Text('History')),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 2),
                      child: Center(child: Text('Transaction Summary')),
                    ),
                  ],
                ),
              ),
              Divider(thickness: 2, color: Colors.grey[300],),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              filled: true,
                              fillColor: Colors.grey[300],
                              contentPadding: const EdgeInsets.all(16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none
                              )
                            ),
                          )),
                          const SizedBox(width: 20,),
                          const Icon(Icons.menu, size: 32,color: Colors.black,)
                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            HistoryTab(),
                            Scaffold(),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  backgroundColor: Colors.teal
                ),
                onPressed: () {  },
                child: Row(
                  children: [
                    Icon(Icons.add_circle, size: 32, color: Colors.white,),
                    Text('SEND NEW', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16,),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
