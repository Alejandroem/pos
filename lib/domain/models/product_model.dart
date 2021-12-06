import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final double quantityUnits;
  final String quantityMeasure;
  final double price;
  final String thumbnail;

  const Product(
      {required this.name,
      required this.quantityUnits,
      required this.quantityMeasure,
      required this.price,
      required this.thumbnail});

  @override
  List<Object?> get props => [name, quantityUnits, quantityMeasure, price];
}
