import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class UssdPage extends StatefulWidget {
  const UssdPage({Key? key}) : super(key: key);

  @override
  _UssdPageState createState() => _UssdPageState();
}

class _UssdPageState extends State<UssdPage> {
  late TextEditingController _controller;
  String? _response;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ussd Plugin example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          // text input
          TextField(
            controller: _controller,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'Ussd code'),
          ),

          // dispaly responce if any
          if (_response != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(_response!),
            ),

          // buttons
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  UssdAdvanced.sendUssd(
                      code: _controller.text, subscriptionId: 1);
                },
                child: const Text('norma request'),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? _res = await UssdAdvanced.sendAdvancedUssd(
                      code: _controller.text, subscriptionId: 1);
                  setState(() {
                    _response = _res;
                  });
                },
                child: const Text('advanced request'),
              ),
            ],
          )
        ],
      ),
    );
  }
}