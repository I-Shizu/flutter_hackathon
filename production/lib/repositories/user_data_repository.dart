import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:production/models/my_user_model.dart';
import 'package:production/models/other_user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class UserDataRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firestoreにユーザーデータを保存
  Future<void> sendMyData({required MyUserModel myUserData}) async {
    await _firestore
        .collection('users')
        .doc(myUserData.userId)
        .set(myUserData.toJson());
  }

  // Firestoreからユーザーリストをリアルタイムで取得
  Stream<List<OtherUserModel>> fetchUsersStream() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return OtherUserModel.fromJson(data);
      }).toList();
    });
  }
}

final userDataRepositoryProvider = Provider<UserDataRepository>((ref) {
  return UserDataRepository();
});
