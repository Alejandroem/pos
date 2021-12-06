import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object> get props => [];
}

class ProductsFetched extends ProductEvent {
  ProductsFetched();
  @override
  List<Object> get props => [];
}
