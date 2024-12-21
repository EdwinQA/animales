import 'package:flutter/material.dart';

class CustomRichTextWidget extends StatelessWidget {
  final String label;
  final String message;

  const CustomRichTextWidget({
    super.key,
    required this.label,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      softWrap: true,
      text: TextSpan(
        style:
            const TextStyle(fontSize: 25, color: Colors.black), // Estilo base
        children: [
          TextSpan(
            text: label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: message,
          ),
        ],
      ),
    );
  }
}
