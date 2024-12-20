part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable{
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class ProductLoadEvent extends ProductEvent {
  const ProductLoadEvent();

  @override
  List<Object?> get props => [];
  String get productQuery =>'';
}
