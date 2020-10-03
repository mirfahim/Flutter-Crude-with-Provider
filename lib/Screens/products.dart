import 'package:four_practice/Screens/editproducts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/productmodel.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<List<Product>>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProduct()));
              },
            )
          ],
        ),
        body: (products != null)
            ? ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(products[index].name),
                    trailing: Text(products[index].price.toString()),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditProduct(products[index])));
                    },
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}