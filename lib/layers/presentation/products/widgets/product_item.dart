import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/common_sizes.dart';
import '../../../domain/products/entities/product_entity.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.ratingCount,
    this.rating,
  });

  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final String? rating;
  final String? ratingCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: CommonSizes.size10),
      color: Colors.white70,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(CommonSizes.size15),
                child: image?.isNotEmpty == true
                    ? Image.network(
                        image ?? "",
                        errorBuilder: (ctx, _, stackTrace) {
                          return Image.asset("assets/no_poster.png");
                        },
                      )
                    : Image.asset("assets/no_poster.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(CommonSizes.size15),
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text(
                    rating.toString() ?? '',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                bottom: CommonSizes.size15,
                right: CommonSizes.size15,
                child: Container(
                  padding: EdgeInsets.all(CommonSizes.size15),
                  decoration: BoxDecoration(
                    color: Colors.amber,

                    borderRadius: BorderRadius.circular( CommonSizes.size30),
                  ),
                  child: Text(
                    "$price \$" ?? '',
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: CommonSizes.size10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CommonSizes.size10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: CommonSizes.size20),
                ),
                const SizedBox(
                  height: CommonSizes.size5,
                ),
                ReadMoreText(
                  description ?? '',
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Show more',
                  trimExpandedText: ' show less',
                  style: const TextStyle(
                      color: Colors.black54, fontSize: CommonSizes.size15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
