class BMI {
  int id;
  int weight;
  int height;
  int age;
  String gender;

  categoryMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['weight'] = weight;
    mapping['height'] = height;
    mapping['age'] = age;
    mapping['gender'] = gender;

    return mapping;
  }
}
