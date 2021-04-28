import 'package:projeto_mobile/Model/Ingredientes.dart';

class Receita {
  List<Ingrediente> ingredientes;
  List<int> quantidadeUtilizada;
  String modoDePreparo;
  int tempoDePreparoMinutosTotal;

  Receita(this.ingredientes, this.quantidadeUtilizada, this.modoDePreparo) {
    for (Ingrediente ingrediente in this.ingredientes) {
      this.tempoDePreparoMinutosTotal += ingrediente.tempoDePreparoMinutos;
    }
  }
}
