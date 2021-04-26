import 'package:api_crud/add_item.dart';
import 'package:api_crud/datamodels/get_product_response.dart';
import 'package:api_crud/viewmodels/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProductViewmodel>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder(
            future: model.getProducts(),
            builder: (context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (snapshot.hasData) {
                  return RefreshIndicator(
                    onRefresh: () => model.refreshScreen(),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (ctx, i) => ListTile(
                              title: Text(snapshot.data[i].name),
                              subtitle:
                                  Text(snapshot.data[i].active.toString()),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddItems(
                                            edit: true,
                                            name: snapshot.data[i].name,
                                            isActive: snapshot.data[i].active,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      model.deleteProduct(snapshot.data[i].id);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddItems()));
                                },
                                child: Text("Add Product"),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }
            },
          )),
    );
  }
}
