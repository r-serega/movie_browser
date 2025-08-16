
abstract class AccountFields {
  static const id = "id";
  static const name = "name";
  static const username = "username";
  static const includeAdult = "include_adult";
  static const iso_639_1 = "iso_639_1";
  static const iso_3166_1 = "iso_3166_1";
  static const avatar = "avatar";
  static const gravatar = "gravatar";
  static const hash = "hash";
}

class AccountModel {
  final int id;
  final String name;
  final String username;
  final String? includeAdult;
  final String? iso6391;
  final String? iso31661;
  final String? avatar;

  AccountModel({
    required this.id,
    required this.name,
    required this.username,
    this.includeAdult,
    this.iso6391,
    this.iso31661,
    this.avatar,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json[AccountFields.id],
      name: json[AccountFields.name],
      username: json[AccountFields.username],
      includeAdult: json[AccountFields.includeAdult]?.toString(),
      iso6391: json[AccountFields.iso_639_1],
      iso31661: json[AccountFields.iso_3166_1],
      avatar: json[AccountFields.avatar]?[AccountFields.gravatar]?[AccountFields.hash],
    );
  }
}
