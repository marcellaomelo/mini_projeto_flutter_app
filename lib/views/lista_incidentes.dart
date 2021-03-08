import 'package:flutter/material.dart';
import 'package:mini_projeto_flutter_app/components/forms_tile.dart';
import 'package:mini_projeto_flutter_app/models/forms.dart';
import 'package:mini_projeto_flutter_app/provider/form_views.dart';
import 'package:mini_projeto_flutter_app/routes/app_routes.dart';
import 'package:mini_projeto_flutter_app/views/lista1.dart';
import 'package:mini_projeto_flutter_app/views/lista2.dart';

import 'package:provider/provider.dart';

class ListaIncidentes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FormViews ids = Provider.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.ID_FORM);
              },
            ),
          ],
          title: Text('iQueLimpeza'),
          bottom: TabBar(
            unselectedLabelColor: Colors.black54,
            indicatorWeight: 5.0,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.whatshot_sharp),
                text: 'Lista de Incidentes',
              ),
              Tab(
                  icon: Icon(Icons.close_outlined),
                  text: 'Incidentes Fechados'),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[Lista1(), Lista2()]),
      ),
    );
  }
}
