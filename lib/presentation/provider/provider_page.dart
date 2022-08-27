import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/data/model/produto_model.dart';
import 'package:provider_example/data/model/user_model.dart';
import 'package:provider_example/widgets/produto_widget.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);

    // .read retorna uma instancia sem ficar escutando alterações
    //var user2 = context.read<UserModel>();

    //var user3 = context.watch<UserModel>();

    //É possivel trazer somente um valor especifico
    // var imageAvatar = context.select<UserModel, String>(
    //   (usermodel) => usermodel.imgAvatar,
    // );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    user.imgAvatar,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(user.birthDate),
                ],
              ),
              Provider(
                create: (context) => ProdutoModel(name: 'Dart&Flutter'),
                child: const ProdutoWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
