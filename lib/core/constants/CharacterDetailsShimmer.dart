import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterDetailsShimmer extends StatelessWidget {
  const CharacterDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: double.infinity,
              height: 400.h,
              color: Colors.white,
            ),

            const SizedBox(height: 20),

            // Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(width: 220.w, height: 30.h, color: Colors.white),
            ),

            SizedBox(height: 20.h),

            _section(),

            SizedBox(height: 16.h),

            _section(),

            SizedBox(height: 16.h),

            _section(lastSection: true),

            SizedBox(height: 24.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(width: 180.w, height: 24.h, color: Colors.white),
            ),

            SizedBox(height: 16.h),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: 6,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (_, __) => Container(
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _section({bool lastSection = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 120.w, height: 18.h, color: Colors.grey),
            SizedBox(height: 18.h),
            _line(),
            SizedBox(height: 14.h),
            _line(),
            if (lastSection) ...[
              SizedBox(height: 14.h),
              Container(width: 180.w, height: 20.h, color: Colors.grey),
            ],
          ],
        ),
      ),
    );
  }

  static Widget _line() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: 90.w, height: 14.h, color: Colors.grey),
        Container(width: 120.w, height: 14.h, color: Colors.grey),
      ],
    );
  }
}
