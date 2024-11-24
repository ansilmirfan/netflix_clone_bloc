import 'package:flutter/material.dart';
import 'package:netflix_clone_bloc/features/home_screen/ui/home_screen.dart';
import 'package:netflix_clone_bloc/features/my_netflix_screen/user_profile_screen.dart';
import 'package:netflix_clone_bloc/features/new&hot/ui/new_and_hot_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      controller = TabController(length: 4, vsync: this);
    }

    void switchTab(int index) {
      controller.animateTo(index);
    }

    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          const HomeScreen(),
          Container(),
          NewAndHotScreen(),
          UserProfileScreen(
            onTabChange: switchTab,
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: TabBar(
          controller: controller,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade700,
          indicatorColor: Colors.transparent,
          tabs: [
            const Tab(
              text: 'Home',
              icon: Icon(Icons.home),
            ),
            const Tab(
              text: 'Games',
              icon: Icon(Icons.gamepad),
            ),
            const Tab(
              text: 'New & Hot',
              icon: Icon(Icons.photo_library_outlined),
            ),
            Tab(
              text: 'My Netflix',
              icon: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset('Asset/netflix user.jpg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
