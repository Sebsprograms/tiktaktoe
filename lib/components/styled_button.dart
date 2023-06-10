import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final void Function() onTap;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 30, 165, 20),
      ),
      onPressed: onTap,
      icon: icon,
      label: Text(text),
    );
  }
}
