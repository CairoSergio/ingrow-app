import 'package:flutter/material.dart';
import 'package:ingrowapp/constants/Colors.dart';

enum Plans { yearly, mothly, weekly }

class PlanCard extends StatefulWidget {
  final Plans plans;
  final bool isSelected;
  final Function(Plans) onPress;
  const PlanCard(
      {required this.onPress,
      required this.plans,
      this.isSelected = false,
      super.key});

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  Map<String, String>? plan;

  @override
  void initState() {
    super.initState();
    plan = getPlansProps();
  }

  Map<String, String> getPlansProps() {
    switch (widget.plans) {
      case Plans.yearly:
        return {
          'plan': 'Yearly',
          'discount': '-66% discount',
          'price': '€94.80',
          'feq': 'every year'
        };
      case Plans.weekly:
        return {'plan': 'Weekly', 'price': '€5.90', 'feq': ' every week'};
      case Plans.mothly:
        return {
          'plan': 'Monthly',
          'discount': '-53% discount',
          'price': '€10.90',
          'feq': 'every month'
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPress(widget.plans);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: widget.isSelected ? MyColors.secondaryColor : Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              border: widget.isSelected
                  ? Border.all(width: 0.5, color: MyColors.secondaryColor)
                  : Border.all(width: 0.5, color: MyColors.borderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      widget.isSelected
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: MyColors.primaryColor,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            )
                          : Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: MyColors.borderColor, width: 1),
                              ),
                            ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${plan!['plan']}',
                            style: const TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w800,
                                fontSize: 16),
                          ),
                          if (plan!['discount'] != null)
                            Text(
                              '${plan!['discount']}',
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: MyColors.primaryColor),
                            )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${plan!['price']}',
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
                      Text(
                        '${plan!['feq']}',
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: MyColors.textColorGrey),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          if (plan!['plan'] == 'Yearly')
            Positioned(
              top: -10,
              right: -10,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.white,
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
