import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rating, ratingCount];
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  String? rating;
  String? ratingCount;

  ProductEntity({
    this.id,
    this.title,
    this.category,
    this.description,
    this.image,
    this.price,
    this.rating,
    this.ratingCount,
  });
}

