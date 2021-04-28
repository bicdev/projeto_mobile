import 'package:flutter/material.dart';
import 'View/telaAjudante.dart';
import 'View/telaPlanejador.dart';
import 'View/telaSelecionarIngrediente.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _tab = 0;
  List<Widget> _telas = <Widget>[
    TelaSelecionarIngrediente(),
    TelaPlanejador(),
    TelaAjudante(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _telas.elementAt(_tab),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lime[800],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Ingredientes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Planejador',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Ajudante',
            ),
          ],
          currentIndex: _tab,
          selectedItemColor: Colors.green[800],
          onTap: (int index) {
            setState(() {
              _tab = index;
            });
          }),
    );
  }
}
