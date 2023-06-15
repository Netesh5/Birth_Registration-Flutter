import 'package:flutter/material.dart';

class CustomDropDownFormField extends StatelessWidget {
  const CustomDropDownFormField(
      {super.key,
      required this.items,
      this.onChanged,
      required this.value,
      required this.title});
  final List<String> items;
  final void Function(String?)? onChanged;
  final String value;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(title),
        const SizedBox(
          height: 20,
        ),
        DropdownButtonFormField<String>(
            value: value,
            items: items.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: onChanged),
      ],
    );
  }
}
