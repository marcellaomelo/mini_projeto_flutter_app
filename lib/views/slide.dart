import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;

  const SlidableWidget({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Slidable(actionPane: SlidableDrawerActionPane(), child: child,

          ///left side
          actions: <Widget>[
            IconSlideAction(
              caption: 'Fechado',
              color: Colors.green,
              icon: Icons.archive,
              onTap: () {},
            ),
          ]);
}
