import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/headerBuilder.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class RightScreen extends StatefulWidget {
  final String _question;
  final String _answer;

  RightScreen(
    this._question,
    this._answer, {
    Key? key,
  }) : super(key: key);

  @override
  _RightScreenState createState() => _RightScreenState();
}

class _RightScreenState extends State<RightScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            _header(context, screenWidth, screenHeight),
            Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: _body(context, screenWidth, screenHeight)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(context, screenWidth, screenHeight) {
    return Column(children: [
      SizedBox(
        width: screenWidth * 0.025,
        height: screenWidth * 0.025,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: focusBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: EdgeInsets.all(screenWidth * 0.045),
              width: screenWidth * 0.888,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Regulamento: ",
                    style: TextStyle(
                        color: mainColor, fontSize: screenWidth * 0.055),
                    softWrap: true,
                  ),
                  SizedBox(
                    width: screenWidth * 0.025,
                    height: screenWidth * 0.025,
                  ),
                  Text(
                    widget._answer,
                    style: TextStyle(
                        color: messageTextColor, fontSize: screenWidth * 0.032),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ]);
  }

  Widget _header(
      BuildContext context, double screenWidth, double screenHeight) {
    return HeaderBuilder(
      left: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: backgroundColor,
          size: screenWidth * 0.08,
        ),
        onPressed: () => {Navigator.of(context).pop()},
      ),
      right: Icon(
        Icons.help_outline,
        color: Colors.transparent,
        size: screenWidth * 0.08,
      ),
      center: Container(
        height: screenHeight * 0.15,
        width: screenHeight * 0.15,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(color: mainColor, width: screenWidth * 0.0025),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.0125),
          child: Icon(
            Icons.task,
            size: screenWidth * 0.15,
            color: mainColor,
          ),
        ),
      ),
      top: Text(
        "Dúvidas Frequentes",
        style: TextStyle(fontSize: screenWidth * 0.06, color: backgroundColor),
      ),
      bottom: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenWidth * 0.0375,
            ),
            Center(
              child: Text(
                widget._question,
                style: TextStyle(
                    fontSize: screenWidth * 0.055, color: backgroundColor),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
