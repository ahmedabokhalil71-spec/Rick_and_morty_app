import 'package:flutter/material.dart';

class ComponentPilot extends StatelessWidget {
  final String time;
  const ComponentPilot({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFF282A2B),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white, width: .2),
      ),
      width: double.infinity,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Image.asset("assets/images/Overlay.png"),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pilot",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(time),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
