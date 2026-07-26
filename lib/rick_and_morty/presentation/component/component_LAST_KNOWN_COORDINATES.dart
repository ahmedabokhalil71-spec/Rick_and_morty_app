import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComponentLastKnownCoordinates extends StatelessWidget {
  final String location;

  const ComponentLastKnownCoordinates({super.key, required this.location});

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
                "LAST KNOWN COORDINATES",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 10.h),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Current Location",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 15.h),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                location,
                style: TextStyle(
                  color: Color(0xFFB2EB65),
                  fontSize: 20.sp,
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
