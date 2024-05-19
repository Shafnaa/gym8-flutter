import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/common/widgets/loader.dart';
import 'package:gym8/core/theme/app_pallete.dart';
import 'package:gym8/core/utils/show_snackbar.dart';
import 'package:gym8/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({
    super.key,
  });

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  @override
  void initState() {
    super.initState();

    context.read<ScheduleBloc>().add(ScheduleFetchAllSchedules());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScheduleBloc, ScheduleState>(
      listener: (context, state) {
        if (state is ScheduleFailure) {
          showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is ScheduleLoading) {
          return const Loader();
        }

        if (state is SchedulesDisplaySuccess) {
          return TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2023, 10, 16),
            lastDay: DateTime.utc(2025, 3, 14),
            // eventLoader: (day) => day.day == 1
            //     ? [
            //         "Testing",
            //       ]
            //     : null,
            calendarFormat: CalendarFormat.month,
            availableCalendarFormats: const {CalendarFormat.month: "Month"},
            headerStyle: HeaderStyle(
              titleCentered: true,
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              titleTextFormatter: (date, locale) =>
                  DateFormat.MMM(locale).format(date),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) =>
                  DateFormat.E(locale).format(date).substring(0, 2),
              weekdayStyle: const TextStyle(
                color: AppPallete.greenColor,
                fontWeight: FontWeight.w500,
              ),
              weekendStyle: const TextStyle(
                color: AppPallete.whiteColor,
                fontWeight: FontWeight.w200,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
            weekendDays: state.schedules
                .where((element) => element.splitId == 1)
                .map((e) => e.dayId)
                .toList(),
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              todayDecoration: BoxDecoration(
                color: AppPallete.blueColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              outsideDaysVisible: true,
              outsideTextStyle: const TextStyle(
                color: AppPallete.darkGrayColor,
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
