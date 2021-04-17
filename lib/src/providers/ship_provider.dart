import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ships/src/models/ship_model.dart';

class ShipProvider{


  Future<List<Ship>> getNaves() async {
    final resp = await http.get(Uri.https("api.spacexdata.com","/v3/ships"));
    final decodedData = json.decode(resp.body);
    final navesList = new ShipList.fromJson(decodedData);
    return navesList.naves;
  }

  Future<List<Ship>> buscarNave( String query ) async {

    final url = Uri.https("api.spacexdata.com", '/v3/ships', {'query': query});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final navesList = new ShipList.fromJson(decodedData);
    return navesList.naves;

  }
}



