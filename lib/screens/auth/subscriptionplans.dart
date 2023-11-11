import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ingrowapp/constants/Colors.dart';
import 'package:ingrowapp/widgets/PlanCard.dart';

class SubscriptionPlans extends StatefulWidget {
  const SubscriptionPlans({super.key});

  @override
  State<SubscriptionPlans> createState() => _SubscriptionPlansState();
}

class _SubscriptionPlansState extends State<SubscriptionPlans> {
  Map<Plans, bool> planActive = {
    Plans.yearly: true,
    Plans.mothly: false,
    Plans.weekly: false,
  };
  Plans activedBenefit = Plans.yearly;

  void changeActivaction(Plans plans) {
    planActive.forEach((key, value) {
      planActive[key] = false;
    });
    setState(() {
      planActive[plans] = true;
      activedBenefit = plans;
    });
  }

  String getBenefitPrice() {
    switch (activedBenefit) {
      case Plans.mothly:
        return "€10.90";
      case Plans.weekly:
        return "€5.90";
      case Plans.yearly:
        return "€94.80";
    }
  }

  Map<Plans, List<String>> benefits = {
    Plans.mothly: [
      "Unlimited access",
      "50GB storage",
      "Sync all your devices",
      "Can signup 50 users",
    ],
    Plans.weekly: [
      "Unlimited access during the week",
      "10GB storage",
      "Sync all your devices during the week",
      "Can signup 25 users"
    ],
    Plans.yearly: [
      "Unlimited access",
      "200GB storage",
      "Sync all your devices",
      "Can signup 100 users"
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Choose your\n subscription plan",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "And get a 7-day free trial",
                style: TextStyle(
                    color: MyColors.textColor, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 48,
              ),
              PlanCard(
                onPress: changeActivaction,
                isSelected: planActive[Plans.yearly]!,
                plans: Plans.yearly,
              ),
              const SizedBox(
                height: 12,
              ),
              PlanCard(
                onPress: changeActivaction,
                isSelected: planActive[Plans.mothly]!,
                plans: Plans.mothly,
              ),
              const SizedBox(
                height: 12,
              ),
              PlanCard(
                onPress: changeActivaction,
                isSelected: planActive[Plans.weekly]!,
                plans: Plans.weekly,
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: MyColors.secondaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 0, 24),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "You'll get:",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: benefits[activedBenefit]!.map(
                              (e) {
                                return Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: MyColors.primaryColor,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          e,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    )
                                  ],
                                );
                              },
                            ).toList(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          GoRouter.of(context)
                              .push('/payment/${getBenefitPrice()}');
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        child: const Text("Subscribe"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
