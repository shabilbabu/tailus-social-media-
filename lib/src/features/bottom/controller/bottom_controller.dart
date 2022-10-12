import 'package:flutter/material.dart';
import 'package:tailus/src/features/home/view/home_view.dart';
import 'package:tailus/src/features/like/view/like_view.dart';
import 'package:tailus/src/features/profile/view/profile_view.dart';
import 'package:tailus/src/features/search/view/search_view.dart';

class BottomController with ChangeNotifier{

   int selectedIndex = 0;
  int currentIndex = 0;

  List<IconData> data = [
    Icons.home_outlined,
    Icons.add_box_outlined,
    Icons.favorite_outline_sharp,
    Icons.person_outline_sharp,
  ];
  List pages = [
      const HomeView(),
      const MessageView(),
      const LikeView(),
      const ProfileView()
    ];

  selectecdIndexUpdate(int index) {
    selectedIndex = index;
    currentIndex = index;
    notifyListeners();
  }
}