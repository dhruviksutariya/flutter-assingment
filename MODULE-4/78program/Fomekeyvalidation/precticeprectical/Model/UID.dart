import 'package:uuid/uuid.dart';

import '';
class JPUti{
  static String getUniqueid() {
    var uid = Uuid();
    return uid.v4();
  }
}