import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class RefProductSelect extends StatelessWidget {
  final String hint;
  final String title;
  final List<dynamic> items;
  final TextEditingController controller;

  RefProductSelect({
    Key? key,
    required this.hint,
    required this.title,
    required this.items,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 17),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 5.0),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        DropdownSearch<dynamic>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            showSearchBox: true,
          ),
          items: items,
          itemAsString: (item) => (item as Map<String, dynamic>?)?["ReferanceProduit"] as String? ?? "",
          compareFn: (item, selectedItem) {
            final itemNom = (item as Map<String, dynamic>?)?["ReferanceProduit"] as String?;
            final selectedItemNom = (selectedItem as Map<String, dynamic>?)?["ReferanceProduit"] as String?;
            return itemNom == selectedItemNom;
          },
          onChanged: (value) {
            final selectedMap = value as Map<String, dynamic>?;
            final referanceProduit = selectedMap?["ReferanceProduit"] as String?;
            controller.text = referanceProduit ?? "";
          },
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide:BorderSide(color :Color(0xffA9A9A9),width: 1.5),
                borderRadius: BorderRadius.circular(15),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}
