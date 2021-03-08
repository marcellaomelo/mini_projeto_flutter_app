import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_projeto_flutter_app/data/dataSource.dart';
import 'package:mini_projeto_flutter_app/models/forms.dart';
import 'package:provider/provider.dart';

class FormViewsFechados with ChangeNotifier {
  var lista = new List();

  final Map<String, Forms> _items = {...dataSource};
  static FormViewsFechados _instancia;
  FormViewsFechados._internal();

  static FormViewsFechados getInstancia() {
    if (_instancia == null) {
      _instancia = FormViewsFechados._internal();
    }
    return _instancia;
  }

  List<Forms> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Forms byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Forms forms) {
    if (forms == null) {
      return;
    }

    if (forms.id != null &&
        forms.id.trim().isNotEmpty &&
        _items.containsKey(forms.id)) {
      _items.update(forms.id, (_) => forms);
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => Forms(
              id: id,
              estado: "f",
              titulo: forms.titulo,
              descricao: forms.descricao,
              morada: forms.morada,
              avatarUrl: forms.avatarUrl));
    }
    notifyListeners();
  }

  criarFechado(Forms formulario) {
    _items.putIfAbsent(
        formulario.id,
        () => Forms(
            id: formulario.id,
            estado: "f",
            titulo: formulario.titulo,
            descricao: formulario.descricao,
            morada: formulario.morada,
            avatarUrl: formulario.avatarUrl));
    notifyListeners();
  }
}
