import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            // CTextFormField(
            //   label: 'Department',
            //   prefixIcon: Iconsax.user,
            //   suffixIcon: Icons.arrow_drop_down,
            //   suffixIconOnPressed: () {
            //     DropdownButton(
            //       items:
            //           <String>['CSE', 'EEE', 'BBA', 'MCT'].map((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //       onChanged: (value) {},
            //     );
            //   },
            // ),
            TextFormField(
              decoration: InputDecoration(
                  label: const Text('Department'),
                  prefixIcon: const Icon(Iconsax.user),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      DropdownButtonFormField2<String>(
                        items: <String>['CSE', 'EEE', 'BBA', 'MCT']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (val) {
                          log(val.toString());
                        },
                        decoration: const InputDecoration(
                          label: Text('Department'),
                          prefixIcon: Icon(Iconsax.user),
                        ),
                      );
                    },
                  )),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              items: <String>['CSE', 'EEE', 'BBA', 'MCT'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (val) {
                log(val.toString());
              },
              decoration: const InputDecoration(
                label: Text('Department'),
                prefixIcon: Icon(Iconsax.user),
              ),
              // dropdownStyleData: DropdownStyleData(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              // ),
              // menuItemStyleData: const MenuItemStyleData(
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              // ),
              // isDense: true,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// suffixIcon: IconButton(
//   onPressed: () {},
//   icon: const Icon(Icons.arrow_drop_down),
// ),
// suffixIcon: DropdownButton(
//   items:
//       <String>['CSE', 'EEE', 'BBA', 'MCT'].map((String value) {
//     return DropdownMenuItem<String>(
//       value: value,
//       child: Text(value),
//     );
//   }).toList(),
//   onChanged: (value) {},
// ),

// DropdownButton<String>(
// items:
// <String>['CSE', 'EEE', 'BBA', 'MCT'].map((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// padding: const EdgeInsets.only(right: 12),
// onChanged: (val) {
// log(val.toString());
// },
// underline: const SizedBox(),
// ),
