import 'package:flutter/material.dart';

class SearchTextField1 extends StatelessWidget {
  SearchTextField1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
          size: 26,
        ),
        suffixIcon: ibtn(),
        // helperText: "Search your topic",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: "Search All",
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        isDense: true,
      ),
    );
  }
}

Widget ibtn() {
  return Container(
      child: PopupMenuButton(
          icon: Icon(Icons.filter_list,color: Color.fromRGBO(5, 89, 109, 1),),
          itemBuilder: (context) {
            return [
              PopupMenuItem<String>(
                value: "All",
                child: Text("All"),
              ),
              PopupMenuItem<String>(
                value: "Bulawayo High Court",
                child: Text("Bulawayo High Court"),
              ),
              PopupMenuItem<String>(
                value: "Chinhoyi High Court",
                child: Text("Chinhoyi High Court"),
              ),
              PopupMenuItem<String>(
                value: "Constitutional Court of Zimbabwe",
                child: Text("Constitutional Court of Zimbabwe"),
              ),PopupMenuItem<String>(
                value: "Gweru High Court",
                child: Text("Gweru High Court"),
              ),
              PopupMenuItem<String>(
                value: "Harare High Court",
                child: Text("Harare High Court"),
              ),PopupMenuItem<String>(
                value: "Bulawayo High Court",
                child: Text("Bulawayo High Court"),
              ),
              PopupMenuItem<String>(
                value: "Mutare High Court",
                child: Text("Mutare High Court"),
              ),PopupMenuItem<String>(
                value: "Masvingo High Court",
                child: Text("Masvingo High Court"),
              ),PopupMenuItem<String>(
                value: "Labour Court",
                child: Text("Labour Court"),
              ),PopupMenuItem<String>(
                value: "Supreme Court",
                child: Text("Supreme Court"),
              ),
            ];
          },
          // onSelected: (value) {
          //   if (value == 0) {
          //     print("My account menu is selected.");
          //   } else if (value == 1) {
          //     print("Settings menu is selected.");
          //   } else if (value == 2) {
          //     print("Logout menu is selected.");
          //   }
          // }
          ));
}

Widget drop() {
  // Initial Selected Value
String dropdownvalue = '';

// List of items in our dropdown menu
var items = [
  '',
	'Item 1',
	'Item 2',
	'Item 3',
	'Item 4',
	'Item 5',
];
  return Container(
    
      child: DropdownButton(
			
			// Initial Value
			value: dropdownvalue,
			
			// Down Arrow Icon
			icon: const Icon(Icons.filter_list),
			
			// Array list of items
			items: items.map((String items) {
				return DropdownMenuItem(
				value: items,
				child: Text(items),
				);
			}).toList(),
			// After selecting the desired option,it will
			// change button value to selected value
			onChanged: (String? newValue) {
				// setState(() {
				// dropdownvalue = newValue!;
				// });
			},
			),
          );
}
