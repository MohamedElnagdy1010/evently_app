// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_import

import 'package:evently_app/models/catogory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/common/theme/app_color.dart';
import 'package:evently_app/models/event_model.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.eventModel}) : super(key: key);
  final EventModel eventModel;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(10),
      width: double.infinity,

      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(theme.dividerColor, BlendMode.modulate),
          image: AssetImage(CategoryModel.getcatimage(eventModel.catId)),
          fit: BoxFit.fill,
        ),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: theme.dividerColor),
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              eventModel.date.day.toString(),
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.primaryColor,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: theme.dividerColor),
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  eventModel.title,
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgPicture.asset(Assets.icons.heartUnselected.path),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
