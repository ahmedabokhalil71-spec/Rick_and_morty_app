import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ComponentImageDetails extends StatelessWidget {
  const ComponentImageDetails({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: image,
          width: double.infinity,
          height: 400.h,
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade700,
            child: Container(
              width: double.infinity,
              height: 400.h,
              color: Colors.white,
            ),
          ),
          errorWidget: (context, url, error) => Image.asset(
            "assets/images/character.png",
            width: double.infinity,
            height: 400.h,
            fit: BoxFit.cover,
          ),
        ),

        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),

        Positioned(
          left: 0.w,
          right: 0.w,
          bottom: 0.h,
          child: Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.centerLeft,
            color: Colors.black.withValues(alpha: 0.6),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
