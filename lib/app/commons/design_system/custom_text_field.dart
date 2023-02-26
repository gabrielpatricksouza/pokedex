import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final Icon? icon;
  final bool password;
  final bool autofocus;
  final bool readOnly;
  final Function? onTapPassword;
  final Function? onChange;
  final Function? onTap;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {Key? key,
        required this.hintText,
        this.icon,
        required this.textInputType,
        this.controller,
        this.autofocus = false,
        this.password = false,
        this.readOnly = false,
        this.obscureText = false,
        this.onTapPassword,
        this.onTap,
        this.onChange, this.inputFormatters, this.labelText,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.black.withOpacity(0.7),
      ),
      textAlign: TextAlign.start,
      cursorColor: Colors.pinkAccent,
      onChanged: (String text){
        if(onChange != null){
          onChange!(text);
        }
      },

      onTap: (){
        if(onTap != null){
          onTap!();
        }
      },
      readOnly: readOnly,

      inputFormatters: inputFormatters,
      decoration: InputDecoration(

        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.black.withOpacity(0.7),
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey[700]),
        filled: true,
        fillColor: Colors.grey.shade200,
        alignLabelWithHint: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: icon,
        ),
        contentPadding:const EdgeInsets.fromLTRB(0, 18, 20, 18),
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
