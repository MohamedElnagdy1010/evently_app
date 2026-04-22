// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evently_app/common/gen/assets.gen.dart';

class CategoryModel {
  String title;
  String image;
  String iconpath;
  int id;
  CategoryModel({
    required this.title,
    required this.image,
    required this.iconpath,
    required this.id,
  });
  static List<CategoryModel> generateCategories() {
    return [
      CategoryModel(
        title: "Book club",
        image: "",
        iconpath: Assets.icons.bookUnselected.path,
        id: 1,
      ),
      CategoryModel(
        title: "Sports",
        image: "",
        iconpath: Assets.icons.sportUnselected.path,
        id: 2,
      ),
      CategoryModel(
        title: "Birthday",
        image: "",
        iconpath: Assets.icons.birthdayUnselected.path,
        id: 3,
      ),
    ];
  }
}
