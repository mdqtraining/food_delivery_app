import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Edit Profile"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // PROFILE PICTURE
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.orange,
              child: Icon(Icons.person, color: Colors.white, size: 40),
            ),

            const SizedBox(height: 25),

            // INPUT FIELDS
            _inputField("Name", nameController),
            const SizedBox(height: 15),

            _inputField("Email", emailController),
            const SizedBox(height: 15),

            _inputField("Phone Number", phoneController),
            const SizedBox(height: 15),

            _inputField("Location", locationController),

            const SizedBox(height: 25),

            // SAVE BUTTON
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Come back to profile screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFA000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Save", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
