import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:test/widgets/spacings.dart';

import '../models/connection_response.dart';
import '../provider/connection_provider.dart';
import '../widgets/buttons.dart';
import '../widgets/mediaquery.dart';

class PresetsScreen extends StatefulWidget {
  const PresetsScreen({Key? key}) : super(key: key);

  @override
  State<PresetsScreen> createState() => _PresetsScreenState();
}

class _PresetsScreenState extends State<PresetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionProvider>(builder: (context, model, child) {
      return Scaffold(
        body: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                YMargin(50),
                TestButton(
                  title: "Refresh",
                  onTap: () {
                    model.setUrl("ws://127.0.0.1:30020/remote/presets");
                  },
                ),
                YMargin(150),
                PresetStream(stream: model.presetStream)
              ],
            )),
            Expanded(
                child: Column(
              children: [],
            )),
          ],
        ),
      );
    });
  }
}

class PresetStream extends StatefulWidget {
  final Stream<ConnectionResponse> stream;

  const PresetStream({
    required this.stream,
    Key? key,
  }) : super(key: key);

  @override
  State<PresetStream> createState() => _PresetStreamState();
}

class _PresetStreamState extends State<PresetStream> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionProvider>(builder: (context, model, child) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: StreamBuilder<ConnectionResponse>(
          stream: widget.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.active &&
                snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.presets!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        model.registerPreset(name: snapshot.data!.presets![index].toString());
                        if (tapped ==true)
                          model.unregisterPreset(name: snapshot.data!.presets![index].toString());
                        
                      },
                      child: Container(
                        height: 50,
                        width: width(context),
                        color: tapped ? Colors.grey : Colors.transparent,
                        child: Center(
                          child: Text(
                            '${snapshot.data!.presets![index]}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return const Center(
                child: Text('No more data'),
              );
            }

            return const Center(
              child: Text('No data'),
            );
          },
        ),
      );
    });
  }
}
