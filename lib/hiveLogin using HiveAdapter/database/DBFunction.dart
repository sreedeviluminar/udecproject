import 'package:hive/hive.dart';

import '../model/user_model.dart';

class DataBasee{

  DataBasee._internal();

  static DataBasee instance  = DataBasee._internal();

  factory DataBasee(){  // factory constructor for creating singleton class
    return instance;    // these class have only one instance
  }
  Future<void> userSignUp(User user) async{
     final db = await Hive.openBox<User>('user');
     db.put(user.id, user);
  }

}