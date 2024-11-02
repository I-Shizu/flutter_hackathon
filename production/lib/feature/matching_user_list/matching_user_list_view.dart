import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:production/feature/profile/profile_view.dart';
import 'package:production/models/other_user_model.dart';
import 'package:production/models/my_user_model.dart';
import 'matching_user_list_view_model.dart';
import 'package:production/feature/matching_user_list/my_user_provider.dart';

class MatchingUserListView extends ConsumerStatefulWidget {
  @override
  _MatchingUserListViewState createState() => _MatchingUserListViewState();
}

class _MatchingUserListViewState extends ConsumerState<MatchingUserListView> {
  String? selectedExperience;
  String? selectedJob;
  bool? selectedIsStudent;
  String? selectedFavPackage;
  String? selectedPersonFeat;
  List<String> selectedHobbies = [];

  @override
  Widget build(BuildContext context) {
    final usersAsyncValue = ref.watch(matchingUserListViewModelProvider);
    final myUser = ref.watch(myUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('ホットな参加メンバー'),
      ),
      body: usersAsyncValue.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (users) {
          final experienceOptions =
              users.map((u) => u.profileExperience).toSet().toList();
          final jobOptions = users.map((u) => u.profileJob).toSet().toList();
          final favPackageOptions =
              users.map((u) => u.profileFavPackage).toSet().toList();
          final hobbiesOptions =
              users.expand((u) => u.profileHobbies).toSet().toList();
          final personFeatOptions =
              users.map((u) => u.profilePersonFeat).toSet().toList();

          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Wrap(
                        spacing: 8,
                        children: experienceOptions.map((experience) {
                          return ChoiceChip(
                            label: Text(experience),
                            selected: selectedExperience == experience,
                            onSelected: (isSelected) {
                              setState(() {
                                selectedExperience =
                                    isSelected ? experience : null;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 8),
                      Wrap(
                        spacing: 8,
                        children: jobOptions.map((job) {
                          return ChoiceChip(
                            label: Text(job),
                            selected: selectedJob == job,
                            onSelected: (isSelected) {
                              setState(() {
                                selectedJob = isSelected ? job : null;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 8),
                      ChoiceChip(
                        label: Text(selectedIsStudent == true ? '学生' : '非学生'),
                        selected: selectedIsStudent != null,
                        onSelected: (isSelected) {
                          setState(() {
                            selectedIsStudent =
                                isSelected ? !selectedIsStudent! : null;
                          });
                        },
                      ),
                      SizedBox(width: 8),
                      Wrap(
                        spacing: 8,
                        children: favPackageOptions.map((package) {
                          return ChoiceChip(
                            label: Text(package),
                            selected: selectedFavPackage == package,
                            onSelected: (isSelected) {
                              setState(() {
                                selectedFavPackage =
                                    isSelected ? package : null;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 8),
                      Wrap(
                        spacing: 8,
                        children: hobbiesOptions.map((hobby) {
                          return ChoiceChip(
                            label: Text(hobby),
                            selected: selectedHobbies.contains(hobby),
                            onSelected: (isSelected) {
                              setState(() {
                                if (isSelected) {
                                  selectedHobbies.add(hobby);
                                } else {
                                  selectedHobbies.remove(hobby);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 8),
                      Wrap(
                        spacing: 8,
                        children: personFeatOptions.map((feat) {
                          return ChoiceChip(
                            label: Text(feat),
                            selected: selectedPersonFeat == feat,
                            onSelected: (isSelected) {
                              setState(() {
                                selectedPersonFeat = isSelected ? feat : null;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: _buildFilteredUserGrid(users, myUser),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilteredUserGrid(
      List<OtherUserModel> users, MyUserModel myUser) {
    final sortedUsers = List<OtherUserModel>.from(users)
      ..sort((a, b) => (b.totalpoint ?? 0).compareTo(a.totalpoint ?? 0));

    final filteredUsers = sortedUsers.where((user) {
      final matchesExperience = selectedExperience == null ||
          user.profileExperience == selectedExperience;
      final matchesJob = selectedJob == null || user.profileJob == selectedJob;
      final matchesIsStudent = selectedIsStudent == null ||
          user.profileIsStudent == selectedIsStudent;
      final matchesFavPackage = selectedFavPackage == null ||
          user.profileFavPackage == selectedFavPackage;
      final matchesPersonFeat = selectedPersonFeat == null ||
          user.profilePersonFeat == selectedPersonFeat;
      final matchesHobbies = selectedHobbies.isEmpty ||
          selectedHobbies.every((hobby) => user.profileHobbies.contains(hobby));
      return matchesExperience &&
          matchesJob &&
          matchesIsStudent &&
          matchesFavPackage &&
          matchesPersonFeat &&
          matchesHobbies;
    }).toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        childAspectRatio: 0.8,
      ),
      itemCount: filteredUsers.length,
      itemBuilder: (context, index) {
        final user = filteredUsers[index];
        final iconNumber = (user.icon % 5) + 1;
        final iconPath = 'assets/images/icon$iconNumber.png';

        final commonHobbies = myUser.profileHobbies
            .where((hobby) => user.profileHobbies.contains(hobby))
            .toList();
        final commonFavPackage =
            user.profileFavPackage == myUser.profileFavPackage
                ? myUser.profileFavPackage
                : null;
        final commonExperience =
            user.profileExperience == myUser.profileExperience
                ? myUser.profileExperience
                : null;
        final commonJob =
            user.profileJob == myUser.profileJob ? myUser.profileJob : null;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileView(otherUser: user),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30, // 半径を小さくする
                    backgroundColor: Colors.grey[200],
                    child: ClipOval(
                      child: Image.asset(
                        iconPath,
                        width: 60, // 幅を小さくする
                        height: 60, // 高さを小さくする
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    user.teamName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    user.name,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Lottie.asset(
                          user.totalpoint != null && user.totalpoint! >= 80
                              ? 'assets/lottie/morehot_animation.json'
                              : 'assets/lottie/hot_animation.json',
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${user.totalpoint?.toStringAsFixed(1) ?? "N/A"}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // 共通の要素を表示
                  if (commonHobbies.isNotEmpty ||
                      commonFavPackage != null ||
                      commonExperience != null ||
                      commonJob != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (commonHobbies.isNotEmpty)
                          Text(
                            '共通の趣味: ${commonHobbies.join(', ')}',
                            style: TextStyle(fontSize: 12),
                          ),
                        if (commonFavPackage != null)
                          Text(
                            '共通の好きなパッケージ: $commonFavPackage',
                            style: TextStyle(fontSize: 12),
                          ),
                        if (commonExperience != null)
                          Text(
                            '共通の経験: $commonExperience',
                            style: TextStyle(fontSize: 12),
                          ),
                        if (commonJob != null)
                          Text(
                            '共通の職業: $commonJob',
                            style: TextStyle(fontSize: 12),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
