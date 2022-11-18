import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final TextEditingController controller;

  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;

  final bool readOnly;
  final Widget leading;
  final Function()? function;
  final String? hint;
  final VoidCallback? onTap;
  final bool suffix;
  final bool obscure;
  final Widget? suffixIcon;
   final Widget? prefixIcon;
  final int? max;
  final int? min;
  final int? length;

  const Field({
    Key? key,
    required this.controller,

    this.hint,
    this.validator,
    this.function,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.leading = const SizedBox(
      width: 0,
      height: 0,
    ),
    this.max,
    this.length,
    this.min,
    this.onTap,
    this.suffix = true,
    this.obscure = false,
    this.suffixIcon,
    this.prefixIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
           decoration: const BoxDecoration(
             color: Colors.white,
                  
                  borderRadius: BorderRadius.all(Radius.circular(80))),
      child: TextFormField(
        onEditingComplete: function,
        controller: controller,

  
      
        
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        validator: validator,
        keyboardType: keyboardType,
        
        obscureText: obscure,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
   
          border: InputBorder.none,
          hintText: hint,
          contentPadding: const EdgeInsets.all(25),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color:Colors.black,
          ),
          suffixIcon: suffixIcon ?? const SizedBox.shrink(),
          prefixIcon: prefixIcon ?? const SizedBox.shrink()
        ),
      ),
    );
  }
}
