import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../utils/constants/sizes.dart';
import '../../controllers/pdf/pdf_theme_controller.dart';

class PdfChangeThemeButton extends StatelessWidget {
  const PdfChangeThemeButton({
    super.key,
    required this.pdfThemeController,
  });

  final PdfThemeController pdfThemeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: CircularMenu(
        radius: 80,
        alignment: Alignment.bottomRight,
        items: [
          CircularMenuItem(
            iconSize: CSizes.iconSm + 4,
            icon: FontAwesomeIcons.one,
            onTap: () => pdfThemeController.setPdfTheme(1),
          ),
          CircularMenuItem(
            iconSize: CSizes.iconSm + 4,
            icon: FontAwesomeIcons.two,
            onTap: () => pdfThemeController.setPdfTheme(2),
          ),
          CircularMenuItem(
            iconSize: CSizes.iconSm + 4,
            icon: FontAwesomeIcons.three,
            onTap: () => pdfThemeController.setPdfTheme(3),
          ),
        ],
      ),
    );
  }
}
