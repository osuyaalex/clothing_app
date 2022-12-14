import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

snackBar(String title, context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black,
    content: Text(title,
      style: GoogleFonts.tenorSans(
          fontSize: 15,
          fontWeight: FontWeight.w500
      ),
    ),
  ),
  );
}