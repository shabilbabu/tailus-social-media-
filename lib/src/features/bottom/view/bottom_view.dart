import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailus/src/features/bottom/controller/bottom_controller.dart';

class BottomView extends StatelessWidget {
  const BottomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<BottomController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          controller.pages[controller.currentIndex],
          Positioned(
              bottom: 20, left: 40, right: 40, child: buildBottom(context))
        ],
      ),
    );
  }

  Material buildBottom(BuildContext context) {
    final controller = context.read<BottomController>();
    final controllerwatch = context.watch<BottomController>();
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colors.black,
      child: SizedBox(
        child: SizedBox(
          height: 70,
          width: double.infinity,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controllerwatch.data.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    controller.selectecdIndexUpdate(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.height * 0.057,
                    decoration: BoxDecoration(
                      border: index == controllerwatch.selectedIndex
                          ? Border(
                              top: BorderSide(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                  color: Colors.white))
                          : null,
                      gradient: index == controllerwatch.selectedIndex
                          ? const LinearGradient(
                              colors: [
                                  Color.fromARGB(255, 20, 163, 134),
                                  Colors.black
                                ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          : null,
                    ),
                    child: Icon(
                      controllerwatch.data[index],
                      size: 35,
                      color: index == controllerwatch.selectedIndex
                          ? Colors.white
                          : Colors.grey.shade800,
                    ),
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
