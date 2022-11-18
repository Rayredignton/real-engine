
import 'package:provider/provider.dart';

import 'connection_provider.dart';




var providers = [
  ChangeNotifierProvider<ConnectionProvider>(create: (_) => ConnectionProvider()),

 
];