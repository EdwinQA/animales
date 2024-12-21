import 'package:flutter/material.dart';

class CustomAnimalField extends StatefulWidget {
  final bool isTopField; 
  final bool isBottomField; 
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int maxLines;
  final String initialValue;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  const CustomAnimalField({
    super.key,
    this.isTopField = true,
    this.isBottomField = true,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 20,
    this.initialValue = '',
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
  });

  @override
  State<CustomAnimalField> createState() => _CustomAnimalFieldState();
}

class _CustomAnimalFieldState extends State<CustomAnimalField> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    const borderRadius = Radius.circular(15);

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: widget.isTopField ? borderRadius : Radius.zero,
            topRight: widget.isTopField ? borderRadius : Radius.zero,
            bottomLeft: widget.isBottomField ? borderRadius : Radius.zero,
            bottomRight: widget.isBottomField ? borderRadius : Radius.zero,
          ),
          boxShadow: [
            if (widget.isBottomField)
              BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 5,
                  offset: const Offset(0, 3))
          ]),
      child: TextFormField(
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        style: const TextStyle(fontSize: 25, color: Colors.black54),
        maxLines: widget.maxLines,
        minLines: 1,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          floatingLabelBehavior: widget.maxLines > 1
              ? FloatingLabelBehavior.always
              : FloatingLabelBehavior.auto,
          floatingLabelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedErrorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.transparent)),
          isDense: true,
          label: widget.label != null ? Text(widget.label!) : null,
          hintText: widget.hint,
          errorText: widget.errorMessage,
          focusColor: colors.primary,
          // icon: Icon( Icons.supervised_user_circle_outlined, color: colors.primary, )
        ),
      ),
    );
  }
}
