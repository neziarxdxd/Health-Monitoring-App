import 'package:healthmonitor/models/bmi.dart';
import 'package:healthmonitor/repositories/repository.dart';

class BMIService {
  Repository _repository;

  BMIService() {
    _repository = Repository();
  }

  // Create data
  saveCategory(BMI bmi) async {
    return await _repository.insertData('categories', bmi.categoryMap());
  }
}
