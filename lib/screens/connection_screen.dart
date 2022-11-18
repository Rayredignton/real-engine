import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test/models/connection_response.dart';
import 'package:test/screens/presets.dart';
import 'package:test/widgets/buttons.dart';
import 'package:test/widgets/spacings.dart';
import 'package:test/widgets/textfield.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import '../provider/connection_provider.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {


  final textController = TextEditingController(text: "ws://127.0.0.1:30020");
  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionProvider>(builder: (context, model, child) {
      return Scaffold(
          backgroundColor: Colors.black26,
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            children: [
              const YMargin(300),
              Center(
                child: Field(
                  controller: textController,
                ),
              ),
              const YMargin(30),
              TestButton(
                title: "Connect",
                onTap: () {
           
          
                  model.setUrl(textController.text);
                  model.startStream();
                             HapticFeedback.heavyImpact();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PresetsScreen()));
                },
              ),

              YMargin(40),


            ],
          ));
    });
  }
}
