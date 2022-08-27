import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/data/model/produto_model.dart';

class ProdutoWidget extends StatelessWidget {
  const ProdutoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Text(
        context.read<ProdutoModel>().name,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
