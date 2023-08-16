import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    required this.size, //size is required
    required this.title, //size is required
    required this.value, //size is required
    required this.color, //size is required
  });

  final Size size; //size is used in here
  String title; //
  int value; //
  Color color; //

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width * 0.4,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Text(value.toString(), style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
