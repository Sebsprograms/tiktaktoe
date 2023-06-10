import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TikTacToeField extends StatelessWidget {
  const TikTacToeField({
    super.key,
    required this.value,
    required this.setField,
    required this.rowIndex,
    required this.fieldIndex,
  });
  final int rowIndex;
  final int fieldIndex;
  final String value;
  final void Function(int rowIndex, int fieldIndex, String fieldValue) setField;

  @override
  Widget build(BuildContext context) {
    Color color = value == "X"
        ? const Color.fromARGB(255, 245, 107, 97)
        : const Color.fromARGB(255, 101, 186, 255);
    return GestureDetector(
      onTap: () {
        setField(rowIndex, fieldIndex, value);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 10),
          color: Colors.black87,
        ),
        margin: const EdgeInsets.all(5),
        width: 100,
        height: 100,
        child: Center(
            child: Text(
          value,
          textAlign: TextAlign.center,
          style: GoogleFonts.monoton(
            fontWeight: FontWeight.bold,
            fontSize: 54,
            color: color,
          ),
        )),
      ),
    );
  }
}
