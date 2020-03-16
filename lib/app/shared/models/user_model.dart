import 'package:poke_api/app/shared/models/pokemon_model.dart';

class UserModel {
  List<PokeModel> pokemonList;
  String id;
  String email;
  String created;
  int userType;

  UserModel({this.pokemonList, this.id, this.email, this.created, this.userType});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemonList'] != null) {
      pokemonList = new List<PokeModel>();
      json['pokemonList'].forEach((v) {
        pokemonList.add(new PokeModel.fromJson(v));
      });
    }
    id = json['_id'];
    email = json['email'];
    created = json['created'];
    userType = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemonList != null) {
      data['pokemonList'] = this.pokemonList.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.id;
    data['email'] = this.email;
    data['created'] = this.created;
    data['__v'] = this.userType;
    return data;
  }

  @override
  String toString() {
    return 'UserModel(pokemonList: $pokemonList, id: $id, email: $email, created: $created, userType: $userType)';
  }
}
