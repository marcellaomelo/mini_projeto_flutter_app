import 'package:flutter/material.dart';
import 'package:mini_projeto_flutter_app/models/forms.dart';

class DetailScreen extends StatefulWidget {
  Map<String, dynamic> value;

  DetailScreen({Key key, @required this.value}) : super(key: key);

  @override
  _detailScreen createState() => _detailScreen(value);
}

class _detailScreen extends State<DetailScreen> {
  Map<String, dynamic> value;

  _detailScreen(this.value);
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
        title: Text("Details"),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          key: _form,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Título:"),
                Text(
                  _formData['titulo'],
                  style: TextStyle(color: Colors.black54),
                ),
                Text("Descrição:"),
                Text(
                  _formData['descricao'],
                ),
                Text("Morada:"),
                Text(_formData['morada']),
                Text(_formData['avatarUrl']),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
