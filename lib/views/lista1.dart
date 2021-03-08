import 'package:flutter/material.dart';
import 'package:mini_projeto_flutter_app/components/forms_tile.dart';
import 'package:mini_projeto_flutter_app/models/forms.dart';
import 'package:mini_projeto_flutter_app/provider/form_views.dart';
import 'package:mini_projeto_flutter_app/provider/forms_view_fechados.dart';
import 'package:mini_projeto_flutter_app/routes/app_routes.dart';
import 'package:provider/provider.dart';

class Lista1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FormViews ids = Provider.of(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: ids.count,
        itemBuilder: (ctx, i) => FormsTile(ids.byIndex(i)),
      ),
    );
  }
}
