import 'package:production/models/my_user_model.dart';
import 'package:production/models/other_user_model.dart';

class MatchingCalculator {
  double calculateTotalPoint(OtherUserModel otherUser, MyUserModel myUser) {
    double points = 50; // ハッカソンに参加している時点でベースとして50点加算

    // `askExperience`, `askJob`, `askIsStudent` が一致する場合、それぞれ 10 点
    if (otherUser.askExperience == myUser.profileExperience) points += 10;
    if (otherUser.askJob == myUser.profileJob) points += 10;
    if (otherUser.askIsStudent == myUser.profileIsStudent) points += 10;

    // `askExperience`, `askJob`, `askIsStudent` が逆条件で一致する場合、それぞれ 10 点
    if (myUser.askExperience == otherUser.profileExperience) points += 10;
    if (myUser.askJob == otherUser.profileJob) points += 10;
    if (myUser.askIsStudent == otherUser.profileIsStudent) points += 10;

    // `profileFavPackage` が一致する場合、プラス 30 点
    if (otherUser.profileFavPackage == myUser.profileFavPackage) {
      points += 30;
    }

    // `profileHobbies` において一致するものがある場合、1つにつきプラス 5 点
    for (var hobby in otherUser.profileHobbies) {
      if (myUser.profileHobbies.contains(hobby)) {
        points += 5;
      }
    }

    // チーム名が一致する場合、ポイントを -20
    if (otherUser.teamName == myUser.teamName) {
      points -= 20;
    }

    return points;
  }
}
