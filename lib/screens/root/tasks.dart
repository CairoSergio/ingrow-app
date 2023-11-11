import 'package:flutter/material.dart';
import 'package:ingrowapp/constants/Colors.dart';
import 'package:ingrowapp/screens/root/finished.dart';
import 'package:ingrowapp/screens/root/inprogress.dart';
import 'package:ingrowapp/screens/root/todo.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
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
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "",
                  style: TextStyle(
                      color: MyColors.primaryColor,
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  "My Tasks",
                  style: TextStyle(
                      color: MyColors.textColorGrey,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    color: MyColors.primaryColor,
                    size: 26,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: MyColors.secondaryColor,
                  borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _toggleButton(context, title: "To-do", page: 0),
                  _toggleButton(context, title: "In progress", page: 1),
                  _toggleButton(context, title: "Finished", page: 2)
                ],
              ),
            ),
            Flexible(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                children: const [Todo(), InProgress(), Finished()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _toggleButton(BuildContext context,
      {required String title, required int page}) {
    return Expanded(
      child: SizedBox(
        height: 35,
        child: TextButton(
          onPressed: () {
            controller.animateToPage(page,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
          style: ButtonStyle(
            backgroundColor: _currentPage == page
                ? MaterialStateProperty.all(Colors.white)
                : null,
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: _currentPage == page
                      ? MyColors.textColorGrey
                      : MyColors.textColor),
            ),
          ),
        ),
      ),
    );
  }
}
