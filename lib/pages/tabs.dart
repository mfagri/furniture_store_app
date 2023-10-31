import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabs1 extends StatelessWidget {
  final Widget icon;
  final String tabName;
  final int index;
  final int selectedIndex;
  final Function onTap;

  const Tabs1({
    Key? key,
    required this.icon,
    required this.tabName,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isActive = index == selectedIndex;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: isActive
                ? Colors.black
                : Colors.grey[200], // Active tab is black, others are gray[200]
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                if (isActive) const SizedBox(width: 20),
                if (isActive)
                  Text(
                    tabName,
                    style: TextStyle(
                      color: isActive
                          ? Colors.white
                          : Colors.grey[800], // Text color
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}