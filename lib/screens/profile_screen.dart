import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/bottom_icon_button.dart';
import 'package:flutter_kakao/components/round_icon_button.dart';
import 'package:flutter_kakao/models/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(user.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              FontAwesomeIcons.times,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            RoundIconButton(icon: FontAwesomeIcons.gift),
            SizedBox(
              width: 15,
            ),
            RoundIconButton(icon: FontAwesomeIcons.cog),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: Column(
          children: [
            Spacer(),
            if (user.name == me.name) _buildMyIcons() else _buildFriendIcons(),
          ],
        ),
      ),
    );
  }
}

Widget _buildFriendIcons() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BottomIconButton(FontAwesomeIcons.comment, "1:1 채팅"),
        SizedBox(
          width: 50,
        ),
        BottomIconButton(FontAwesomeIcons.phone, "통화하기"),
      ],
    ),
  );
}

Widget _buildMyIcons() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BottomIconButton(
          FontAwesomeIcons.comment,
          "나와의 채팅",
        ),
        SizedBox(
          width: 50,
        ),
        BottomIconButton(FontAwesomeIcons.pen, "프로필 편집"),
      ],
    ),
  );
}
