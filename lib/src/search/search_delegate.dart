import 'package:flutter/material.dart';
import 'package:ships/src/models/ship_model.dart';
import 'package:ships/src/providers/ship_provider.dart';
import 'package:ships/src/widgets/list_ship_search_widget.dart';

class DataSearch extends SearchDelegate{
  final shipsProvider = new ShipProvider();
  List<Ship> listShips = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon( Icons.clear ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close( context, null );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
      var listaSugerida;
      if ( query.isEmpty ) {
          return Container();
      }
       return FutureBuilder(
         future: shipsProvider.getNaves(),
         builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
           if ( snapshot.hasData ) {
             listShips = snapshot.data;
             listaSugerida = listShips.where((p)=> p.shipName.toLowerCase().startsWith(query.toLowerCase())).toList();
             return ListviewShipSearch(itemsNaves: listaSugerida);
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