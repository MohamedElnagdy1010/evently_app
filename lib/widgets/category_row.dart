import 'package:evently_app/models/catogory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CategoryRow extends StatefulWidget {
  const CategoryRow({super.key, this.showall = false});
  final bool showall;
  @override
  State<CategoryRow> createState() => _CategoryRowState();
}

class _CategoryRowState extends State<CategoryRow> {
  int slected_category = 0;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [
          if (widget.showall)
            ChoiceChip(
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.category_rounded,
                      color: slected_category == 0 ? Colors.white : null,
                    ),
                    Gap(8),
                    Text("All",style: theme.textTheme.titleMedium!.copyWith(
                color: slected_category == 0 ? Colors.white: null ,),
                  )  ],
                ),
              ),
              // labelStyle: theme.textTheme.titleMedium!.copyWith(
              //   color: slected_category == 0 ? Colors.white: null ,
              // ),
              selected: slected_category == 0,
              backgroundColor: theme.cardColor,
              selectedColor: theme.primaryColor,

              side: BorderSide(color: theme.dividerColor),
              onSelected: (value) {
                setState(() {
                  slected_category = 0;
                });
              },
              showCheckmark: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
            ),

          ...CategoryModel.generateCategories().map(
            (e) => ChoiceChip(
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      e.iconpath,
                      colorFilter: slected_category == e.id
                          ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
                          : null,
                    ),
                    Gap(8),
                    Text(e.title),
                  ],
                ),
              ),
              labelStyle: theme.textTheme.titleMedium!.copyWith(
                color: slected_category == e.id ? Colors.white : null,
              ),

              selected: slected_category == e.id,

              backgroundColor: theme.cardColor,
              selectedColor: theme.primaryColor,

              side: BorderSide(color: theme.dividerColor),
              onSelected: (value) {
                setState(() {
                  slected_category = e.id;
                });
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
