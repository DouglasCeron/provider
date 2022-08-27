import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HomePage'),
      ),
      body: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/provider');
                      },
                      child: Text(' Provider')),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/change_notifier');
                    },
                    child: Text('ChangeNotifier'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
