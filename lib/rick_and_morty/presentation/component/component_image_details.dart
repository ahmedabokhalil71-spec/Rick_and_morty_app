import 'package:flutter/material.dart';

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
        Image.network(
          image,
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              "assets/images/character.png",
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            );
          },
        ),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
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
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            color: Colors.black.withValues(alpha: 0.6),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
