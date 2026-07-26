import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        color: Color(0XFF282A2B),
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
                "IDENTITY",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.h),

            Row(
              children: [
                const Text("Gender"),
                const Spacer(),
                Text(
                  gender,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.h),

            Row(
              children: [
                const Text("Origin"),
                const Spacer(),
                Text(
                  origin,
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
