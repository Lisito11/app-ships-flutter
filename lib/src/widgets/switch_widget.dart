import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ships/src/pages/home_page.dart';
import 'package:ships/src/providers/switch_provider.dart';

class SwitchShip extends StatefulWidget {
  @override
  _SwitchShipState createState() => _SwitchShipState();
  bool isSwitched = false;
}

class _SwitchShipState extends State<SwitchShip> {


  @override
  Widget build(BuildContext context) {
    final switchProvider = Provider.of<SwitchProvider>(context);

    return Switch(
      value: widget.isSwitched,
      onChanged: (value) {
        setState(() {
          widget.isSwitched = value;
          switchProvider.isSwitched = widget.isSwitched;
        });
      },
      activeTrackColor: Colors.lightBlueAccent,
      activeColor: Colors.blue,
    );
  }
}
