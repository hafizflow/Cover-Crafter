import 'package:cover_page/common/styles/pdf_view/pdf_spacing.dart';
import 'package:cover_page/utils/constants/sizes.dart';
import 'package:cover_page/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import 'package:url_launcher/link.dart';

class RafiCard extends StatelessWidget {
  const RafiCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = CHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Card(
            borderOnForeground: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.teal,
                        radius: 20,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage(CImages.rafi), //NetworkImage
                          radius: 20,
                        ),
                      ),
                      const SizedBox(width: PDFSpacing.spaceBtwSection),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Anjum Hossain Rafi",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "Web Developer",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwInputFields - 4),
                  Text(
                    "Skilled Full-Stack Developer. Master in Node.js, React.js, JavaScript & SQL.",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: CSizes.spaceBtwInputFields - 4),
                  Row(
                    children: [
                      Link(
                        uri: Uri.parse('mailto:hossain15-5801@diu.edu.bd'),
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: SizedBox(
                            height: CSizes.iconMd - 2,
                            child: Image.asset(
                              CImages.emailLogo,
                              color: isDark ? Colors.white : null,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Link(
                        uri: Uri.parse(
                            'https://www.linkedin.com/in/anjum-hossain-519a192b2/'),
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: SizedBox(
                              height: CSizes.iconMd,
                              child: Image.asset(
                                CImages.linkedinLogo,
                                color: isDark ? Colors.white : null,
                              )),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Link(
                        uri: Uri.parse('https://github.com/ahrafi16'),
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: SizedBox(
                            height: CSizes.iconMd - 4,
                            child: Image.asset(
                              CImages.githubLogo,
                              color: isDark ? Colors.white : null,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Link(
                        uri: Uri.parse(
                            'https://sites.google.com/view/anjum-hossain/home'),
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: SizedBox(
                            height: CSizes.iconMd - 4,
                            child: Image.asset(
                              CImages.webLogo,
                              color: isDark ? Colors.white : null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
