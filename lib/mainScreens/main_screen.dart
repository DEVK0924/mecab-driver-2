import 'package:flutter/material.dart';
import 'package:mecab_driver/tabPages/earning_tab.dart';
import 'package:mecab_driver/tabPages/home_tab.dart';
import 'package:mecab_driver/tabPages/profile_tab.dart';
import 'package:mecab_driver/tabPages/ratings_tab.dart';


class MainScreen extends StatefulWidget
{


  @override
  State<MainScreen> createState() => _MainScreenState();
}




class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{
  TabController? tabController;
  int selectedIndex = 0;

  // onclick show page here
  onItemClicked(int index)
  {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }
  //End


  // call this function is first and create 4 tabe on dashboard
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }
  // End


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: TabBarView(
       physics: const NeverScrollableScrollPhysics(),
       controller: tabController,
       children: const [
         HomeTabPage(),
         EarningsTabPage(),
         RatingsTabPage(),
         ProfileTabPage(),
       ],
     ),
      // Define Navigation bar or tab
      bottomNavigationBar: BottomNavigationBar(
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "Earning",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Ratings",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),

        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.yellow.shade200,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
