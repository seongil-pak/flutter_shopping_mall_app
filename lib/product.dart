import 'dart:io';

class Product {
  final String name;
  final String price;
  final String description;
  final File? image;

  Product({
    required this.name,
    required this.price,
    required this.description,
    this.image,
  });
}
