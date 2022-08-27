import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'change_notifier_controller.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await Future.delayed(const Duration(seconds: 1));
        context.read<ChangeNotifierController>().alterarDados();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Change NotifierPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<ChangeNotifierController, String>(
                selector: (_, controller) {
                  return controller.imgAvatar;
                },
                builder: (_, imgAvatar, __) {
                  return Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(250),
                        child: Image.network(
                          imgAvatar,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Selector<ChangeNotifierController, String>(
                    selector: (_, controller) {
                      return controller.name;
                    },
                    builder: (_, name, __) {
                      return Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                  Selector<ChangeNotifierController, String>(
                    selector: (_, controller) {
                      return controller.birthDate;
                    },
                    builder: (_, birthDate, __) {
                      return Text(birthDate);
                    },
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () =>
                    context.read<ChangeNotifierController>().alterarNome(),
                child: const Text('Alterar Nome'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
