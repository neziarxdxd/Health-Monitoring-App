import 'package:healthmonitor/models/bmi.dart';
import 'package:healthmonitor/repositories/repository.dart';

class BMIService {
  Repository _repository;

  BMIService() {
    _repository = Repository();
  }

  // Create data
  saveBMI(BMI bmi) async {
    return await _repository.insertData('bmi', bmi.categoryMap());
  }

  readBMI() async {
    return await _repository.readData('bmi');
  }
}
