import 'package:flutter/material.dart';
import 'right_card.dart';
import 'right_screen.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';

class RightList extends StatefulWidget {
  final Map<String, dynamic> _data;

  RightList(this._data, {Key? key}) : super(key: key);

  @override
  _RightListState createState() => _RightListState();
}

class _RightListState extends State<RightList> {
  late List<Widget> _rules;

  @override
  void initState() {
    super.initState();
    _loadRules();
  }

  void _loadRules() {
    _rules = [];
    final List<String> keys = widget._data.keys.toList();
    for (String key in keys) {
      _rules.add(
        RightCard(key, onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RightScreen(key, widget._data[key]),
            ),
          );
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade100,
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

  Widget _header(
      BuildContext context, double screenWidth, double screenHeight) {
    return HeaderBuilderWidget(
      left: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
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
          color: Colors.white,
          border: Border.all(color: Colors.white, width: screenWidth * 0.0025),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.0125),
          child: Icon(
            Icons.task,
            size: screenWidth * 0.15,
            color: Colors.teal.shade900,
          ),
        ),
      ),
      top: Text(
        "Direitos e Deveres",
        style: TextStyle(fontSize: screenWidth * 0.06, color: Colors.white),
      ),
      bottom: Center(
        child: Column(
          children: [
            SizedBox(
              height: screenWidth * 0.0375,
            ),
            Text(
              "Selecione o tópico",
              style: TextStyle(
                  fontSize: screenWidth * 0.055, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context, double screenWidth, double height) {
    if (_rules.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._rules,
        ],
      );
    }
  }
}
