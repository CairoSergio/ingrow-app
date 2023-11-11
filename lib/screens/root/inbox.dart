import 'package:flutter/material.dart';
import 'package:ingrowapp/constants/Colors.dart';
import 'package:ingrowapp/widgets/messagecard.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
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
                  "Edit",
                  style: TextStyle(
                      color: MyColors.primaryColor,
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  "Chats",
                  style: TextStyle(
                      color: MyColors.textColorGrey,
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.edit_note,
                    color: MyColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: TextField(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: MyColors.blueLow,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              color: MyColors.textColorlow,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            borderSide: BorderSide(
                              color: MyColors.secondaryColor,
                              width: 0.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            borderSide: BorderSide(
                              color: MyColors.primaryColor,
                              width: 1.0,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: MyColors.textSubtitlColor,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SingleChildScrollView(
              child: Column(
                children: [
                  MessageCard(
                    name: "Estagiarios - Niteki",
                    latestMessage: "Morning guys",
                    unViewed: 1,
                    isGroup: true,
                  ),
                  MessageCard(
                    name: "John Doe",
                    latestMessage: "Hey there!",
                    unViewed: 2,
                  ),
                  MessageCard(
                    name: "Alice Johnson",
                    latestMessage: "Let's catch up later",
                    unViewed: 0,
                  ),
                  MessageCard(
                    name: "Design Team",
                    latestMessage: "Meeting at 3 PM",
                    unViewed: 3,
                    isGroup: true,
                  ),
                  MessageCard(
                    name: "Sarah Smith",
                    latestMessage: "Are you free tomorrow?",
                    unViewed: 0,
                  ),
                  MessageCard(
                    name: "Support Team",
                    latestMessage: "New ticket assigned",
                    unViewed: 0,
                    isGroup: true,
                  ),
                  MessageCard(
                    name: "Marketing Team",
                    latestMessage: "Discussing the campaign",
                    unViewed: 2,
                    isGroup: true,
                  ),
                  MessageCard(
                    name: "David Anderson",
                    latestMessage: "Happy birthday!",
                    unViewed: 1,
                  ),
                  MessageCard(
                    name: "Project Updates",
                    latestMessage: "Project deadline extended",
                    unViewed: 0,
                    isGroup: true,
                  ),
                  MessageCard(
                    name: "Sophia Davis",
                    latestMessage: "How's your day going?",
                    unViewed: 1,
                  ),
                  MessageCard(
                    name: "Development Team",
                    latestMessage: "Code review requested",
                    unViewed: 2,
                    isGroup: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
