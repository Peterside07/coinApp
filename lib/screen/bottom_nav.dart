import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<List> icons;
  const BottomNav(
      {Key? key,
      required this.currentIndex,
      required this.onTap,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        fontFamily: 'Lota',
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'Lota',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      items: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                BottomNavigationBarItem(
                  icon: e[0],
                  label: e[1],
                ),
              ))
          .values
          .toList(),
    );
  }
}
