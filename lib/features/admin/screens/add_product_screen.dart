import 'dart:io';

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/shared/widgets/custom_button.dart';
import 'package:amazon_clone/shared/widgets/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/addProduct';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    productNameController;
    descriptionController;
    priceController;
    quantityController;
    super.dispose();
  }

  String category = 'Mobiles';
  List<File> images = [];

  List <String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  void selectImages() async{
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: const Text(
            'Add Product',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: selectImages,
                child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.folder_open,
                            size: 50,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Add Product',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                  controller: productNameController, hintText: 'Product Name'),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                controller: descriptionController,
                hintText: 'Description',
                maxLines: 6,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(controller: priceController, hintText: 'Price'),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  controller: priceController, hintText: 'Quantity'),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  value: category,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: productCategories.map((String item){
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newVal){
                    setState(() {
                      category = newVal!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 10,),

              CustomButton(text: 'Sell Product', onTap: (){})
            ],
          ),
        )),
      ),
    );
  }
}
