import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_projeto_flutter_app/provider/form_views.dart';
import 'package:provider/provider.dart';
import 'package:mini_projeto_flutter_app/models/forms.dart';

class IdForm extends StatefulWidget {
  @override
  _IdFormState createState() => _IdFormState();
}

class _IdFormState extends State<IdForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Forms forms) {
    if (forms != null) {
      _formData['id'] = forms.id;
      _formData['titulo'] = forms.titulo;
      _formData['descricao'] = forms.descricao;
      _formData['morada'] = forms.morada;
      _formData['avatarUrl'] = forms.avatarUrl;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Forms forms = ModalRoute.of(context).settings.arguments;
    _loadFormData(forms);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Novo Formulário'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState.validate();
                if (isValid) {
                  _form.currentState.save();
                  Provider.of<FormViews>(context, listen: false).put(
                    Forms(
                      id: _formData['id'],
                      titulo: _formData['titulo'],
                      descricao: _formData['descricao'],
                      morada: _formData['morada'],
                      avatarUrl: _formData['avatarUrl'],
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
                key: _form,
                child: Column(children: <Widget>[
                  TextFormField(
                    initialValue: _formData['titulo'],
                    decoration: InputDecoration(labelText: 'Título *'),
                    // ignore: missing_return
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe o título';
                      }
                      if (value.trim().length > 25) {
                        return 'Título muito grande';
                      }
                    },
                    onSaved: (value) => _formData['titulo'] = value,
                  ),
                  TextFormField(
                    initialValue: _formData['descricao'],
                    decoration: InputDecoration(labelText: 'Descrição *'),
                    // ignore: missing_return
                    validator: (value) {
                      // ignore: missing_return
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe uma descrição';
                      }
                      if (value.length > 20) {
                        return 'Descrição muito grande';
                      }
                      if (value.length < 10) {
                        return 'Descrição muito pequeno';
                      }
                    },
                    onSaved: (value) => _formData['descricao'] = value,
                  ),
                  TextFormField(
                    initialValue: _formData['morada'],
                    decoration: InputDecoration(labelText: 'Morada'),
                    // ignore: missing_return
                    validator: (value) {
                      // ignore: missing_return
                      if (value != null &&
                          value.trim().isNotEmpty &&
                          value.trim().length < 6) {
                        return 'Morada muito pequena';
                      }
                    },
                    onSaved: (value) => _formData['morada'] = value,
                  ),
                  TextFormField(
                    initialValue: _formData['avatarUrl'],
                    decoration: InputDecoration(labelText: 'URL do Avatar'),
                    onSaved: (value) => _formData['avatarUrl'] = value,
                  ),
                ]))));
  }
}
