import 'package:flutter/material.dart';
import 'package:ships/src/models/ship_model.dart';


class ListviewShipSearch  extends StatefulWidget {
  final List<Ship> itemsNaves;
  bool isSwitched;
  ListviewShipSearch({ @required this.itemsNaves, this.isSwitched });
  @override
  _ListviewShipSearchState createState() => _ListviewShipSearchState();
}

class _ListviewShipSearchState extends State<ListviewShipSearch> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemsNaves.length,
      itemBuilder: (context, index) {
        return ListTile(
            leading: Icon(Icons.airplanemode_on),
            title: Text(widget.itemsNaves[index].shipName),
            subtitle: Text(widget.itemsNaves[index].shipId),
          );
      },
    );
  }
}