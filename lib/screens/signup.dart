import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hidePass = true;
  bool hideConfirmPass = true;

  Widget inputField(String hint, {bool obscure = false, Widget? suffix}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 30),

              inputField("Name"),
              const SizedBox(height: 18),

              inputField("Email"),
              const SizedBox(height: 18),

              inputField(
                "Password",
                obscure: hidePass,
                suffix: IconButton(
                  icon: Icon(
                    hidePass ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => setState(() => hidePass = !hidePass),
                ),
              ),
              const SizedBox(height: 18),

              inputField(
                "Confirm Password",
                obscure: hideConfirmPass,
                suffix: IconButton(
                  icon: Icon(
                    hideConfirmPass ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () =>
                      setState(() => hideConfirmPass = !hideConfirmPass),
                ),
              ),

              const SizedBox(height: 18),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/home"); //
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFA000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("SIGN UP", style: TextStyle(fontSize: 16)),
                ),
              ),

              const SizedBox(height: 18),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, "/login"),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color(0xFFFFA000),
                        fontWeight: FontWeight.w600,
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
