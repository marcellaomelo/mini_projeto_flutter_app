import 'package:flutter/cupertino.dart';

class Forms {
  final String id;
  final String estado;
  final String titulo;
  final String descricao;
  final String morada;
  final String avatarUrl;

  const Forms(
      {this.id,
      this.estado,
      @required this.descricao,
      this.morada,
      @required this.titulo,
      @required this.avatarUrl});

  FechaIncidente(String id_form) {}
}
