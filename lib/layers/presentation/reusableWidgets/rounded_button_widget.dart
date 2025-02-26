import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const RoundedButtonWidget(
    this.text, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: screenWidth * 0.3,
      height: screenWidth * 0.12,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green.shade100,
            Colors.green.shade700,
            Colors.teal.shade900,
          ],
          stops: const [0.1, 0.5, 0.9],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screenWidth * 0.13),
          topRight: Radius.circular(screenWidth * 0.13),
        ),
        border: const Border(
          bottom: BorderSide(
            color: Colors.transparent,
            width: 5.0,
          ),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.teal.shade900,
          elevation: 1.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 180),
          ),
          foregroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
            ),
          ],
        ),
      ),
    );
  }
}
