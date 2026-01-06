import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool hidePass = true;
  bool hideConfirmPass = true;
  bool isLoading = false;

  // SIGNUP LOGIC
  Future<void> signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      showError("All fields are required");
      return;
    }

    if (password != confirmPassword) {
      showError("Passwords do not match");
      return;
    }

    try {
      setState(() => isLoading = true);

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      showError(e.message ?? "Signup failed");
    } finally {
      setState(() => isLoading = false);
    }
  }

  //  ERROR SNACKBAR
  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  //  INPUT FIELD
  Widget inputField(
    String hint, {
    required TextEditingController controller,
    bool obscure = false,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }

  //  UI
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

              inputField("Name", controller: nameController),
              const SizedBox(height: 18),

              inputField("Email", controller: emailController),
              const SizedBox(height: 18),

              inputField(
                "Password",
                controller: passwordController,
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
                controller: confirmPasswordController,
                obscure: hideConfirmPass,
                suffix: IconButton(
                  icon: Icon(
                    hideConfirmPass ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () =>
                      setState(() => hideConfirmPass = !hideConfirmPass),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isLoading ? null : signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFA000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("SIGN UP", style: TextStyle(fontSize: 16)),
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
