import 'package:flutter/material.dart';
import 'package:ingrowapp/constants/Colors.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    offset: const Offset(0, 0),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: MyColors.secondaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(999.0),
                        ),
                      ),
                      child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            Icons.insert_chart,
                            color: MyColors.primaryColor,
                          )),
                    ),
                    const Column(
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Make the login and register page",
                                style: TextStyle(
                                  color: MyColors.textColorGrey,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Inter",
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "You need to creat the login and register page, following the app layout on this link (https://figma.com/files/1af24fsrra22d98sadfta)",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: MyColors.textColor),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
