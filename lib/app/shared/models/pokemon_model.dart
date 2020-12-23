import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class PokemonModel {
  PokemonModel({
    @required this.height,
    @required this.id,
    @required this.name,
    @required this.sprites,
    @required this.stats,
    @required this.types,
    @required this.weight,
  });

  final int height;
  final int id;
  final String name;
  final Sprites sprites;
  final List<StatElement> stats;
  final List<Type> types;
  final int weight;

  PokemonModel copyWith({
    int height,
    int id,
    String name,
    Sprites sprites,
    List<StatElement> stats,
    List<Type> types,
    int weight,
  }) =>
      PokemonModel(
        height: height ?? this.height,
        id: id ?? this.id,
        name: name ?? this.name,
        sprites: sprites ?? this.sprites,
        stats: stats ?? this.stats,
        types: types ?? this.types,
        weight: weight ?? this.weight,
      );

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        height: json["height"] == null ? null : json["height"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : toBeginningOfSentenceCase(json["name"].toLowerCase()),
        sprites: json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
        stats: json["stats"] == null ? null : List<StatElement>.from(json["stats"].map((x) => StatElement.fromJson(x))),
        types: json["types"] == null ? null : List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"] == null ? null : json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "sprites": sprites == null ? null : sprites.toJson(),
        "stats": stats == null ? null : List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": types == null ? null : List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight == null ? null : weight,
      };

  @override
  String toString() {
    return 'PokemonModel(height: $height, id: $id, name: $name, sprites: $sprites, stats: $stats, types: $types, weight: $weight)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is PokemonModel &&
      o.height == height &&
      o.id == id &&
      o.name == name &&
      o.sprites == sprites &&
      listEquals(o.stats, stats) &&
      listEquals(o.types, types) &&
      o.weight == weight;
  }

  @override
  int get hashCode {
    return height.hashCode ^
      id.hashCode ^
      name.hashCode ^
      sprites.hashCode ^
      stats.hashCode ^
      types.hashCode ^
      weight.hashCode;
  }
}

class Sprites {
  Sprites({
    @required this.backDefault,
    @required this.backFemale,
    @required this.backShiny,
    @required this.backShinyFemale,
    @required this.frontDefault,
    @required this.frontFemale,
    @required this.frontShiny,
    @required this.frontShinyFemale,
    @required this.other,
    @required this.versions,
  });

  final String backDefault;
  final String backFemale;
  final String backShiny;
  final String backShinyFemale;
  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final String frontShinyFemale;
  final Other other;
  final Versions versions;

  Sprites copyWith({
    String backDefault,
    String backFemale,
    String backShiny,
    String backShinyFemale,
    String frontDefault,
    String frontFemale,
    String frontShiny,
    String frontShinyFemale,
    Other other,
    Versions versions,
  }) =>
      Sprites(
        backDefault: backDefault ?? this.backDefault,
        backFemale: backFemale ?? this.backFemale,
        backShiny: backShiny ?? this.backShiny,
        backShinyFemale: backShinyFemale ?? this.backShinyFemale,
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
        other: other ?? this.other,
        versions: versions ?? this.versions,
      );

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"] == null ? null : json["back_default"],
        backFemale: json["back_female"] == null ? null : json["back_female"],
        backShiny: json["back_shiny"] == null ? null : json["back_shiny"],
        backShinyFemale: json["back_shiny_female"] == null ? null : json["back_shiny_female"],
        frontDefault: json["front_default"] == null ? null : json["front_default"],
        frontFemale: json["front_female"] == null ? null : json["front_female"],
        frontShiny: json["front_shiny"] == null ? null : json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"] == null ? null : json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
        versions: json["versions"] == null ? null : Versions.fromJson(json["versions"]),
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault == null ? null : backDefault,
        "back_female": backFemale == null ? null : backFemale,
        "back_shiny": backShiny == null ? null : backShiny,
        "back_shiny_female": backShinyFemale == null ? null : backShinyFemale,
        "front_default": frontDefault == null ? null : frontDefault,
        "front_female": frontFemale == null ? null : frontFemale,
        "front_shiny": frontShiny == null ? null : frontShiny,
        "front_shiny_female": frontShinyFemale == null ? null : frontShinyFemale,
        "other": other == null ? null : other.toJson(),
        "versions": versions == null ? null : versions.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Sprites &&
      o.backDefault == backDefault &&
      o.backFemale == backFemale &&
      o.backShiny == backShiny &&
      o.backShinyFemale == backShinyFemale &&
      o.frontDefault == frontDefault &&
      o.frontFemale == frontFemale &&
      o.frontShiny == frontShiny &&
      o.frontShinyFemale == frontShinyFemale &&
      o.other == other &&
      o.versions == versions;
  }

  @override
  int get hashCode {
    return backDefault.hashCode ^
      backFemale.hashCode ^
      backShiny.hashCode ^
      backShinyFemale.hashCode ^
      frontDefault.hashCode ^
      frontFemale.hashCode ^
      frontShiny.hashCode ^
      frontShinyFemale.hashCode ^
      other.hashCode ^
      versions.hashCode;
  }
}

class Other {
  Other({
    @required this.dreamWorld,
  });

  final DreamWorld dreamWorld;

  Other copyWith({
    DreamWorld dreamWorld,
  }) =>
      Other(
        dreamWorld: dreamWorld ?? this.dreamWorld,
      );

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: json["dream_world"] == null ? null : DreamWorld.fromJson(json["dream_world"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld == null ? null : dreamWorld.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Other &&
      o.dreamWorld == dreamWorld;
  }

  @override
  int get hashCode => dreamWorld.hashCode;
}

class DreamWorld {
  DreamWorld({
    @required this.frontDefault,
    @required this.frontFemale,
  });

  final String frontDefault;
  final dynamic frontFemale;

  DreamWorld copyWith({
    String frontDefault,
    dynamic frontFemale,
  }) =>
      DreamWorld(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
      );

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"] == null ? null : json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault == null ? null : frontDefault,
        "front_female": frontFemale,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is DreamWorld &&
      o.frontDefault == frontDefault &&
      o.frontFemale == frontFemale;
  }

  @override
  int get hashCode => frontDefault.hashCode ^ frontFemale.hashCode;
}

class Versions {
  Versions({
    @required this.generationI,
  });

  final GenerationI generationI;

  Versions copyWith({
    GenerationI generationI,
  }) =>
      Versions(
        generationI: generationI ?? this.generationI,
      );

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: json["generation-i"] == null ? null : GenerationI.fromJson(json["generation-i"]),
      );

  Map<String, dynamic> toJson() => {
        "generation-i": generationI == null ? null : generationI.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Versions &&
      o.generationI == generationI;
  }

  @override
  int get hashCode => generationI.hashCode;
}

class GenerationI {
  GenerationI({
    @required this.redBlue,
    @required this.yellow,
  });

  final RedBlue redBlue;
  final RedBlue yellow;

  GenerationI copyWith({
    RedBlue redBlue,
    RedBlue yellow,
  }) =>
      GenerationI(
        redBlue: redBlue ?? this.redBlue,
        yellow: yellow ?? this.yellow,
      );

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: json["red-blue"] == null ? null : RedBlue.fromJson(json["red-blue"]),
        yellow: json["yellow"] == null ? null : RedBlue.fromJson(json["yellow"]),
      );

  Map<String, dynamic> toJson() => {
        "red-blue": redBlue == null ? null : redBlue.toJson(),
        "yellow": yellow == null ? null : yellow.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is GenerationI &&
      o.redBlue == redBlue &&
      o.yellow == yellow;
  }

  @override
  int get hashCode => redBlue.hashCode ^ yellow.hashCode;
}

class RedBlue {
  RedBlue({
    @required this.backDefault,
    @required this.backGray,
    @required this.frontDefault,
    @required this.frontGray,
  });

  final String backDefault;
  final String backGray;
  final String frontDefault;
  final String frontGray;

  RedBlue copyWith({
    String backDefault,
    String backGray,
    String frontDefault,
    String frontGray,
  }) =>
      RedBlue(
        backDefault: backDefault ?? this.backDefault,
        backGray: backGray ?? this.backGray,
        frontDefault: frontDefault ?? this.frontDefault,
        frontGray: frontGray ?? this.frontGray,
      );

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"] == null ? null : json["back_default"],
        backGray: json["back_gray"] == null ? null : json["back_gray"],
        frontDefault: json["front_default"] == null ? null : json["front_default"],
        frontGray: json["front_gray"] == null ? null : json["front_gray"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault == null ? null : backDefault,
        "back_gray": backGray == null ? null : backGray,
        "front_default": frontDefault == null ? null : frontDefault,
        "front_gray": frontGray == null ? null : frontGray,
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is RedBlue &&
      o.backDefault == backDefault &&
      o.backGray == backGray &&
      o.frontDefault == frontDefault &&
      o.frontGray == frontGray;
  }

  @override
  int get hashCode {
    return backDefault.hashCode ^
      backGray.hashCode ^
      frontDefault.hashCode ^
      frontGray.hashCode;
  }
}

class StatElement {
  StatElement({
    @required this.baseStat,
    @required this.effort,
    @required this.stat,
  });

  final int baseStat;
  final int effort;
  final TypeClass stat;

  StatElement copyWith({
    int baseStat,
    int effort,
    TypeClass stat,
  }) =>
      StatElement(
        baseStat: baseStat ?? this.baseStat,
        effort: effort ?? this.effort,
        stat: stat ?? this.stat,
      );

  factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
        baseStat: json["base_stat"] == null ? null : json["base_stat"],
        effort: json["effort"] == null ? null : json["effort"],
        stat: json["stat"] == null ? null : TypeClass.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat == null ? null : baseStat,
        "effort": effort == null ? null : effort,
        "stat": stat == null ? null : stat.toJson(),
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is StatElement &&
      o.baseStat == baseStat &&
      o.effort == effort &&
      o.stat == stat;
  }

  @override
  int get hashCode => baseStat.hashCode ^ effort.hashCode ^ stat.hashCode;
}

class TypeClass {
  TypeClass({
    @required this.name,
    @required this.url,
  });

  final String name;
  final String url;

  TypeClass copyWith({
    String name,
    String url,
  }) =>
      TypeClass(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
        name: json["name"] == null ? null : toBeginningOfSentenceCase(json["name"].toLowerCase()),
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };

  @override
  String toString() => 'TypeClass(name: $name, url: $url)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is TypeClass &&
      o.name == name &&
      o.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class Type {
  Type({
    @required this.slot,
    @required this.type,
  });

  final int slot;
  final TypeClass type;

  Type copyWith({
    int slot,
    TypeClass type,
  }) =>
      Type(
        slot: slot ?? this.slot,
        type: type ?? this.type,
      );

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"] == null ? null : json["slot"],
        type: json["type"] == null ? null : TypeClass.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot == null ? null : slot,
        "type": type == null ? null : type.toJson(),
      };

  @override
  String toString() => 'Type(slot: $slot, type: $type)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Type &&
      o.slot == slot &&
      o.type == type;
  }

  @override
  int get hashCode => slot.hashCode ^ type.hashCode;
}
