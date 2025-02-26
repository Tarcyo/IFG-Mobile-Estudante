
import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/painters/headerPainter.dart';

class HeaderBuilderWidget extends StatelessWidget {
  final Widget left;
  final Widget right;
  final Widget center;
  final Widget top;
  final Widget bottom;

  const HeaderBuilderWidget({
    Key? key,
    required this.left,
    required this.right,
    required this.center,
    required this.top,
    required this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        gradient: LinearGradient(
          colors: [
            Colors.teal.shade900,
            Colors.green.shade700,
            Colors.green.shade500,
          ],
          stops: const [0.1, 0.5, 0.9],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(screenWidth * 0.13),
          bottomRight: Radius.circular(screenWidth * 0.13),
        ),
        border: const Border(
          bottom: BorderSide(
            color: Colors.transparent,
            width: 5.0,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenWidth * 0.02,
      ),
      child: Stack(
        children: [
    
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: CustomPaint(
                painter: headerPainter(),
              ),
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  left,
                  Expanded(
                    child: Center(
                      child: top,
                    ),
                  ),
                  right,
                ],
              ),
              SizedBox(height: screenHeight * 0.005),
              Center(
                child: center,
              ),
              SizedBox(height: screenHeight * 0.0005),
              bottom,
            ],
          ),
        ],
      ),
    );
  }
}


