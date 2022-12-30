import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/config/theme/color_data.dart';
import 'package:frontend/config/theme/size_data.dart';
import 'package:frontend/config/theme/text_data.dart';
import 'package:intl/intl.dart';

class NoticeButton extends StatelessWidget {
  const NoticeButton({
    super.key,
    required this.title,
    required this.date,
    required this.isImportant,
    required this.onPressed,
    this.isLightMode = true,
  });

  final String title;
  final DateTime date;
  final bool isImportant;
  final bool isLightMode;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isLightMode ? kWhiteColor : kBackGroundDarkColor,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: kGrayColor100,
                width: 1.0,
              ),
            ),
          ),
          child: Padding(
            padding: kPrimaryPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: kSubtitle3BlackStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 12.0.w),
                        isImportant
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.w),
                                  color: kPrimaryColor,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4.0.h, horizontal: 6.0.w),
                                  child: Text(
                                    '중요',
                                    style: kCaption1WhiteStyle,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    Text(
                      DateFormat('yyyy.MM.dd').format(date),
                      style: kBody2Gray400Style,
                    ),
                  ],
                ),
                const Icon(
                  Icons.navigate_next,
                  color: kGrayColor250,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
