import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final int amount;
  final String unit;
  final double price;

  const Product(
      {required this.name,
      required this.amount,
      required this.unit,
      required this.price});

  @override
  List<Object?> get props => [name, amount, unit, price];
}
