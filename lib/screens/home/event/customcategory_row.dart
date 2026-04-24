import 'package:evently_app/models/catogory_model.dart';
import 'package:evently_app/screens/events/provider/evnent_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CustomCategoryRow extends StatelessWidget {
  const CustomCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    CategoryModel slectedCategory = Provider.of<EvnentProvider>(
      context,
    ).slectedCategory;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [
          ...CategoryModel.generateCategories().map(
            (e) => ChoiceChip(
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      e.iconpath,
                      colorFilter: slectedCategory.id == e.id
                          ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
                          : null,
                    ),
                    Gap(8),
                    Text(e.title),
                  ],
                ),
              ),
              labelStyle: theme.textTheme.titleMedium!.copyWith(
                color: slectedCategory.id == e.id ? Colors.white : null,
              ),

              selected: slectedCategory.id == e.id,

              backgroundColor: theme.cardColor,
              selectedColor: theme.primaryColor,

              side: BorderSide(color: theme.dividerColor),
              onSelected: (value) {
                Provider.of<EvnentProvider>(
                  context,
                  listen: false,
                ).editSlectedcategory(e);
              },
              showCheckmark: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
