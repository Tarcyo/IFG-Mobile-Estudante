import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

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

        gradient: RadialGradient(
          colors: [
            gradientColor,
            mainColor
          ],
          radius: 0.8,
          center: Alignment.center, 
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(screenWidth * 0.13), 
          bottomRight: Radius.circular(screenWidth * 0.13), 
        ),
        border: Border(

          bottom: BorderSide(
            color: Colors.transparent, 
            width: 5.0, 
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02, vertical: screenWidth * 0.02),
      child: Column(
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
              right
            ],
          ),
          SizedBox(height: screenHeight * 0.005),
          Center(
            child: center,
          ),
          SizedBox(
            height: screenHeight * 0.0005,
          ),
          bottom
        ],
      ),
    );
  }
}
