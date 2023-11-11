import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ingrowapp/constants/Colors.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var _isObscure;

  @override
  void initState() {
    super.initState();

    _isObscure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
              const Text(
                "Create an account to get started",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12,
                    color: MyColors.textColor),
              ),
              const SizedBox(height: 40),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: MyColors.textSubtitlColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: 'Ex: Cairo Sergio Ndava',
                          hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              color: MyColors.textColorlow,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: MyColors.borderColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: MyColors.primaryColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Email Address",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: MyColors.textSubtitlColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'cairosergiondava@gmail.com',
                          hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              color: MyColors.textColorlow,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: MyColors.borderColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: MyColors.primaryColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          color: MyColors.textSubtitlColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            hintText: 'Create password',
                            hintStyle: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                color: MyColors.textColorlow,
                                fontWeight: FontWeight.w400),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: MyColors.borderColor,
                                width: 1.0,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: _isObscure
                                  ? const Icon(
                                      Icons.visibility,
                                      color: MyColors.textColor,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: MyColors.textColor,
                                    ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: MyColors.primaryColor,
                                width: 2.0,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Confirm password',
                          hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              color: MyColors.textColorlow,
                              fontWeight: FontWeight.w400),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: MyColors.borderColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: MyColors.primaryColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: FilledButton(
                                onPressed: () {
                                  GoRouter.of(context).push("/subscription");
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                child: const Text("Signup")),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            height: 1,
                            color: MyColors.borderColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Text(
                          "or signup with",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              color: MyColors.textSubtitlColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                // GoRouter.of(context).push("/signup");
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    MyColors.secondaryColor),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/google.png'),
                                  const SizedBox(width: 20),
                                  const Text(
                                    "Signup with Google",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
