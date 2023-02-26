import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldPassword extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final bool? visualizar;
  final bool password;
  final Function? onTapPassword;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController controller;

  const CustomTextFieldPassword(
      {Key? key,
        required this.hintText,
        required this.icon,
        required this.textInputType,
        required this.controller,
        this.password = false,
        this.obscureText = false,
        this.visualizar,
        this.onTapPassword,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      inputFormatters: [
        LengthLimitingTextInputFormatter(20),
      ],
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.black.withOpacity(0.7),
      ),
      textAlign: TextAlign.start,
      cursorColor: Colors.pinkAccent,
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.black.withOpacity(0.7),
        ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade200,
        alignLabelWithHint: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: icon,
        ),
        suffixIcon: password ? GestureDetector(
          onTap: (){
            onTapPassword!();
          },
          child: Icon(
            visualizar! ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            color: Colors.grey[700],
          ),
        ): null,
        contentPadding:const EdgeInsets.fromLTRB(0, 18, 0, 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(
            width: 1.18,
            color: Colors.transparent,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.transparent,
          ), //Color(0xff1a1919)
        ),
      ),
    );
  }
}
