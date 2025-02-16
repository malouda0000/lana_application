// import 'package:flutter/material.dart';

// Color hexToColor(String? hex) {
//   if (hex == null) {
//     return Colors.transparent;
//   } else if (hex.length == 6) {
//     hex = hex.replaceAll("#", ""); // Remove the '#' if present
//     hex = "FF$hex"; // Add full opacity if only RGB is provided
//     return Color(int.parse(hex, radix: 16));
//     print("dddddddddddddone");
//   } else {
//     return Colors.white;
//   }
// }

import 'package:flutter/material.dart';

Color hexToColor(String? hex) {
  if (hex == null || hex.isEmpty)
    return Colors.transparent; //  Handle null and empty cases

  hex = hex.replaceAll("#", ""); //  Remove "#" if present

  if (hex.length == 3) {
    //  Convert RGB (e.g., "F00") to full RRGGBB
    hex = hex.split("").map((char) => "$char$char").join();
  } else if (hex.length == 4) {
    //  Convert ARGB (e.g., "8F00") to AARRGGBB
    hex = hex.split("").map((char) => "$char$char").join();
  } else if (hex.length == 6) {
    //  Convert RRGGBB to AARRGGBB by adding full opacity "FF"
    hex = "FF$hex";
  } else if (hex.length != 8) {
    return Colors.grey; //  Return default color if the format is invalid
  }

  return Color(int.parse(hex, radix: 16));
}
