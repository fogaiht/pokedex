class PokeModel {
  int id;
  int height;
  bool isDefault;
  bool captured;
  String locationAreaEncounters;
  String name;
  int order;
  Sprites sprites;
  List<Stats> stats;
  List<Types> types;
  int weight;

  PokeModel(
      {this.height,
      this.id,
      this.isDefault,
      this.captured,
      this.locationAreaEncounters,
      this.name,
      this.order,
      this.sprites,
      this.stats,
      this.types,
      this.weight});

  PokeModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    isDefault = json['is_default'];
    captured = json['captured'];
    locationAreaEncounters = json['location_area_encounters'];
    name = json['name'];
    order = json['order'];
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = new List<Stats>();
      json['stats'].forEach((v) {
        stats.add(new Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = new List<Types>();
      json['types'].forEach((v) {
        types.add(new Types.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['id'] = this.id;
    data['is_default'] = this.isDefault;
    data['captured'] = this.captured;
    data['location_area_encounters'] = this.locationAreaEncounters;
    data['name'] = this.name;
    data['order'] = this.order;
    if (this.sprites != null) {
      data['sprites'] = this.sprites.toJson();
    }
    if (this.stats != null) {
      data['stats'] = this.stats.map((v) => v.toJson()).toList();
    }
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    data['weight'] = this.weight;
    return data;
  }
}

class Sprites {
  String backDefault;
  String frontDefault;

  Sprites({this.backDefault, this.frontDefault});

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['front_default'] = this.frontDefault;
    return data;
  }
}

class Stats {
  int baseStat;
  int effort;
  Stat stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? new Stat.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_stat'] = this.baseStat;
    data['effort'] = this.effort;
    if (this.stat != null) {
      data['stat'] = this.stat.toJson();
    }
    return data;
  }
}

class Stat {
  String name;
  String url;

  Stat({this.name, this.url});

  Stat.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Types {
  int slot;
  Stat type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? new Stat.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    return data;
  }
}