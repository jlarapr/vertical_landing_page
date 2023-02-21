import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:vertical_landing_page/src/ui/configure.dart";

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Configure.primary,
      child: FittedBox(
        fit: BoxFit.none,
        child: Center(
          child: Text(
            "About",
            style: GoogleFonts.montserratAlternates(
              fontSize: 80,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
