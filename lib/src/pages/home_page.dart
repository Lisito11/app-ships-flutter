import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ships/src/providers/ship_provider.dart';
import 'package:ships/src/providers/switch_provider.dart';
import 'package:ships/src/search/search_delegate.dart';
import 'package:ships/src/widgets/list_ship_widget.dart';
import 'package:ships/src/widgets/switch_widget.dart';


class HomePage extends StatelessWidget {
  final shipsProvider = new ShipProvider();
  @override
  Widget build(BuildContext context) {
    print(shipsProvider.getNaves());
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Naves"),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      body:ChangeNotifierProvider(
        create: (_) => new SwitchProvider(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Ocultar Naves Inactivas"),
                SwitchShip()
              ],
            ),
            Expanded(
                child: ships()
            ),
          ],
        ),
      ),
    );
  }
  Widget ships(){
    return FutureBuilder(
      future: shipsProvider.getNaves(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if ( snapshot.hasData ) {
          return ListviewShip(itemsNaves: snapshot.data);
        } else {
          return Container(
              height: 400.0,
              child: Center(
                  child: CircularProgressIndicator()
              )
          );
        }
      },
    );
  }



}
class NavegacionModel with ChangeNotifier{
  bool _isHold = false;

  bool get isHold =>  this._isHold;

  set isHold (bool valor){
    this._isHold = valor;
    notifyListeners();
  }
}