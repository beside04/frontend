import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/config/theme/color_data.dart';
import 'package:frontend/config/theme/size_data.dart';
import 'package:frontend/config/theme/text_data.dart';
import 'package:frontend/di/getx_binding_builder_call_back.dart';
import 'package:frontend/presentation/diary/diary_detail/diary_detail_screen.dart';
import 'package:frontend/presentation/diary/diary_detail/empty_diary_screen.dart';
import 'package:frontend/presentation/emotion_stamp/emotion_stamp_view_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:table_calendar/table_calendar.dart';

class EmotionStampScreen extends GetView<EmotionStampViewModel> {
  const EmotionStampScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getEmotionStampBinding();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                controller.isCalendar.value = !controller.isCalendar.value;
              },
              icon: controller.isCalendar.value
                  ? Icon(Icons.list)
                  : Icon(Icons.calendar_month_outlined),
              color: kBlackColor,
            ),
          )
        ],
        title: Obx(
          () => InkWell(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(2000, 1),
                maxTime: DateTime(2099, 12),
                onConfirm: (date) {
                  controller.focusedCalendarDate.value = date;
                },
                currentTime: DateTime.now(),
                locale: LocaleType.ko,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DateFormat('yyyy년 MM월')
                        .format(controller.focusedCalendarDate.value),
                    style: kHeader3BlackStyle,
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: kBlackColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => Expanded(
                child: PageTransitionSwitcher(
                  duration: Duration(milliseconds: 300),
                  reverse: !controller.isCalendar.value,
                  transitionBuilder: (Widget child, Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return SharedAxisTransition(
                        child: child,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.horizontal);
                  },
                  child: controller.isCalendar.value
                      ? Obx(
                          () => TableCalendar<TempEvent>(
                            onPageChanged: (day) {
                              print(day);
                              controller.focusedCalendarDate.value = day;
                            },
                            rowHeight: 70,
                            focusedDay: controller.focusedCalendarDate.value,
                            firstDay: DateTime(1900, 1),
                            lastDay: DateTime(2199, 12),
                            calendarFormat: CalendarFormat.month,
                            weekendDays: const [DateTime.sunday, 6],
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            locale: 'ko-KR',
                            daysOfWeekHeight: 30,
                            headerVisible: false,
                            eventLoader: (DateTime day) {
                              return controller.tempEventSource[day] ?? [];
                            },
                            calendarStyle: const CalendarStyle(
                              cellPadding: EdgeInsets.only(top: 5),
                              cellAlignment: Alignment.bottomCenter,
                              isTodayHighlighted: true,
                              outsideDaysVisible: false,
                            ),
                            calendarBuilders: CalendarBuilders(
                              // dowBuilder: (context, day) {
                              //   if (day.weekday == DateTime.sunday) {
                              //     final text = DateFormat.E().format(day);
                              //
                              //     return Center(
                              //       child: Text(
                              //         text,
                              //         style: TextStyle(color: Colors.red),
                              //       ),
                              //     );
                              //   }
                              // },
                              markerBuilder: (context, day, events) {
                                return InkWell(
                                  onTap: () {
                                    controller.selectedCalendarDate.value = day;
                                    controller.focusedCalendarDate.value = day;

                                    events.isEmpty
                                        ? Get.to(() => EmptyDiaryScreen(
                                              date: day,
                                            ))
                                        : Get.to(
                                            () => DiaryDetailScreen(
                                              date: day,
                                            ),
                                          );
                                  },
                                  child: Center(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Column(
                                        children: [
                                          events.isEmpty
                                              ? Container(
                                                  padding: EdgeInsets.all(14.w),
                                                  decoration: BoxDecoration(
                                                    border:
                                                        controller.isToday(day)
                                                            ? Border.all(
                                                                width: 1,
                                                                color:
                                                                    kPrimaryColor,
                                                              )
                                                            : null,
                                                    shape: BoxShape.circle,
                                                    color: kGrayColor100,
                                                  ),
                                                )
                                              : Stack(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(14.w),
                                                      decoration: BoxDecoration(
                                                        border: controller
                                                                .isToday(day)
                                                            ? Border.all(
                                                                width: 1,
                                                                color:
                                                                    kPrimaryColor,
                                                              )
                                                            : null,
                                                        shape: BoxShape.circle,
                                                        color: kGrayColor100,
                                                      ),
                                                    ),
                                                    Positioned.fill(
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child:
                                                            SvgPicture.network(
                                                          events[0].icon,
                                                          width: 20.w,
                                                          height: 20.h,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              prioritizedBuilder: (context, day, events) {
                                return controller.isDateClicked(day)
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                          bottom: 5.0.h,
                                        ),
                                        child: Container(
                                          width: 20.w,
                                          height: 20.h,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kPrimaryColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              DateFormat('dd').format(day),
                                              style: kCaption1WhiteStyle,
                                            ),
                                          ),
                                        ),
                                      )
                                    : controller.isToday(day)
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              DateFormat('dd').format(day),
                                              style: kCaption1PrimaryStyle,
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              DateFormat('dd').format(day),
                                              style: kCaption1BlackStyle,
                                            ),
                                          );
                              },
                            ),
                          ),
                        )
                      : PageView.builder(
                          controller: PageController(
                              initialPage: controller.currentPageCount.value),
                          onPageChanged: (currentPage) {
                            // controllerTempCount와 비교해서 currentPage와 비교해서
                            // currentPage가 더 크면 1달 추가 그게 아니라면
                            // 1달 감소
                            if (controller.controllerTempCount.value <
                                currentPage) {
                              controller.focusedCalendarDate.value =
                                  Jiffy(controller.focusedCalendarDate.value)
                                      .add(months: 1)
                                      .dateTime;
                            } else {
                              controller.focusedCalendarDate.value =
                                  Jiffy(controller.focusedCalendarDate.value)
                                      .subtract(months: 1)
                                      .dateTime;
                            }

                            controller.controllerTempCount.value = currentPage;
                          },
                          itemBuilder: (context, i) {
                            return ListView(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.h, left: 20.w),
                                  child: Text(
                                    "세번째 주",
                                    style: kSubtitle1BlackStyle,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.h, left: 20.w, right: 20.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: kGrayColor50,
                                      borderRadius:
                                          BorderRadius.circular(20.0.w),
                                    ),
                                    child: Padding(
                                      padding: kPrimaryPadding,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "11월 22일 (화)",
                                                style: kSubtitle2BlackStyle,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(4.w),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kWhiteColor,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      "lib/config/assets/images/diary/weather/sunny.svg",
                                                      width: 16.w,
                                                      height: 16.h,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(4.w),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kWhiteColor,
                                                    ),
                                                    child: SvgPicture.network(
                                                      "https://firebasestorage.googleapis.com/v0/b/dark-room-84532.appspot.com/o/excited.svg?alt=media",
                                                      width: 16.w,
                                                      height: 16.h,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Text(
                                            "가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가마바사 \n- 가나다",
                                            style: kBody1BlackStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.h, left: 20.w, right: 20.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: kGrayColor50,
                                      borderRadius:
                                          BorderRadius.circular(20.0.w),
                                    ),
                                    child: Padding(
                                      padding: kPrimaryPadding,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "11월 22일 (화)",
                                                style: kSubtitle2BlackStyle,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(4.w),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kWhiteColor,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      "lib/config/assets/images/diary/weather/sunny.svg",
                                                      width: 16.w,
                                                      height: 16.h,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(4.w),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kWhiteColor,
                                                    ),
                                                    child: SvgPicture.network(
                                                      "https://firebasestorage.googleapis.com/v0/b/dark-room-84532.appspot.com/o/excited.svg?alt=media",
                                                      width: 16.w,
                                                      height: 16.h,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            height: 200.h,
                                            color: kGrayColor300,
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Text(
                                            "가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가마바사 \n- 가나다",
                                            style: kBody1BlackStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.h, left: 20.w),
                                  child: Text(
                                    "두번째 주",
                                    style: kSubtitle1BlackStyle,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.h, left: 20.w, right: 20.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: kGrayColor50,
                                      borderRadius:
                                          BorderRadius.circular(20.0.w),
                                    ),
                                    child: Padding(
                                      padding: kPrimaryPadding,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "11월 22일 (화)",
                                                style: kSubtitle2BlackStyle,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(4.w),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kWhiteColor,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      "lib/config/assets/images/diary/weather/sunny.svg",
                                                      width: 16.w,
                                                      height: 16.h,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(4.w),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kWhiteColor,
                                                    ),
                                                    child: SvgPicture.network(
                                                      "https://firebasestorage.googleapis.com/v0/b/dark-room-84532.appspot.com/o/excited.svg?alt=media",
                                                      width: 16.w,
                                                      height: 16.h,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Text(
                                            "가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가마바사 \n- 가나다",
                                            style: kBody1BlackStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.h, left: 20.w, right: 20.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: kGrayColor50,
                                      borderRadius:
                                          BorderRadius.circular(20.0.w),
                                    ),
                                    child: Padding(
                                      padding: kPrimaryPadding,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "11월 22일 (화)",
                                                style: kSubtitle2BlackStyle,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(4.w),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kWhiteColor,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      "lib/config/assets/images/diary/weather/sunny.svg",
                                                      width: 16.w,
                                                      height: 16.h,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(4.w),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: kWhiteColor,
                                                    ),
                                                    child: SvgPicture.network(
                                                      "https://firebasestorage.googleapis.com/v0/b/dark-room-84532.appspot.com/o/excited.svg?alt=media",
                                                      width: 16.w,
                                                      height: 16.h,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Container(
                                            height: 200.h,
                                            color: kGrayColor300,
                                          ),
                                          SizedBox(
                                            height: 12.h,
                                          ),
                                          Text(
                                            "가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가마바사 \n- 가나다",
                                            style: kBody1BlackStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
