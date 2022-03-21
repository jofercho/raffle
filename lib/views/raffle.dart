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
    RaffleTabsNavigation raffleTabsNavigation =
        context.watch<RaffleTabsNavigation>();
    return Scaffold(
      // appBar: AppBar(title: Text('Test')),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          raffleTabsNavigation.currentTab = index.toDouble();
        },
        children: [
          const RaffleList(),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
      bottomNavigationBar:
          RaffleBottomNavigationBar(pageController: pageController),
    );
  }
}

class RaffleBottomNavigationBar extends StatelessWidget {
  const RaffleBottomNavigationBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    RaffleTabsNavigation raffleTabsNavigation =
        Provider.of<RaffleTabsNavigation>(context);
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.info_outline,
            ),
            label: 'Info'),
      ],
      unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
      currentIndex: raffleTabsNavigation.currentTab.floor(),
      onTap: (index) {
        raffleTabsNavigation.currentTab = index.toDouble();
        pageController.animateToPage(index,
            curve: Curves.decelerate,
            duration: const Duration(milliseconds: 200));
        print('tap index: ' + index.toString());
      },
    );
  }
}
