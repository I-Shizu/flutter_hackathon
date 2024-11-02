import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:production/feature/matching_user_list/my_user_provider.dart';
import 'package:production/models/other_user_model.dart';
import 'package:production/repositories/user_data_repository.dart';
import 'package:production/services/matching_calculator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'matching_user_list_view_model.g.dart';

@riverpod
class MatchingUserListViewModel extends _$MatchingUserListViewModel {
  @override
  Stream<List<OtherUserModel>> build() {
    final myUser = ref.watch(myUserProvider); // MyUserModelのインスタンスを取得
    final userRepository =
        ref.watch(userDataRepositoryProvider); // UserDataRepositoryを取得
    final calculator = MatchingCalculator();

    // fetchUsersStreamをリアルタイムで取得
    return userRepository.fetchUsersStream().map((users) {
      final usersWithTotalPoint = users.map((user) {
        // MatchingCalculator を利用して totalpoint を計算
        final totalPoint = calculator.calculateTotalPoint(user, myUser);
        return user.copyWith(totalpoint: totalPoint);
      }).toList();

      // totalpointで降順に並べる
      usersWithTotalPoint
          .sort((a, b) => b.totalpoint!.compareTo(a.totalpoint!));

      return usersWithTotalPoint;
    });
  }
}
