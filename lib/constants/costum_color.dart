import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Colors....

const secondaryBackground = Color.fromARGB(255, 20, 24, 27);
const primaryBackground = Color.fromARGB(255, 29, 36, 40);
const secondaryText = Color.fromARGB(255, 149, 161, 172);
const alternate = Color.fromARGB(255, 38, 45, 52);
const primary = Color.fromARGB(255, 37, 27, 64);
const categoryColor = Color.fromARGB(255, 75, 57, 239);
const error = Color.fromARGB(255, 255, 89, 100);
const tertiary = Color.fromARGB(255, 238, 138, 96);

// Text Style....

const headlineSmall = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontFamily: "Readex",
  fontWeight: FontWeight.w500,
);
const headlineXSmall = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontFamily: "Readex",
);
const titleSmall = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontFamily: "Readex",
  fontWeight: FontWeight.w500,
);

const labelMedium = TextStyle(
  color: Color.fromARGB(255, 149, 161, 172),
  fontSize: 14,
  fontFamily: "Readex",
  fontWeight: FontWeight.w500,
);

const bodyMedium = TextStyle(
  color: Color.fromARGB(255, 255, 255, 255),
  fontSize: 14,
  fontFamily: "Readex",
  fontWeight: FontWeight.w500,
);

const copyrightStyle = TextStyle(
  color: Color.fromARGB(255, 111, 111, 111),
  fontSize: 12,
  fontFamily: "Readex",
  fontWeight: FontWeight.w500,
);

final inputAuthStyle = InputDecoration(
  labelText: 'Email',
  labelStyle: labelMedium,
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: alternate,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: primary,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: error,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: error,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
  ),
  filled: true,
  fillColor: secondaryBackground,
  contentPadding: const EdgeInsets.all(24),
);
