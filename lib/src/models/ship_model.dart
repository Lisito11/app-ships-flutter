class Ship{
  String shipName;
  String shipId;
  bool active;

  Ship({this.shipName, this.active,this.shipId});

  factory Ship.fromJson(Map<dynamic, dynamic> parsedJson){
    return Ship(
        shipName: parsedJson['ship_name'],
        shipId: parsedJson['ship_id'],
        active : parsedJson['active'],
    );
  }
}

class ShipList {
  final List<Ship> naves;
  ShipList({this.naves});

  factory ShipList.fromJson(List<dynamic> parsedJson) {
    List<Ship> naves = <Ship>[];
    naves = parsedJson.map((i) => Ship.fromJson(i)).toList();
    return new ShipList(
      naves: naves,
    );
  }
}