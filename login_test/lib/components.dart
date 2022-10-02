import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_test/log_in.dart';
import 'package:login_test/sign_up.dart';

bool showPassword = true;
bool isEyeIconOpen = true;

class SetTheDisplays extends StatefulWidget {
  late String title;
  late bool isSignIn;

  SetTheDisplays(this.title, {this.isSignIn = false});

  @override
  State<SetTheDisplays> createState() => _SetTheDisplaysState();
}

class _SetTheDisplaysState extends State<SetTheDisplays> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF243D66),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Color(0xFFEBEDEE),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              setTextFields('Username'),
              widget.isSignIn
                  ? setTextFields('Email')
                  : const SizedBox.shrink(),
              setTextFields('Password', isPassword: true),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: RawMaterialButton(
                  onPressed: () {},
                  constraints: const BoxConstraints(
                      minHeight: 50, minWidth: double.infinity),
                  fillColor: const Color(0x99C282FA),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFEBEDEE),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Color(0xFFEBEDEE),
                    ),
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 18,
                      color: Color(0xFFEBEDEE),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Color(0xFFEBEDEE),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    setAltSignInOptions(FontAwesomeIcons.google),
                    setAltSignInOptions(FontAwesomeIcons.facebook),
                    setAltSignInOptions(FontAwesomeIcons.linkedin),
                    setAltSignInOptions(FontAwesomeIcons.github),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.isSignIn
                        ? 'Do you have an account?'
                        : 'Don\'t you have an account?',
                    style: const TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 16,
                      color: Color(0xFFEBEDEE),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.only(),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => widget.isSignIn
                              ? const LogIn()
                              : const SignInPage(),
                        ),
                      );
                    },
                    child: Text(
                      widget.isSignIn ? ' Log in' : ' Sign up',
                      style: const TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEBEDEE),
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEBEDEE),
                  ),
                ),
              ),
              !widget.isSignIn
                  ? const SizedBox(
                      height: 100,
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }

  TextButton setAltSignInOptions(IconData icon) {
    return TextButton(
      style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
      onPressed: () {},
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: Container(
          height: 60,
          width: 60,
          color: const Color(0x40C282FA),
          child: Icon(
            icon,
            size: 30,
            color: const Color(0xFFEBEDEE),
          ),
        ),
      ),
    );
  }

  Expanded setTextFields(String hint, {bool isPassword = false}) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            obscureText: isPassword ? showPassword : false,
            autocorrect: false,
            enableSuggestions: isPassword ? false : true,
            style: const TextStyle(
              fontFamily: 'SourceSansPro',
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
                contentPadding: isPassword
                    ? const EdgeInsets.only(
                        top: 8, right: 16, bottom: 16, left: 16)
                    : const EdgeInsets.all(16),
                isDense: true,
                filled: true,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0x506E61CA),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0xFF6E61CA),
                  ),
                ),
                labelText: hint,
                labelStyle: const TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Color(0xFFEBEDEE),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                suffix: isPassword
                    ? IconButton(
                        splashRadius: 20,
                        visualDensity: VisualDensity.compact,
                        icon: Icon(
                          isEyeIconOpen
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Color(0xFFEBEDEE),
                        ),
                        onPressed: () {
                          setState(() {
                            isEyeIconOpen = !isEyeIconOpen;
                            showPassword = !showPassword;
                          });
                        },
                      )
                    : null),
            cursorColor: const Color(0xFFC282FA),
          ),
        ),
      ),
    );
  }
}
