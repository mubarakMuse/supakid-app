class ChildProfileModel {
  int id;
  String name;
  int age;
  List<String> interests;
  String gender;
  String languagePreference;

  ChildProfileModel({
    this.id = 0,
    this.name = "",
    this.age = 0,
    this.interests = const [],
    this.gender = "",
    this.languagePreference = "",
  });

  ChildProfileModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? "",
        age = json['age'] ?? 0,
        interests = List<String>.from(json['interests'] ?? []),
        gender = json['gender'] ?? "",
        languagePreference = json['languagePreference'] ?? "";

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'interests': interests.join(', '),
      'gender': gender,
    };
  }

  @override
  String toString() {
    return 'ChildProfileModel{id: $id, name: $name, age: $age, interests: $interests, gender: $gender, content Prefer: $languagePreference}';
  }
}
