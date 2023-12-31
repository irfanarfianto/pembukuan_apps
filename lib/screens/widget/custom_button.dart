import 'package:flutter/material.dart';
import 'package:pembukuan_apps/utils/design_system.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final IconData iconData;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.iconData,
      this.backgroundColor = DesignSystem.purpleAccent,
      this.textColor = DesignSystem.whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        onPrimary: textColor,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(iconData),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
