import 'package:flutter/material.dart';
import 'package:ingrowapp/constants/Colors.dart';

class MessageCard extends StatefulWidget {
  final String name;
  final String latestMessage;
  final int unViewed;
  final bool isGroup;
  const MessageCard(
      {required this.name,
      required this.latestMessage,
      required this.unViewed,
      this.isGroup = false,
      super.key});

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius
                .zero, // Define o raio das bordas como zero para remover o arredondamento
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: MyColors.secondaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(999.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: widget.isGroup
                      ? const Icon(Icons.groups)
                      : const Icon(Icons.person),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      color: MyColors.textColorGrey,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Inter",
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    widget.latestMessage,
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: MyColors.textColor),
                  )
                ],
              ),
            ],
          ),
          if (widget.unViewed > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                widget.unViewed.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            )
        ],
      ),
    );
  }
}
