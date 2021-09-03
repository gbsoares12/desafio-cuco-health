import 'package:desafio_cuco/features/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required name,
    required email,
    required photoUrl,
  }) : super(
          name: name,
          email: email,
          photoUrl: photoUrl,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: "${json['name']['first']} ${json['name']['last']}",
      email: json['email'],
      photoUrl: json['picture']['large'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "photoUrl": photoUrl,
    };
  }
}
