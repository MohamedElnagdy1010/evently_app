// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_import

import 'package:evently_app/models/catogory_model.dart';
import 'package:evently_app/screens/home/tabs/hometab/detailsScreen.dart';
import 'package:evently_app/services/event_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/common/theme/app_color.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:intl/intl.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late bool isfav = !widget.eventModel.isFav;
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
          image: AssetImage(CategoryModel.getcatimage(widget.eventModel.catId)),
          fit: BoxFit.fill,
        ),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: theme.dividerColor),
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  DateFormat(" d MMM   ").format(widget.eventModel.date),
                  //  DateFormat("EEEE").format(  widget.eventModel.date.day.toString() )
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: theme.dividerColor),
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Detailsscreen.routeName,
                      arguments: widget.eventModel,
                    );
                  },
                  child: Text(
                    "Show details",
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
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
                  widget.eventModel.title,
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isfav = !isfav;
                    });
                    if (isfav) {
                      await EventService.removeFromWishlist(widget.eventModel);
                    } else {
                      await EventService.addToWishlist(widget.eventModel);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isfav
                        ? Icon(Icons.favorite_outline)
                        : Icon(Icons.favorite, color: AppColor.Red),
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
