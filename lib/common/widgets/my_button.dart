
import 'package:flutter/material.dart';
import '../colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function onPress;
  bool enable;

  MyButton(
      {super.key,
      required this.text,
      required this.onPress,
      this.enable = true});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.brandColor.withOpacity(enable ? 1 : 0.2),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          onPress();
        },
        child: Container(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          alignment: Alignment.center,
          width: double.maxFinite,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
