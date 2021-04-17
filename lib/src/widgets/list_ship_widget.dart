import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ships/src/models/ship_model.dart';
import 'package:ships/src/pages/home_page.dart';
import 'package:ships/src/providers/switch_provider.dart';


class ListviewShip  extends StatefulWidget {
  final List<Ship> itemsNaves;
  ListviewShip({ @required this.itemsNaves});
  @override
  _ListviewShipState createState() => _ListviewShipState();
}

class _ListviewShipState extends State<ListviewShip> {
  @override
  Widget build(BuildContext context) {
    final switchProvider = Provider.of<SwitchProvider>(context);

    return ListView.builder(
      itemCount: widget.itemsNaves.length,
      itemBuilder: (context, index) {
        return Visibility(
          visible: (switchProvider.isSwitched && widget.itemsNaves[index].active == false)? false: true,
          child:  ListTile(
            leading: Icon(Icons.airplanemode_on),
            title: Text(widget.itemsNaves[index].shipName),
            subtitle: Text(widget.itemsNaves[index].shipId),
            trailing: Checkbox(
              value: widget.itemsNaves[index].active,
              onChanged: (value) {
                setState(() {
                  widget.itemsNaves[index].active = !widget.itemsNaves[index].active;
                });
              },
            ),
          ),
        );
      },
    );
  }
}