import 'package:flutter/material.dart';

class ComponentIdentity extends StatelessWidget {
  final String gender;
  final String origin;

  const ComponentIdentity({
    super.key,
    required this.gender,
    required this.origin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0XFF282A2B),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white, width: .2),
      ),
      width: double.infinity,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "IDENTITY",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                const Text("Gender"),
                const Spacer(),
                Text(
                  gender,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                const Text("Origin"),
                const Spacer(),
                Text(
                  origin,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
