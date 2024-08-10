import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  final List<Range> initialRanges;
  final Function(DateTime) onDateSelected;

  CustomCalendar({
    Key? key,
    required this.initialRanges,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  List<Range> _selectedRanges = [];

  @override
  void initState() {
    super.initState();
    _selectedRanges = widget.initialRanges;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      if (start != null && end != null) {
        _selectedRanges.add(Range(
            start,
            end,
            Colors
                .primaries[_selectedRanges.length % Colors.primaries.length]));
      }
      _focusedDay = focusedDay;
      _rangeStart = null;
      _rangeEnd = null;
    });
  }

  bool _isWeekend(DateTime day) {
    return day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime(2000),
          lastDay: DateTime(2025),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: _calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
            widget.onDateSelected(selectedDay);
          },
          rangeStartDay: _rangeStart,
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          rangeEndDay: _rangeEnd,
          calendarStyle: CalendarStyle(
            rangeHighlightColor: Colors.grey.withOpacity(0.3),
          ),
          onRangeSelected: _onRangeSelected,
          onFormatChanged: (CalendarFormat format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          calendarBuilders: CalendarBuilders(
            rangeHighlightBuilder: (context, day, focusedDay) {
              if (_isWeekend(day)) {
                return null;
              }
              for (var range in _selectedRanges) {
                if (day.isAfter(range.start.subtract(Duration(days: 1))) &&
                    day.isBefore(range.end.add(Duration(days: 1)))) {
                  return Container(
                    margin: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      color: range.color.withOpacity(0.3),
                    ),
                  );
                }
              }
              return null;
            },
            rangeStartBuilder: (context, day, focusedDay) {
              if (_isWeekend(day)) {
                return null;
              }
              for (var range in _selectedRanges) {
                if (isSameDay(day, range.start)) {
                  return Container(
                    margin: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      color: range.color.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  );
                }
              }
              return null;
            },
            rangeEndBuilder: (context, day, focusedDay) {
              if (_isWeekend(day)) {
                return null;
              }
              for (var range in _selectedRanges) {
                if (isSameDay(day, range.end)) {
                  return Container(
                    margin: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      color: range.color.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  );
                }
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}

class Range {
  final DateTime start;
  final DateTime end;
  final Color color;

  Range(this.start, this.end, this.color);
}
