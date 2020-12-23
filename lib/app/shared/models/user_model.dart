import 'package:flutter/foundation.dart';

import 'pokemon_model.dart';

class UserModel {
  List<PokemonModel> pokemonList;
  String id;
  String name;
  String email;
  String created;
  int userType;

  UserModel({
    this.pokemonList,
    this.id,
    this.email,
    this.created,
    this.userType,
    this.name,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemonList'] != null) {
      pokemonList = new List<PokemonModel>();
      json['pokemonList'].forEach((v) {
        pokemonList.add(new PokemonModel.fromJson(v));
      });
    }

    pokemonList.sort((a, b) => a.id.compareTo(b.id));

    id = json['_id'];
    name = json['name'];
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
    data['name'] = this.name;
    data['created'] = this.created;
    data['__v'] = this.userType;
    return data;
  }

  @override
  String toString() {
    return 'UserModel(pokemonList: $pokemonList, id: $id, name: $name, email: $email, created: $created, userType: $userType)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        listEquals(o.pokemonList, pokemonList) &&
        o.id == id &&
        o.name == name &&
        o.email == email &&
        o.created == created &&
        o.userType == userType;
  }

  @override
  int get hashCode {
    return pokemonList.hashCode ^ id.hashCode ^ name.hashCode ^ email.hashCode ^ created.hashCode ^ userType.hashCode;
  }
}
