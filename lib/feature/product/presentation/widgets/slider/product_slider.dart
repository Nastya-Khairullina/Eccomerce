import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/product_bloc.dart';


class ProductSliderWidget extends StatefulWidget {
  const ProductSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  _HotSalesWidgetState createState() => _HotSalesWidgetState();
}
class _HotSalesWidgetState extends State<ProductSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
                child: CircularProgressIndicator()
            );
          }
          if (state is ProductLoadedState) {
            return CarouselSlider.builder(
              itemCount: state.loadedProduct[0].images!.length,
              itemBuilder: (context, index, _) => ModelWidget(
                images: state.loadedProduct[0].images!,
                color: state.loadedProduct[0].color!,
                capacity: state.loadedProduct[0].capacity!,
                price: state.loadedProduct[0].price!,
              ),
              options: CarouselOptions(
                height: 330,
                aspectRatio: 5.0,
                initialPage: 0,
                viewportFraction: 0.74,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
              ),
            );
          }
          if (state is ProductErrorState) {
            return const Center(
                child: Text('Error getcing picture')
            );
          }
          return const CircularProgressIndicator();
        }
    );
  }
}

class ModelWidget extends StatelessWidget {
  final String? images;
  final String? color;
  final String? capacity;
  final String? price;

  const ModelWidget({
    Key? key,
    required this.images,
    required this.color,
    required this.capacity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(images ?? ''),
          fit: BoxFit.fitWidth,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}