import 'package:cinemate/core/constants/app_assets.dart';
import 'package:cinemate/core/constants/app_colors.dart';
import 'package:cinemate/core/constants/app_styles.dart';
import 'package:cinemate/features/ticket_purchase/domain/entities/buffet_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class BuffetProductsListViewItem extends StatelessWidget {
  const BuffetProductsListViewItem({
    super.key,
    required this.buffetProduct,
    required this.onIncrease,
    required this.onDecrease,
  });

  final BuffetProductEntity buffetProduct;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Container(
            width: 119,
            height: 119,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.darkPurple,
              ),
              gradient: LinearGradient(
                stops: const [
                  0.58,
                  1,
                ],
                colors: [
                  AppColors.spanishViolet.withOpacity(0),
                  AppColors.darkPurple.withOpacity(.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(
                buffetProduct.id == 1
                    ? 10
                    : buffetProduct.id == 2
                        ? 20
                        : 30,
              ),
              child: Image.asset(
                AppAssets.popcornCocacola,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  buffetProduct.name,
                  style: AppStyles.medium16,
                ),
                const SizedBox(height: 8),
                Text(
                  buffetProduct.popCornSize,
                  style: AppStyles.medium10
                      .copyWith(color: AppColors.white.withOpacity(.44)),
                ),
                TextScroll(
                  mode: TextScrollMode.bouncing,
                  pauseBetween: const Duration(seconds: 3),
                  delayBefore: const Duration(seconds: 1),
                  velocity: const Velocity(pixelsPerSecond: Offset(25, 0)),
                  buffetProduct.colaSize,
                  style: AppStyles.medium10
                      .copyWith(color: AppColors.white.withOpacity(.44)),
                ),
                const Spacer(),
                Text(
                  'Price:',
                  style: AppStyles.medium10,
                ),
                Text(
                  '\$${buffetProduct.price}',
                  style: AppStyles.semiBold27.copyWith(
                    color: AppColors.limeGreen,
                    shadows: [
                      const Shadow(
                        blurRadius: 8.0,
                        color: AppColors.limeGreen,
                        offset: Offset(0, 0),
                      ),
                      const Shadow(
                        blurRadius: 8.0,
                        color: AppColors.limeGreen,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onIncrease,
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
              Text(
                '${buffetProduct.quantity}',
                style: AppStyles.light14,
              ),
              IconButton(
                color: AppColors.white,
                disabledColor: AppColors.white.withOpacity(0.36),
                onPressed: buffetProduct.quantity > 0 ? onDecrease : null,
                icon: const Icon(
                  Icons.remove_circle_outline,
                  size: 30,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
