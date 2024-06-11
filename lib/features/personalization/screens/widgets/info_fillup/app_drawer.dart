import 'package:cover_page/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../utils/constants/sizes.dart';
import 'my_card.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CSizes.dividerHeight),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: [
                  const ExpansionTile(
                    leading: Icon(Icons.add_box_outlined),
                    title: Text('About'),
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Text(
                          "This app simplified the process of making cover page for Assignment & Lab Report.",
                        ),
                      )
                    ],
                  ),
                  ListTile(
                    leading: const Icon(Icons.share_rounded),
                    title: const Text('Share App'),
                    onTap: () => Share.share(
                        'https://drive.google.com/drive/folders/10XMCBBbDN72RDIZw9j9k5ICzJ2UXrp6r?usp=sharing'),
                  ),
                  ListTile(
                    leading: const Icon(CupertinoIcons.delete),
                    title: const Text('Erase Information'),
                    onTap: () => CHelperFunctions.showAlert(
                      "Warning",
                      "Are you sure to erase all the information ?",
                      context,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Iconsax.message_question),
                    title: const Text('Help & FeedBack'),
                    onTap: () {
                      launchUrl(
                        Uri.parse("mailto:hafizur.rahman.cs@gmail.com"),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(FontAwesomeIcons.github),
                    title: const Text('GitHub Repository'),
                    onTap: () {
                      launchUrl(
                        Uri.parse("https://github.com/hafizflow/cover_page"),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(children: [
                MyCard(),
                SizedBox(height: 12),
                // RafiCard(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
