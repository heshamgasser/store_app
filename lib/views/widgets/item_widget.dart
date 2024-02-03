import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/models/products.dart';

class ItemWidget extends StatelessWidget {
  Products product;

  ItemWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.r,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            height: 250.h,
            width: 200.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 125.h,
                  width: 100.w,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: product.image ?? '',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    product.title ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    '${product.price}' ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: RatingBar.builder(
                    itemSize: 15.r,
                    initialRating: product.rating?.rate as double ?? 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 2.r,
            right: 1.r,
            child: IconButton(
              onPressed: () {
                //   add favorite Function
              },
              icon: Icon(Icons.favorite),
            ),
          ),
        ],
      ),
    );
  }
}
