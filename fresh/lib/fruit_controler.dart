import 'model/datamodel.dart';

class FruitControler {
  static final FruitControler _singleton = FruitControler._internal();
  int BacketCount=0;
  List<FritCatigoodel> selectedFruit=[];
  factory FruitControler() {
    return _singleton;
  }

  FruitControler._internal();
}