import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailus/src/features/bottom/controller/bottom_controller.dart';
import 'package:tailus/src/features/home/view/home_view.dart';
import 'package:tailus/src/features/like/view/like_view.dart';
import 'package:tailus/src/features/profile/view/profile_view.dart';
import 'package:tailus/src/features/search/view/search_view.dart';

class BottomView extends StatelessWidget {
  const BottomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final controller = context.watch<BottomController>();
     final  List pages = [
      HomeView(),
      MessageView(),
      LikeView(),
      ProfileView()
     ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: pages[controller.currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: const EdgeInsets.only(left: 10, right: 10),
          currentIndex: controller.currentIndex,
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          // enableFloatingNavBar: false,
          onTap: (int value){
             context.read<BottomController>().updateIndex(value);
          },
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Color(0xff73544C),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite),
              selectedColor: Color(0xff73544C),
            ),

            /// Search
            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Color(0xff73544C),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Color(0xff73544C),
            ),
          ],
        ),
      ),
    );
  }
}