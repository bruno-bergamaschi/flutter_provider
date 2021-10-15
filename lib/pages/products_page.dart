import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exemple/providers/product_provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, ProductsProvider produto, child) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: produto.products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Produto: ${produto.products[index].name}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Fabricante: ${produto.products[index].manufacturer}'),
                  Text('Quantidade: ${produto.products[index].amount}')
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  Provider.of<ProductsProvider>(context, listen: false)
                      .removeProduct(produto.products[index]);
                },
                icon: const Icon(Icons.delete),
              ),
            );
          },
        );
      },
    );
  }
}
