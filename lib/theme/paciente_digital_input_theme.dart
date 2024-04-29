import 'package:flutter/material.dart';

class PacienteDIgitalInputTheme{
  OutlineInputBorder _buildBorder(Color color){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: color,
        width: 2.0,
      )
    );
  }

  TextStyle _buildTextStyle(Color color,double size){
    return TextStyle(
      color: color,
      fontSize: size,
    );
  }

  InputDecorationTheme theme() => InputDecorationTheme(
    contentPadding: const EdgeInsets.all(20),
    floatingLabelBehavior:  FloatingLabelBehavior.always,
    enabledBorder: _buildBorder(Colors.lightBlueAccent),
    errorBorder: _buildBorder(Colors.red.shade500),
    focusedErrorBorder: _buildBorder(Colors.red),
    border: _buildBorder(Colors.lightBlueAccent.shade400),
    focusedBorder: _buildBorder(Colors.blueAccent),
    disabledBorder: _buildBorder(Colors.lightBlueAccent.shade400),

    suffixStyle:  _buildTextStyle(Colors.black, 16),
    counterStyle: _buildTextStyle(Colors.grey.shade800, 12),
    floatingLabelStyle: _buildTextStyle(Colors.black87, 16),
    errorStyle: _buildTextStyle(Colors.red, 12),
    helperStyle: _buildTextStyle(Colors.black87, 12),
    hintStyle: _buildTextStyle(Colors.black38, 16),
    labelStyle: _buildTextStyle(Colors.black, 16),
    prefixStyle: _buildTextStyle(Colors.black, 16)
  );
}