import 'package:untitled2/constants/color.dart';
import 'package:untitled2/constants/icons.dart';
import 'package:untitled2/models/lesson.dart';
import 'package:untitled2/widgets/custom_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/lesson_card.dart';


class DetailsScreenMathematics extends StatefulWidget {
  final String title;
  const DetailsScreenMathematics({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _DetailsScreenMathematicsState createState() => _DetailsScreenMathematicsState();
}

class _DetailsScreenMathematicsState extends State<DetailsScreenMathematics> {
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          "Semester 1",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                          height: 35,
                          width: 35,
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),


                const CustomVideoPlayer(
                    videoUrl: 'https://download-video.akamaized.net/v3-1/playback/31e026a5-d8b9-4bfd-b7e5-97a759a7f0c1/c2831d0a?__token__=st=1708812059~exp=1708826459~acl=%2Fv3-1%2Fplayback%2F31e026a5-d8b9-4bfd-b7e5-97a759a7f0c1%2Fc2831d0a%2A~hmac=e663ced034a775f24fa00e92a1bd10ff868a19ad1058d38b0a4c21c0fdd1880c&r=dXMtY2VudHJhbDE%3D'
                ),


                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Engineering Mathematics",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Created by DegreeNavigator",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Image.asset(
                      icFeaturedOutlined,
                      height: 20,
                    ),
                    const Text(
                      " 4.8",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.timer,
                      color: Colors.grey,
                    ),
                    const Text(
                      " 72 Hours",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTabView(
                  index: _selectedTag,
                  changeTab: changeTab,
                ),
                _selectedTag == 0 ? const PlayList() : const Description(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayList extends StatelessWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 20,
          );
        },
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
        itemCount: lessonList.length,
        itemBuilder: (_, index) {
          return LessonCard(lesson: lessonList[index]);
        },
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
          "Build Flutter iOS and Android Apps with a Single Codebase: Learn Google's Flutter Mobile Development Framework & Dart"),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const CustomTabView({Key? key, required this.changeTab, required this.index})
      : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Playlist (22)", "Description"];

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .08, vertical: 15),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        // width: MediaQuery.of(context).size.width * 0.40,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Text(
            _tags[index],
            style: TextStyle(
              color: widget.index != index ? Colors.black : Colors.white,
              // fontSize: 30,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _tags
              .asMap()
              .entries
              .map((MapEntry map) => _buildTags(map.key))
              .toList(),
        ),
      ),
    );
  }
}



