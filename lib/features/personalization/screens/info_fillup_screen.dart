import 'package:cover_page/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/info_fillup/text_form_field.dart';

class InfoFillUpScreen extends StatelessWidget {
  const InfoFillUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
          child: Column(
            children: [
              CTextFormField(
                label: 'Name',
                prefixIcon: Iconsax.user,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
