import 'package:flutter/material.dart';
import 'package:projeto_mobile/Model/Ingredientes.dart';
import '../Dados.dart';
import 'telaNovoIngrediente.dart';

class TelaSelecionarIngrediente extends StatefulWidget {
  @override
  _TelaSelecionarIngredienteState createState() =>
      _TelaSelecionarIngredienteState();
}

class _TelaSelecionarIngredienteState extends State<TelaSelecionarIngrediente> {
  List<Ingrediente> ingredientes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    ingredientes.addAll(Dados.ingredientesRegistrados);
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Ingredientes"), botaoAdicionarIngrediente()]),
        backgroundColor: Colors.lime[800],
      ),
      body: Container(
        color: Colors.lime,
        child: ListView.builder(
          itemCount: ingredientes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(ingredientes.elementAt(index).nome),
              subtitle: Text(
                  "${ingredientes.elementAt(index).pesoEmGramas}g - ${ingredientes.elementAt(index).tempoDePreparoMinutos}min"),
            );
          },
        ),
      ),
    );
  }

  Widget botaoAdicionarIngrediente() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green[800])),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Novo Ingrediente",
            home: Scaffold(
              body: TelaNovoIngrediente(),
            ),
          );
        }));
      },
      child: Icon(Icons.add),
    );
  }
}
