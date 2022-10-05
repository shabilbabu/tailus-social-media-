
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:flutter/foundation.dart';

class BottomController with ChangeNotifier{

 int currentIndex = 0;
    updateIndex(int newIndex){
      currentIndex = newIndex;
      notifyListeners();
    }
}