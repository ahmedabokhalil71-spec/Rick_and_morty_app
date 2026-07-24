import 'package:flutter/material.dart';

class ComponentVitalSigns extends StatelessWidget {
  final String status;
  final String species;

  const ComponentVitalSigns({
    super.key,
    required this.status,
    required this.species,
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
                "VITAL SIGNS",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                const Text("Status"),
                const Spacer(),

                CircleAvatar(
                  radius: 5,
                  backgroundColor: status == "Alive"
                      ? Colors.green
                      : status == "Dead"
                      ? Colors.red
                      : Colors.grey,
                ),

                const SizedBox(width: 6),

                Text(
                  status,
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
                const Text("Species"),
                const Spacer(),
                Text(
                  species,
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
