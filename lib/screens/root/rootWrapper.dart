import 'package:flutter/material.dart';
import 'package:ingrowapp/constants/Colors.dart';
import 'package:ingrowapp/screens/root/explore.dart';
import 'package:ingrowapp/screens/root/inbox.dart';
import 'package:ingrowapp/screens/root/profile.dart';
import 'package:ingrowapp/screens/root/tasks.dart';

class RootWrapper extends StatefulWidget {
  const RootWrapper({super.key});

  @override
  State<RootWrapper> createState() => _RootWrapperState();
}

class _RootWrapperState extends State<RootWrapper> {
  final controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        children: const [Explore(), Inbox(), Tasks(), Profile()],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bottomAppBarItem(
                icon: Icons.explore,
                page: 0,
                context,
                label: "Explore",
              ),
              _bottomAppBarItem(
                  icon: Icons.mail_rounded, page: 1, context, label: "Inbox"),
              _bottomAppBarItem(
                  icon: Icons.insert_chart, page: 2, context, label: "Taks"),
              _bottomAppBarItem(
                  icon: Icons.person, page: 3, context, label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required int page, required label}) {
    return GestureDetector(
      onTap: () {
        controller.animateToPage(page,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
            color:
                _currentPage == page ? MyColors.primaryColor : MyColors.greyLow,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Inter",
              color: _currentPage == page
                  ? MyColors.primaryColor
                  : MyColors.greyLow,
              fontWeight:
                  _currentPage == page ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
