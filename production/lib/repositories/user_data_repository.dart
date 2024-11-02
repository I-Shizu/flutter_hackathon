import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:production/models/my_user_model.dart';

class UserDataRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //viewModelのriverpodから送られてきた情報をfirestoreに保存する
  Future<void> sendMyData({required MyUserModel myUserData}) async {
    await _firestore
        .collection('users')
        .doc(myUserData.userId)
        .set(myUserData.toJson());
  }
}
