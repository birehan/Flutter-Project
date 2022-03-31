import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 3, 39),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 3, 39),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          iconSize: 30.0,
          color: Colors.white.withOpacity(0.7),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
      ),
      body: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isFocus = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          // start .. container of header image

          // end .. container of header image

          // start .. container of header login text

          Container(
            margin:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 5),
            alignment: Alignment.center,
            child: const Text(
              "Create Account",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),

          // end .. container of header login text

          // start .. container of fill form text
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
            alignment: Alignment.center,
            child: Text(
              "Please fill the form below here",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.w600),
            ),
          ),
          // end .. container of fill form text

          inputMethod(
              Icons.person_outline, "Full Name", "Enter your full name"),
          inputMethod(
              Icons.email_outlined, "Email", "Enter your email account"),
          inputMethod(
              Icons.lock_outline_rounded, "Password", "Enter your password"),
          inputMethod(Icons.lock_outline_rounded, "Confirm Password",
              "Enter your password"),
          // inputMethod(),

          // start ...login button container
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 45, right: 45),
                  primary:
                      const Color.fromARGB(255, 56, 231, 243), // background
                  onPrimary: const Color.fromARGB(255, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))
                  // foreground
                  ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text(
                "Sign UP",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            )),
          ),
          // end ... login button container

          // start ... forget password

          // end ... forget password

          // Start  ... don't have an account
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.15,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                    TextButton(
                        onPressed: () {
                          // Navigate back to the first screen by popping the current route
                          // off the stack.
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            color: Color.fromARGB(255, 56, 231, 243),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          // end  ... don't have an account
        ],
      ),
    );
  }

  // start input field widget
  Widget inputMethod(IconData icon, String inputName, String hint) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: TextFormField(
          obscureText:
              inputName == "Password" || inputName == "Confirm Password",
          keyboardType: inputName == "Email"
              ? TextInputType.emailAddress
              : TextInputType.text,
          showCursor: true,
          style: const TextStyle(color: Colors.white, fontSize: 17),
          decoration: InputDecoration(
              // contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              focusedErrorBorder: OutlineInputBorder(
                gapPadding: 8,
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 19, 91, 150)),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                gapPadding: 8,
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 19, 91, 150)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1, color: Color.fromARGB(255, 19, 91, 150)),
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(
                icon,
                color: const Color.fromARGB(255, 136, 133, 133),
              ),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 82, 82, 82), fontSize: 15),
              labelText: inputName,
              labelStyle: const TextStyle(color: Colors.white)),
          onSaved: (String? value) {
            // This optional block of code can be used to run
            // code when the user saves the form.
          },
          controller: (inputName == "Password")
              ? _pass
              : (inputName == "Confirm Password")
                  ? _confirmPass
                  : null,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return '$inputName can not be empty';
            }
            if (value.length < 5) {
              return '$inputName can not be less than 5 characters';
            }
            if (inputName == "Confirm Password" && value != _pass.text) {
              return "Password don't match";
            }
            return null;
          },
        ),
      ),
    );
  }
}

// end input field widget
