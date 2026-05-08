import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/models/catogory_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/screens/events/provider/evnent_provider.dart';
import 'package:evently_app/screens/home/tabs/hometab/editScreen.dart';
import 'package:evently_app/services/event_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Detailsscreen extends StatefulWidget {
  const Detailsscreen({super.key, required this.eventModel});
  static const String routeName = "/Detailsscreen";
  final EventModel eventModel;
  @override
  State<Detailsscreen> createState() => _DetailsscreenState();
}

class _DetailsscreenState extends State<Detailsscreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (BuildContext context) => EvnentProvider(),
      child: Form(
        key: _globalKey,
        child: Consumer<EvnentProvider>(
          builder: (BuildContext context, EvnentProvider value, Widget? child) {
            print(".....Refresh............");
            return Scaffold(
              appBar: AppBar(
                title: Text("Event details"),
                actions: [
                  OutlinedButtondetails(
                    SvgPicture.asset(
                      Assets.icons.edit.path,
                      colorFilter: ColorFilter.mode(
                        theme.colorScheme.inversePrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                    () {
                      Navigator.pushNamed(
                        context,
                        Editscreen.routeName,
                        arguments: widget.eventModel,
                      );
                    },
                  ),
                  Gap(5),
                  OutlinedButtondetails(
                    SvgPicture.asset(
                      Assets.icons.trash.path,
                      colorFilter: ColorFilter.mode(
                        Colors.red,
                        BlendMode.srcIn,
                      ),
                    ),
                    () async {
                      print("..........${widget.eventModel.id!}............");
                      await EventService.deleteEvent(widget.eventModel.id!);
                      Navigator.pop(context);
                      print("..........${widget.eventModel.id!}............");
                    },
                  ),
                ],
              ),
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
                          image: AssetImage(
                            CategoryModel.getcatimage(widget.eventModel.catId),
                          ),
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(color: theme.dividerColor),
                      ),
                    ),
                    Gap(16),
                    Text(
                      widget.eventModel.title,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        color: theme.hintColor,
                      ),
                    ),

                    Card(
                      elevation: 5,

                      shape: Border.all(color: theme.dividerColor),
                      child: ListTile(
                        leading: Icon(Icons.date_range_outlined, size: 30),
                        title: Text(
                          DateFormat("MMM d y ").format(widget.eventModel.date),
                        ),
                        subtitle: Text(
                          DateFormat("h:mm a ").format(widget.eventModel.date),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Description", style: theme.textTheme.titleMedium),
                        Gap(8),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: theme.dividerColor),
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 180,
                          width: double.infinity,
                          child: Text(
                            widget.eventModel.description,
                            style: theme.textTheme.labelMedium!.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  OutlinedButton OutlinedButtondetails(
    Widget child,
    void Function()? onPressed,
  ) {
    return OutlinedButton(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.all(0),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
