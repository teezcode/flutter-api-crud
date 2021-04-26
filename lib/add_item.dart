import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/product_viewmodel.dart';

class AddItems extends StatefulWidget {
  final bool edit;
  final String name;
  final bool isActive;

  const AddItems({Key key, this.edit = false, this.name, this.isActive}) : super(key: key);
  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {

  final controller = TextEditingController();
  bool _isActive;

  @override
  void initState() {
    super.initState();
    controller.text = widget.name ?? null;
    _isActive = widget.isActive ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductViewmodel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.edit ? "Edit Products" : "Add Products"),
        ),
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: ('Name'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Is Active:',style: TextStyle(fontSize: 20),),
                      Switch(
                          value: _isActive,
                          onChanged: (bool newValue){
                        setState(() {
                          _isActive = newValue;
                        });
                      }),
                    ],
                  ),

                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    if(controller.text.isEmpty) return;

                    if(widget.edit){
                      provider.editProduct(name: 'name',id: 'id',val: _isActive);
                    } else{
                      provider.addProduct(name: controller.text, val: _isActive);
                    }

                  }, child: Text(widget.edit ?'Edit' : "Add"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
