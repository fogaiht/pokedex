import 'dart:convert';

import 'package:poke_api/app/shared/models/categoria_model.dart';

class ProdutoModel {
  int id;
  String nome;
  String descricao;
  double preco;
  int categoriaId;

  ProdutoModel({this.id, this.nome, this.descricao, this.preco, this.categoriaId});

  ProdutoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    preco = json['preco'];
    categoriaId = json['categoria_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    data['categoria_id'] = this.categoriaId;
    return data;
  }


  @override
  String toString() {
    return 'ProdutoModel id: $id, nome: $nome, descricao: $descricao, preco: $preco, categoriaId: $categoriaId';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ProdutoModel &&
      o.id == id &&
      o.nome == nome &&
      o.descricao == descricao &&
      o.preco == preco &&
      o.categoriaId == categoriaId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nome.hashCode ^
      descricao.hashCode ^
      preco.hashCode ^
      categoriaId.hashCode;
  }
}
