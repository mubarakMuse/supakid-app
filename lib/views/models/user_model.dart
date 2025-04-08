// class   UserModel {
//   int id;
//   String email;
//   String password;
//   int? childProfiles;
//   String? subscriptionPlan;
//   String? role;
//   String createdAt;
//   String updatedAt;
//
//
//   UserModel({
//     this.id = 0,
//     this.email = "",
//     this.password = "",
//     this.childProfiles = 0,
//     this.subscriptionPlan = "",
//     this.role = "",
//     this.createdAt = "",
//     this.updatedAt = "",
//   });
//
//   UserModel.fromJson(Map<String, dynamic> json)
//       : id = json['id'] ?? 0,
//         email = json['email'] ?? "",
//         password = json['password'] ?? "",
//         childProfiles = json['childProfiles'] ?? 0,
//         subscriptionPlan = json['subscriptionPlan'] ?? "basic",
//         role = json['role'] ?? "user",
//         createdAt = json['createdAt'] ?? "",
//         updatedAt = json['updatedAt'] ?? "";
//
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'email': email,
//       'password': password,
//       'childProfiles': childProfiles,
//       'subscriptionPlan': subscriptionPlan,
//       'role': role,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//
//     };
//   }
//
//   @override
//   String toString() {
//     return 'UserModel{id: $id, email: $email, password: $password, role:$role, childProfiles: $childProfiles, subscriptionPlan: $subscriptionPlan, createdAt: $createdAt, updatedAt: $updatedAt,}';
//   }
// }
import 'child_profile_model.dart';

class UserModel {
  int id;
  String email;
  String password;
  int? childProfiles;
  String? subscriptionPlan;
  String? role;
  String createdAt;
  String updatedAt;
  List<ChildProfileModel> children;

  UserModel({
    this.id = 0,
    this.email = "",
    this.password = "",
    this.childProfiles = 0,
    this.subscriptionPlan = "",
    this.role = "",
    this.createdAt = "",
    this.updatedAt = "",
    this.children = const [],
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        email = json['email'] ?? "",
        password = json['password'] ?? "",
        childProfiles = json['childProfiles'] ?? 0,
        subscriptionPlan = json['subscriptionPlan'] ?? "basic",
        role = json['role'] ?? "user",
        createdAt = json['createdAt'] ?? "",
        updatedAt = json['updatedAt'] ?? "",
        children = (json['children'] as List<dynamic>?)
            ?.map((e) => ChildProfileModel.fromJson(e))
            .toList() ??
            [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'childProfiles': childProfiles,
      'subscriptionPlan': subscriptionPlan,
      'role': role,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'children': children.map((e) => e.toJson()).toList(),
    };
  }

  UserModel copyWith({List<ChildProfileModel>? children}) {
    return UserModel(
      id: id,
      email: email,
      password: password,
      childProfiles: childProfiles,
      subscriptionPlan: subscriptionPlan,
      role: role,
      createdAt: createdAt,
      updatedAt: updatedAt,
      children: children ?? this.children,
    );
  }

  @override
  String toString() {
    return 'UserModel{id: $id, email: $email, role:$role, childProfiles: $childProfiles, subscriptionPlan: $subscriptionPlan, children: $children}';
  }
}
