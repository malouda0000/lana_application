import 'package:flutter/material.dart';

Color hexToColor(String? hex) {
  if (hex == null) {
    return Colors.transparent;
  } else if (hex.length == 6) {
    hex = hex.replaceAll("#", ""); // Remove the '#' if present
    hex = "FF$hex"; // Add full opacity if only RGB is provided
    return Color(int.parse(hex, radix: 16));
  } else {
    return Colors.white;
  }
}
