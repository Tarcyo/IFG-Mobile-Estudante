import 'package:flutter/material.dart';
import 'questionCard.dart';
import 'answerScreen.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/headerBuilder.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';
class QuestionsList extends StatefulWidget {
  final Map<String, dynamic> _data;

  QuestionsList(this._data, {Key? key}) : super(key: key);

  @override
  _QuestionsListState createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  late List<Widget> _questions;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    _questions = [];
    final List<String> keys = widget._data.keys.toList();
    for (String key in keys) {
      _questions.add(
        QuestionCard(key, onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnswerScreen(key, widget._data[key]),
            ),
          );
        }),
      );
      _questions.add(const SizedBox(
        width: 40,
        height: 40,
      ));
    }
  }

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
          border: Border.all(color: mainColor, width: screenWidth * 0.0025),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.0125),
          child: Icon(
            Icons.question_mark,
            size: screenHeight * 0.1,
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
            Text(
              "Qual é sua dúvida?",
              style:
                  TextStyle(fontSize: screenWidth * 0.055, color: backgroundColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context, screenWidth, screenHeight) {
    if (_questions.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.0125,
            height: screenHeight * 0.02,
          ),
          ..._questions,
        ],
      );
    }
  }
}
