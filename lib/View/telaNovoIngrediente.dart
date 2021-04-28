import 'package:flutter/material.dart';
import 'package:projeto_mobile/Model/Ingredientes.dart';

import '../Dados.dart';

class TelaNovoIngrediente extends StatefulWidget {
  @override
  _TelaNovoIngredienteState createState() => _TelaNovoIngredienteState();
}

class _TelaNovoIngredienteState extends State<TelaNovoIngrediente> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  int id;
  String nome;
  int tempoDePreparoMinutos;
  double pesoEmGramas;
  int aux = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              validator: (String input) {
                if (input.length == 0) return "Nome do Ingrediente!";
                return null;
              },
              onSaved: (String input) {
                // setState(() {
                this.nome = input;
                // });
              },
              decoration: InputDecoration(labelText: "Nome"),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (String input) {
                if (input.length == 0) return "Peso!";
                return null;
              },
              onSaved: (String input) {
                // setState(() {
                this.pesoEmGramas = double.parse(input);
                // });
              },
              decoration: InputDecoration(labelText: "Peso (g)"),
            ),
            Slider(
              min: 1.0,
              max: 60.0,
              divisions: 60,
              value: this.aux.toDouble(),
              onChanged: (double input) {
                setState(() {
                  this.aux = input.toInt();
                });
              },
              onChangeEnd: (double input) {
                this.tempoDePreparoMinutos = input.toInt();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green[800])),
              onPressed: () {
                this.formKey.currentState.save();
                this.id = Dados.ingredientesRegistrados.length + 1;
                Ingrediente i = new Ingrediente(
                    id: this.id,
                    nome: this.nome,
                    pesoEmGramas: this.pesoEmGramas,
                    tempoDePreparoMinutos: this.tempoDePreparoMinutos);
                Dados.ingredientesRegistrados.add(i);
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
