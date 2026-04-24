import 'package:evently_app/models/catogory_model.dart';
import 'package:flutter/material.dart';

class EvnentProvider extends ChangeNotifier {
  CategoryModel slectedCategory = CategoryModel.generateCategories().first;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  editSlectedcategory(CategoryModel newcat) {
    slectedCategory = newcat;
    notifyListeners();
  }

  editDate(DateTime newdate) {
    selectedDate = newdate;
    notifyListeners();
  }

  editTime(TimeOfDay newTime) {
    selectedTime = newTime;
    notifyListeners();
  }
}
