import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle/model/raflle_tabs_providers/raffle_tabs.dart';
import 'package:raffle/views/raffle_list/raffle_list.dart';

class Raffle extends StatelessWidget {
  List<BottomNavigationBarItem> builBottomBarItems() {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.info_outline), label: 'Info'),
    ];
  }

  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  // const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double currentTab = context.watch<RaffleTabsNavigation>().currentTab;
    return Scaffold(
      // appBar: AppBar(title: Text('Test')),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          print(index);
          // currentTab = index as double;
        },
        children: [
          RaffleList(),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
      // body: PageView.builder(
      //   itemBuilder: (context, index) {
      //     print('current page '+currentTab.toString());
      //     if (index == currentTab.floor()) {
      //       return Transform(
      //         transform: Matrix4.identity()..rotateX(currentTab - index),
      //         child: Container(
      //           color: index % 2 == 0 ? Colors.blue : Colors.pink,
      //           child: Center(
      //             child: Text(
      //               'Page $currentTab',
      //               style: TextStyle(color: Colors.white, fontSize: 22.0),
      //             ),
      //           ),
      //         ),
      //       );
      //     }else if(index == currentTab.floor() + 1){
      //       return Transform(transform: Matrix4.identity()..rotateX(currentTab - index), 
      //       child: Container(
      //         color: index % 2 == 0? Colors.blue : Colors.pink,
      //         child: Center(child: Text('Page $currentTab', style: TextStyle(color: Colors.white, fontSize: 22.0),)),
      //       ),);
      //     } else{
      //       return Container(
      //         color: index % 2 == 0? Colors.blue : Colors.pink,
      //         child: Center(child: Text('Page $currentTab', style: TextStyle(color: Colors.white, fontSize: 22.0),)),
      //       );
      //     }
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: builBottomBarItems(),
        onTap: (index) {
          currentTab = index.toDouble();
          pageController.animateToPage(index, curve: Curves.decelerate, duration: Duration(seconds: 1));
          print('tap index: '+index.toString());
        },
      ),
    );
  }
}
