import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle/model/raflle_tabs_providers/raffle_tabs_model.dart';
import 'package:raffle/util/navigation.dart';
import 'package:raffle/views/raffle_list/raffle_list.dart';

class Raffle extends StatelessWidget {
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    RaffleTabsNavigationModel raffleTabsNavigation =
        context.watch<RaffleTabsNavigationModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () { 
          print('agregar contenido');
          Navigator.pushNamed(context, Navigation.addRaffle);
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          raffleTabsNavigation.currentTab = index;
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
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.red,
        notchMargin: 7,
        child: RaffleBottomNavigationBar(pageController: pageController),
      ),
      // ,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
    RaffleTabsNavigationModel raffleTabsNavigation =
        context.read<RaffleTabsNavigationModel>();
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => _onIconButtonPress(0, context),
            color: raffleTabsNavigation.getTabColor(0),
            icon: const Icon(
              Icons.home,
            )),
        IconButton(
            onPressed: () => _onIconButtonPress(1, context),
            color: raffleTabsNavigation.getTabColor(1),
            icon: const Icon(
              Icons.search,
            )),
        IconButton(
            onPressed: () => _onIconButtonPress(2, context),
            color: raffleTabsNavigation.getTabColor(2),
            icon: const Icon(
              Icons.info,
            )),
        IconButton(
            onPressed: () => _onIconButtonPress(3, context),
            color: raffleTabsNavigation.getTabColor(3),
            icon: const Icon(
              Icons.info,
            )),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 30.0))
      ],
    );
  }

  _onIconButtonPress(int index, BuildContext context) {
    RaffleTabsNavigationModel raffleTabsNavigation =
        context.read<RaffleTabsNavigationModel>();
    raffleTabsNavigation.currentTab = index;
    pageController.animateToPage(index,
        curve: Curves.decelerate, duration: const Duration(milliseconds: 200));
    print('tap index: ' + index.toString());
  }

  List<BottomNavigationBarItem> builBottomBarItems() {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.info_outline), label: 'Info'),
    ];
  }
}



// class RaffleBottomNavigationBar extends StatelessWidget {
//   const RaffleBottomNavigationBar({
//     Key? key,
//     required this.pageController,
//   }) : super(key: key);

//   final PageController pageController;

//   @override
//   Widget build(BuildContext context) {
//     RaffleTabsNavigation raffleTabsNavigation =
//         Provider.of<RaffleTabsNavigation>(context);
//     return BottomNavigationBar(
//       items: const [
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//             ),
//             label: 'Home'),
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.search,
//             ),
//             label: 'Search'),
//         BottomNavigationBarItem(
//             icon: Icon(
//               Icons.info_outline,
//             ),
//             label: 'Info'),
//       ],
//       unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
//       currentIndex: raffleTabsNavigation.currentTab.floor(),
//       onTap: (index) {
//         raffleTabsNavigation.currentTab = index.toDouble();
//         pageController.animateToPage(index,
//             curve: Curves.decelerate,
//             duration: const Duration(milliseconds: 200));
//         print('tap index: ' + index.toString());
//       },
//     );
//   }
// }
