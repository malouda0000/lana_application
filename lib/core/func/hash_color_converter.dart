import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  hex = hex.replaceAll("#", ""); // Remove the '#' if present
  if (hex.length == 6) {
    hex = "FF$hex"; // Add full opacity if only RGB is provided
  }
  return Color(int.parse(hex, radix: 16));
}
