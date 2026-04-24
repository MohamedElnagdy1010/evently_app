// ignore_for_file: dead_code, unused_import, avoid_print

import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/screens/events/provider/evnent_provider.dart';
import 'package:evently_app/screens/home/event/customcategory_row.dart';
import 'package:evently_app/screens/home/event/event_card.dart';
import 'package:evently_app/widgets/custom_filled_button.dart';
import 'package:evently_app/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddNewEvent extends StatefulWidget {
  const AddNewEvent({super.key});
  static const String routeName = "/AddNewEvent";
  @override
  State<AddNewEvent> createState() => _AddNewEventState();
}

class _AddNewEventState extends State<AddNewEvent> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => EvnentProvider(),
      child: Consumer<EvnentProvider>(
        builder: (BuildContext context, EvnentProvider value, Widget? child) {
          print(".....Refresh............");
          return Scaffold(
            appBar: AppBar(title: Text("Add New Event")),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(10),
                    width: double.infinity,

                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          theme.dividerColor,
                          BlendMode.modulate,
                        ),
                        image: AssetImage(value.slectedCategory.image),
                        fit: BoxFit.fill,
                      ),
                      border: Border.all(color: theme.dividerColor),
                    ),
                  ),
                  Gap(16),
                  CustomCategoryRow(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title", style: theme.textTheme.titleMedium),
                      Gap(8),
                      CustomTextField(
                        hintText: 'Event Title',
                        controller: titleController,
                      ),
                      Text("Description", style: theme.textTheme.titleMedium),
                      Gap(8),
                      CustomTextField(
                        hintText: "Event Description",
                        controller: descController,
                        maxLines: 8,
                      ),
                      drowDateTimerow(
                        Icons.date_range_outlined,
                        "Event Date",
                        (value.selectedDate == null
                            ? "Choose date"
                            : "${value.selectedDate!.day}/${value.selectedDate!.month}/${value.selectedDate!.year}"),
                        () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                            initialDate: DateTime.now(),
                          );
                          if (selectedDate != null) {
                            value.selectedDate = selectedDate;
                          }
                        },
                      ),

                      drowDateTimerow(
                        Icons.timelapse_rounded,
                        "Event time",
                        (value.selectedTime == null
                            ? "Choose Time"
                            : value.selectedTime!.format(context)),
                        () async {
                          TimeOfDay? selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (selectedTime != null) {
                            value.selectedTime = selectedTime;
                          }
                        },
                      ),
                      Gap(4),
                      CustomFilledButton(text: "Add Event", onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ListTile drowDateTimerow(
    IconData icon,
    String title,
    String trailingTitle,
    void Function() onSelect,
  ) {
    ThemeData theme = Theme.of(context);
    return ListTile(
      dense: false,
      contentPadding: EdgeInsets.all(0),
      leading: Icon(icon, color: theme.primaryColor),
      title: Text(title, style: theme.textTheme.titleMedium),
      trailing: TextButton(
        onPressed: onSelect,
        child: Text(
          trailingTitle,
          style: theme.textTheme.labelSmall!.copyWith(
            color: theme.primaryColor,
            decoration: TextDecoration.underline,
            decorationColor: theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
