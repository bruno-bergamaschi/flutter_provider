import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exemple/models/product_model.dart';
import 'package:provider_exemple/providers/product_provider.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  String name = '';

  String manufacturer = '';

  String code = '';

  String amount = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
                onChanged: (value) => name = value,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Fabricante'),
                ),
                onChanged: (value) => manufacturer = value,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Código'),
                ),
                onChanged: (value) => code = value,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Quantidade'),
                ),
                onChanged: (value) => amount = value,
              ),
              ElevatedButton(
                  onPressed: () {
                    final product = ProductModel(
                        name: name,
                        manufacturer: manufacturer,
                        code: code,
                        amount: amount);

                    // ProductsProvider().addProduct(product);
                    Provider.of<ProductsProvider>(context, listen: false)
                        .addProduct(product);
                  },
                  child: const Text('Cadastrar'))
            ],
          ),
        )
      ],
    );
  }
}
