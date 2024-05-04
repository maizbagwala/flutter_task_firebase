import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyInputField extends StatefulWidget {
  String? hintText;
  bool? isPassword;
  TextInputType? inputType;
  TextEditingController? controller;
  bool? showPasswordButton;
  int? maxLength;
  String? labelText;
  double? padding;

  MyInputField(
      {super.key,
      this.hintText,
      this.isPassword,
      this.inputType,
      this.controller,
      this.showPasswordButton = false,
      this.maxLength,
      this.labelText,this.padding});

  @override
  State<MyInputField> createState() => _MyInputFieldState();
}

class _MyInputFieldState extends State<MyInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          )
        ],
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey, width: 1)),
          child: TextField(
            textAlignVertical:
                widget.showPasswordButton! ? TextAlignVertical.center : null,
            controller: widget.controller,
            obscureText: widget.isPassword ?? false,
            obscuringCharacter: "*",
            keyboardType: widget.inputType,
            inputFormatters: widget.maxLength != null
                ? <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(widget.maxLength)
                  ]
                : null,
            decoration: InputDecoration(
                suffixIcon: (widget.showPasswordButton! && widget.isPassword!)
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            widget.isPassword = !widget.isPassword!;
                          });
                        },
                        icon: const Icon(Icons.visibility_off),
                      )
                    : (widget.showPasswordButton! && !widget.isPassword!)
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                widget.isPassword = !widget.isPassword!;
                              });
                            },
                            icon: const Icon(Icons.visibility))
                        : null,
                hintText: widget.hintText,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 10)),
            style: const TextStyle(),
          ),
        ),
        SizedBox(
          height: widget.padding,)
      ],
    );
  }
}
