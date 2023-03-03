import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'custom_icons.dart';

class StarRatingWidget extends StatefulWidget {
  const StarRatingWidget({Key? key}) : super(key: key);

  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: const Text(
                  "Đáng giá",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    height: 21 / 14,
                    color: Colors.black,
                  ),
                ),
              ),
              RatingBar(
                initialRating: 4,
                allowHalfRating: false,
                itemPadding: const EdgeInsets.only(right: 28),
                direction: Axis.horizontal,
                ratingWidget: RatingWidget(
                  empty: const Icon(
                    Custom.star_regular,
                    size: 30,
                    color: Color(0xffFFC35B),
                  ),
                  half: const Icon(
                    Custom.star_regular,
                    size: 30,
                    color: Color(0xffFFC35B),
                  ),
                  full: const Icon(
                    Custom.star_solid,
                    size: 30,
                    color: Color(0xffFFC35B),
                  ),
                ),
                onRatingUpdate: (value) {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
