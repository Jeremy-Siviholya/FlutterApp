import 'package:intl/intl.dart';

class Product{
  int ?id;
  String ?title;
  String ?description;
  String ?image;
  String ?price;

  Product({this.id,this.title,this.description,this.price,this.image});
  factory Product.fromJson(Map<String, dynamic> json){
    var f = NumberFormat('###.0#', 'en_US');
    return Product(
      id:json['id'],
      title: json['title'],
      image:json['image'],
      description: json['description'],
      price:f.format(json['price']) 
    );
  }
}