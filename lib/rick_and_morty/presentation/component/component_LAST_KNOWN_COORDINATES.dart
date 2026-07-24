import 'package:flutter/material.dart';

class ComponentLastKnownCoordinates extends StatelessWidget {
  final String location;

  const ComponentLastKnownCoordinates({super.key, required this.location});

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
                "LAST KNOWN COORDINATES",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Current Location",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                location,
                style: const TextStyle(
                  color: Color(0xFFB2EB65),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
