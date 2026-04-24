// ignore_for_file: file_names, unused_import

import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/common/theme/app_color.dart';
import 'package:evently_app/common/theme/text_style.dart';
import 'package:evently_app/models/catogory_model.dart';
import 'package:evently_app/screens/home/event/event_card.dart';
import 'package:evently_app/widgets/category_row.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  static const String routeName = "/HomeTab";
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back ✨",
                    style: theme.textTheme.labelSmall!.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                  Text(
                    "Mohamed ayman",
                    style: theme.textTheme.displaySmall!.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.wb_sunny_outlined),
                  Gap(4),
                  SizedBox(
                    height: 32,
                    width: 32,

                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      child: Text(
                        "EN",
                        style: AppTextStyle.style14w600black.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Gap(24),
          CategoryRow(showall: true),
          Gap(15),
        EventCard(),
        EventCard(),  EventCard(),  EventCard(),  EventCard(),  EventCard(),  EventCard(),  EventCard(),
        ],
      ),
    );
  }
}
