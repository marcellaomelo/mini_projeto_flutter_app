import 'package:flutter/material.dart';
import 'package:mini_projeto_flutter_app/provider/form_views.dart';
import 'package:mini_projeto_flutter_app/provider/forms_view_fechados.dart';
import 'package:mini_projeto_flutter_app/routes/app_routes.dart';
import 'package:mini_projeto_flutter_app/views/detailScreen.dart';
import 'package:mini_projeto_flutter_app/views/id-form.dart';
import 'package:mini_projeto_flutter_app/views/lista_incidentes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => FormViews(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => FormViewsFechados.getInstancia(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            AppRoutes.HOME: (_) => ListaIncidentes(),
            AppRoutes.Details: (_) => DetailScreen(),
            AppRoutes.ID_FORM: (_) => IdForm()
          }),
    );
  }
}
