import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool hidePass = true;
  bool hideConfirmPass = true;

  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void updatePassword() {
    String pass = passwordController.text.trim();
    String confirm = confirmController.text.trim();

    if (pass.isEmpty || confirm.isEmpty) {
      showError("Password fields cannot be empty");
      return;
    }
    if (pass != confirm) {
      showError("Passwords do not match");
      return;
    }
    if (pass.length < 6) {
      showError("Password must be at least 6 characters");
      return;
    }

    // If everything is valid
    Navigator.pushReplacementNamed(context, "/login");
  }

  void showError(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }

  Widget inputBox(controller, String label, bool obscure, VoidCallback toggle) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
          onPressed: toggle,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Create New Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 30),

            inputBox(
              passwordController,
              "New Password",
              hidePass,
              () => setState(() => hidePass = !hidePass),
            ),
            const SizedBox(height: 18),

            inputBox(
              confirmController,
              "Confirm Password",
              hideConfirmPass,
              () => setState(() => hideConfirmPass = !hideConfirmPass),
            ),
            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: updatePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "UPDATE PASSWORD",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
