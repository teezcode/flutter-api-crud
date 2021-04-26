import 'package:api_crud/viewmodels/product_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List providers = <SingleChildWidget>[
    ListenableProvider(create: (_) => ProductViewmodel()),
  ];
}