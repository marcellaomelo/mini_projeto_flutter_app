import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mini_projeto_flutter_app/models/forms.dart';
import 'package:mini_projeto_flutter_app/provider/form_views.dart';
import 'package:mini_projeto_flutter_app/provider/forms_view_fechados.dart';
import 'package:mini_projeto_flutter_app/routes/app_routes.dart';
import 'package:mini_projeto_flutter_app/views/detailScreen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class FormsTile extends StatefulWidget {
  final Forms formulario;
  const FormsTile(this.formulario);
  @override
  _FormsTileState createState() => _FormsTileState();
  // const FormsTile(this.formulario);
}

class _FormsTileState extends State<FormsTile> {
  final f = FormViewsFechados.getInstancia();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    final avatar = widget.formulario.avatarUrl == null ||
            widget.formulario.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(widget.formulario.avatarUrl));
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actions: <Widget>[
          IconSlideAction(
            caption: 'Fechar',
            color: Colors.blue,
            icon: Icons.archive,
            onTap: () => {
              f.criarFechado(widget.formulario),
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Incidente fechado'),
                  content: Text('O seu incidente foi dado como fechado.'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Provider.of<FormViews>(context, listen: false)
                            .remove(widget.formulario);
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'),
                    ),
                  ],
                ),
              )
            },
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Resolvido',
            color: Colors.indigo,
            icon: Icons.where_to_vote_rounded,
            onTap: () => print('Resolvido'),
          ),
          IconSlideAction(
            caption: 'Edit',
            icon: Icons.edit,
            color: Colors.blueGrey,
            onTap: () => {
              Navigator.of(context).pushNamed(
                AppRoutes.ID_FORM,
                arguments: widget.formulario,
              ),
            },
          ),
          IconSlideAction(
            icon: Icons.delete,
            color: Colors.redAccent,
            onTap: () => {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir Formulário'),
                  content: Text(
                      'O incidente selecionado foi eliminado com sucesso.'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Provider.of<FormViews>(context, listen: false)
                            .remove(widget.formulario);
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'),
                    ),
                  ],
                ),
              )
            },
            caption: 'Delete',
          ),
        ],
        child: Container(
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                leading: CircleAvatar(child: avatar, radius: 28),
                title: Text(widget.formulario.titulo,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                    'Data: ${now.day}/${now.month}/${now.year} - ${now.hour}:${now.minute}'),
                trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.info_outline),
                          color: Colors.blueGrey,
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.Details,
                              arguments: widget.formulario,
                            );
                          },
                        ),
                        IconButton(icon: Icon(Icons.arrow_forward_ios_rounded)),
                        /*IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.redAccent,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text('Excluir Formulário'),
                                content: Text(
                                    'O incidente selecionado foi eliminado com sucesso.'),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      Provider.of<FormViews>(context,
                                              listen: false)
                                          .remove(widget.formulario);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Ok'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),*/
                      ],
                    )))));
  }
}
