import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BookStoreItem extends StatefulWidget {
  const BookStoreItem({Key? key}) : super(key: key);

  @override
  State<BookStoreItem> createState() => _BookStoreItemState();
}

class _BookStoreItemState extends State<BookStoreItem> {
  bool inCart = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.to(() => const StoreBookDetail()),
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  height: Get.height * 0.13,
                  width: Get.width * 0.2,
                  decoration: BoxDecoration(
                    color: Palette.primary.withOpacity(.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                const SizedBox(width: 14.0),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Death an inside story',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Palette.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Sadhguru',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Palette.black40,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'GHC 40.00',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Palette.black80,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        StatefulBuilder(
          builder: ((context, setState) {
            return GestureDetector(
              onTap: () => setState(() => inCart = !inCart),
              child: SvgPicture.asset(
                inCart ? Images.cart : Images.cartO,
              ),
            );
          }),
        ),
      ],
    );
  }
}
