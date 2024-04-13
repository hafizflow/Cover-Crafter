import 'package:cover_page/common/styles/pdf_view/pdf_spacing.dart';
import 'package:cover_page/utils/constants/sizes.dart';
import 'package:cover_page/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import 'package:url_launcher/link.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

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
                              AssetImage(CImages.buetLogo), //NetworkImage
                          radius: 20,
                        ),
                      ),
                      const SizedBox(width: PDFSpacing.spaceBtwSection),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hafizur Rahman",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "Mobile App Developer",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwInputFields - 4),
                  Text(
                    "Hello My Name is Hafizur Rahman. Now i am writting ML and AI",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: CSizes.spaceBtwInputFields - 4),
                  Row(
                    children: [
                      Link(
                        uri: Uri.parse('mailto:hafizur.rahman.cs@gmail.com'),
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: SizedBox(
                            height: CSizes.iconMd - 4,
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
                            'https://www.linkedin.com/in/hafizur-rahman-201941289/'),
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
                        uri: Uri.parse('https://github.com/hafizflow'),
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
                        uri: Uri.parse('http://t.me/hafizflow45'),
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: SizedBox(
                            height: CSizes.iconMd - 4,
                            child: Image.asset(
                              CImages.telegramLogo,
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
