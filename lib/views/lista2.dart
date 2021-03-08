import 'package:flutter/material.dart';
import 'package:mini_projeto_flutter_app/components/forms_tile.dart';
import 'package:mini_projeto_flutter_app/components/forms_tile_fechados.dart';
import 'package:mini_projeto_flutter_app/models/forms.dart';
import 'package:mini_projeto_flutter_app/provider/form_views.dart';
import 'package:mini_projeto_flutter_app/provider/forms_view_fechados.dart';
import 'package:mini_projeto_flutter_app/routes/app_routes.dart';
import 'package:provider/provider.dart';

class Lista2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FormViewsFechados ids = Provider.of(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: ids.count,
        itemBuilder: (ctx, i) => FormsTileFechados(ids.byIndex(i)),
      ),
    );
  }
}
