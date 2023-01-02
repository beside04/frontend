import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/config/theme/color_data.dart';
import 'package:frontend/config/theme/text_data.dart';

class EmoticonIconButton extends StatelessWidget {
  const EmoticonIconButton({
    super.key,
    required this.icon,
    required this.name,
    required this.selected,
    required this.onPressed,
  });

  final String icon;
  final String name;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  padding: selected
                      ? const EdgeInsets.all(8.5)
                      : const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: selected ? 2 : 0.5,
                      color: selected
                          ? kPrimaryColor
                          : Theme.of(context).colorScheme.surface,
                    ),
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: SvgPicture.network(
                    icon,
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
