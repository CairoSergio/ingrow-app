import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ingrowapp/constants/Colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                color: MyColors.secondaryColor,
                image: DecorationImage(
                  image: AssetImage('assets/images/login_vector.png'),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome!",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w800,
                                fontSize: 24),
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            "Email Address",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: MyColors.textSubtitlColor),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: 'Email address',
                                hintStyle: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 13,
                                    color: MyColors.textColorlow,
                                    fontWeight: FontWeight.w400),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: MyColors.borderColor,
                                    width: 1.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                    color: MyColors.primaryColor,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Password",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                color: MyColors.textSubtitlColor),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                  hintText: 'Password',
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
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "Forgot password?",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: FilledButton(
                                    onPressed: () {
                                      GoRouter.of(context).go("/root");
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                    child: const Text("Login")),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
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
                                        "Login with Google",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Not a member?",
                              style: TextStyle(color: MyColors.textColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push('/signup');
                              },
                              child: const Text(
                                " Register now",
                                style: TextStyle(color: MyColors.primaryColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
