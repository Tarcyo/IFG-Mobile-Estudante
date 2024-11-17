import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/headerBuilder.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class StoryOfInstituteScreen extends StatefulWidget {
  final String story;

  StoryOfInstituteScreen(
    this.story, {
    Key? key,
  }) : super(key: key);

  @override
  _StoryOfInstituteScreenState createState() => _StoryOfInstituteScreenState();
}

class _StoryOfInstituteScreenState extends State<StoryOfInstituteScreen> {
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

  Widget _header(BuildContext context, screenWidth, screenHeight) {
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
            border: Border.all(color: mainColor, width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Icon(
              Icons.history,
              size: screenHeight * 0.1,
              color: mainColor,
            ),
          ),
        ),
        top: Text(
          "Histórico do IFG",
          style:
              TextStyle(fontSize: screenWidth * 0.06, color: backgroundColor),
        ),
        bottom: SizedBox(
          width: 3,
        ));
  }

  Widget _body(BuildContext context, screenWidth, screenHeight) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.02,
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
                      ClipRRect(
                        child: Container(
                          width: screenWidth * 0.75,
                          height: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage('assets/images/histórico.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        widget.story,
                        style: TextStyle(
                            color: messageTextColor,
                            fontSize: screenWidth * 0.032),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
