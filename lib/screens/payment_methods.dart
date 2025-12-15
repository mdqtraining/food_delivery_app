import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  Widget paymentMethodTile({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.orange, size: 28),
            const SizedBox(width: 15),

            // Text section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment Methods")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paymentMethodTile(
              icon: Icons.credit_card,
              title: "Credit / Debit Card",
              subtitle: "**** **** **** 1234",
              onTap: () {
                print("Card tapped");
              },
            ),

            paymentMethodTile(
              icon: Icons.qr_code, // UPI → correct icon
              title: "UPI",
              subtitle: "vicky@upi",
              onTap: () {
                print("UPI tapped");
              },
            ),

            paymentMethodTile(
              icon: Icons.money, // Cash
              title: "Cash on Delivery",
              subtitle: "Pay when you receive",
              onTap: () {
                print("Cash tapped");
              },
            ),
          ],
        ),
      ),
    );
  }
}
