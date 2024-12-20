import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/app_colors.dart';
import '../../bloc/home_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HotSalesWidget extends StatefulWidget {
  const HotSalesWidget({Key? key}) : super(key: key);

  @override
  _HotSalesWidgetState createState() => _HotSalesWidgetState();
}

class _HotSalesWidgetState extends State<HotSalesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return  Center(
              child: SizedBox(
                width: 200.0,
                height: 100.0,
                child: Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.white
                    )
                ),
              ),
            );
          }
          if (state is HomeLoadedState) {
            return CarouselSlider.builder(
                itemCount: state.loadedHomestore.length,
                itemBuilder: (context, index, _) => SliderWidget(
                  pictureUrl: state.loadedHomestore[index].picture!,
                  titlePhone: state.loadedHomestore[index].title!,
                  subtitleSuper: state.loadedHomestore[index].subtitle!,
                  isNew: state.loadedHomestore[index].isNew ?? false,
                ),
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 5.0,
                  initialPage: 0,
                  viewportFraction: 1,
                )
            );
          }
          if (state is HomeErrorState) {
            return const Center(
                child: Text('Error getcing picture')
            );
          }
          return const CircularProgressIndicator();
        }
    );
  }
}

class SliderWidget extends StatelessWidget {
  final String? pictureUrl;
  final String? titlePhone;
  final String? subtitleSuper;
  final bool? isNew;

  const SliderWidget({
    Key? key,
    required this.pictureUrl,
    required this.titlePhone,
    required this.subtitleSuper,
    required this.isNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: pictureUrl ?? '',
            height: 450,
            width: double.maxFinite,
            fit: BoxFit.cover,
            alignment: Alignment.topLeft,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Stack(
            children: [
              SizedBox(
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 67),
                  child: Text(
                      titlePhone ?? '',
                      maxLines: 3,
                      style: const TextStyle(
                          fontFamily: 'SFPro',
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                          color: Colors.white
                      )
                  ),
                ),
              ),
              Positioned(
                top: 105,
                left: 28,
                child: Text(
                    subtitleSuper ?? '',
                    style: const TextStyle(
                        fontFamily: 'SFPro',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    )
                ),
              ),
              Positioned(
                  top: 10,
                  left: 16,
                  child: isNew == true
                      ? ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                        'New',
                        style: TextStyle(
                            fontFamily: 'SFPro',
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: Colors.white
                        )
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.iconColor,
                        minimumSize: const Size(15, 30),
                        shape: const CircleBorder()
                    ),
                  )
                      : Container()
              ),
              Positioned(
                top: 130,
                left: 28,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                      'Buy now!',
                      style: TextStyle(
                          fontFamily: 'SFPro',
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Colors.black
                      )
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 29),
                      minimumSize: const Size(15, 25)
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}