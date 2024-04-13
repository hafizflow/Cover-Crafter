import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
                  ),
                  ListTile(
                    leading: const Icon(Icons.refresh),
                    title: const Text('Refresh'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.share_rounded),
                    title: const Text('Share App'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Iconsax.message_question),
                    title: const Text('Help & FeedBack'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Iconsax.link),
                    title: const Text('Connect'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(children: [MyCard()]),
            )
          ],
        ),
      ),
    );
  }
}
