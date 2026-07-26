import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.white, width: .2.w),
      ),
      width: double.infinity,
      height: 120.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "VITAL SIGNS",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 20.h),

            Row(
              children: [
                const Text("Status"),
                const Spacer(),

                CircleAvatar(
                  radius: 5.r,
                  backgroundColor: status == "Alive"
                      ? Colors.green
                      : status == "Dead"
                      ? Colors.red
                      : Colors.grey,
                ),

                SizedBox(width: 6.w),

                Text(
                  status,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            Row(
              children: [
                Text("Species"),
                Spacer(),
                Text(
                  species,
                  style: TextStyle(
                    fontSize: 15.sp,
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
