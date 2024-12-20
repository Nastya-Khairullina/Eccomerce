import 'package:flutter/material.dart';

import '../../../../../common/app_colors.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)
            )
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close, size: 18, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonBarColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(10),
                          minimumSize: const Size(15, 15)
                      ),
                    ),
                    const Text(
                        'Filter options',
                        style: TextStyle(
                            fontFamily: 'MarkPronormal400',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.buttonBarColor
                        )
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                          'Done',
                          style: TextStyle(
                              fontFamily: 'MarkPronormal400',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                          )
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.iconColor,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    )
                  ]
              ),
            ),
            const Text(
                'Brand',
                style: TextStyle(
                    fontFamily: 'MarkPronormal400',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.buttonBarColor
                )
            ),
            const SizedBox(height: 5),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 37,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(6)
                ),
                child: const FilterBrandWidget()
            ),
            const SizedBox(height: 20),
            const Text(
                'Price',
                style: TextStyle(
                    fontFamily: 'MarkPronormal400',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.buttonBarColor
                )
            ),
            const SizedBox(height: 5),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 37,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(6)
                ),
                child: const FilterPriceWidget()
            ),
            const SizedBox(height: 20),
            const Text(
                'Size',
                style: TextStyle(
                    fontFamily: 'MarkPronormal400',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.buttonBarColor
                )
            ),
            const SizedBox(height: 5),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 37,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(6)
                ),
                child: const FilterSizeWidget()
            ),
          ],
        )
    );
  }
}

class FilterBrandWidget extends StatefulWidget {
  const FilterBrandWidget({Key? key}) : super(key: key);

  @override
  State<FilterBrandWidget> createState() => _FilterBrandWidgetState();
}

String dropdownValue = 'Samsung';

class _FilterBrandWidgetState extends State<FilterBrandWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.keyboard_arrow_down_sharp,
        size: 32,
        color: Colors.grey,
      ),
      isExpanded: true,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Samsung', 'Apple', 'Huawei', 'Motorolla'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
              value,
              style: const TextStyle(
                  fontFamily: 'MarkPronormal400',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonBarColor
              )
          ),
        );
      }).toList(),
    );
  }
}

class FilterPriceWidget extends StatefulWidget {
  const FilterPriceWidget({Key? key}) : super(key: key);

  @override
  State<FilterPriceWidget> createState() => _FilterPriceWidgetState();
}

String dropdownValueInt = '\$300 - \$500';

class _FilterPriceWidgetState extends State<FilterPriceWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValueInt,
      icon: const Icon(
        Icons.keyboard_arrow_down_sharp,
        size: 32,
        color: Colors.grey,
      ),
      isExpanded: true,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueInt = newValue!;
        });
      },
      items: <String>['\$300 - \$500', '\$500 - \$800', '\$800 - \$1100', '\$1100 - \$1400']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
              value,
              style: const TextStyle(
                  fontFamily: 'MarkPronormal400',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonBarColor
              )
          ),
        );
      }).toList(),
    );
  }
}

class FilterSizeWidget extends StatefulWidget {
  const FilterSizeWidget({Key? key}) : super(key: key);

  @override
  State<FilterSizeWidget> createState() => _FilterSizeWidgetState();
}

String dropdownValueSize = '4.5 to 5.5 inches';

class _FilterSizeWidgetState extends State<FilterSizeWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValueSize,
      icon: const Icon(
        Icons.keyboard_arrow_down_sharp,
        size: 32,
        color: Colors.grey,
      ),
      isExpanded: true,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueSize = newValue!;
        });
      },
      items: <String>['4.5 to 5.5 inches', '5.5 to 6.5 inches', '6.5 to 7.5 inches', '7.5 to 8.5 inches']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: const TextStyle(
                  fontFamily: 'MarkPronormal400',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonBarColor
              )
          ),
        );
      }).toList(),
    );
  }
}