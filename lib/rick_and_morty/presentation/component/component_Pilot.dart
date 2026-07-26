import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComponentPilot extends StatelessWidget {
  final String time;
  const ComponentPilot({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFF282A2B),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.white, width: .2.w),
      ),
      width: double.infinity,
      height: 80.h,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Row(
          children: [
            Image.asset("assets/images/Overlay.png"),
            SizedBox(width: 15.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pilot",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
