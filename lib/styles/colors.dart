import 'package:flutter/material.dart';

// Definindo as cores:
Color _mainColor = Color(0xFF2B9F3F);
Color _gradientColor =  Color(0xFF4CAF50);
Color _backgroundColor = Colors.white;
Color _messageTextColor = Colors.black;
Color _alertColor = Colors.amber[600]!;
Color _urgentAlertColor = Colors.red;
Color _onTapButtonColor = Colors.blueGrey;
Color _focusBackgroundColor = Color(0xFFF0F0F1);
Color _bannerColor = Colors.black54;

Color get mainColor => _mainColor;

Color get gradientColor => _gradientColor;


Color get backgroundColor => _backgroundColor;

Color get alertColor => _alertColor;

Color get urgentAlertColor => _urgentAlertColor;

Color get onTapButtonColor => _onTapButtonColor;

Color get messageTextColor => _messageTextColor;

Color get bannerColor => _bannerColor;

Color get focusBackgroundColor => _focusBackgroundColor;

setDarkMode(bool isDarkMode) {
  if (isDarkMode) {
    _backgroundColor = Color(0xFF2B2E32);
    _messageTextColor = Colors.white;
    _focusBackgroundColor = Color(0xFF383D42);
  } else {
    _backgroundColor = Color(0xFFE8EAED);
    _focusBackgroundColor = Color(0xFFFFFFFFF);
    _messageTextColor = Colors.black;
  }
}
