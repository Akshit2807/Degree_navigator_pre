import 'package:untitled2/models/courseS1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../detail_screens/semester1/details_screen_FCP.dart';
import '../detail_screens/semester1/details_screen_FEE.dart';
import '../detail_screens/semester1/details_screen_mathematics.dart';
import '../detail_screens/semester1/details_screen_physics.dart';


class CourseSemester1 extends StatefulWidget {
  const CourseSemester1({Key? key}) : super(key: key);

  @override
  _CourseSemester1State createState() => _CourseSemester1State();
}

class _CourseSemester1State extends State<CourseSemester1> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
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
                          'Semester 1',
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
                  height: 15,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {
                      return CourseContainer(
                        course: courses1[index],
                      );
                    },
                    itemCount: courses1.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CourseContainer extends StatelessWidget {
  final CourseS1 course;
  const CourseContainer({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => DetailsScreen(
      //       title: course.name,
      //     ),
      //   ),
      // ),

      onTap: () {
        // Conditionally navigate based on category.thumbnail
        if (course.name == 'Engineering Mathematics') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreenMathematics(
                title: course.name,
              ),
            ),
          );
        }
        else if (course.name == 'Engineering Physics') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreenPhysics(
                title: course.name,
              ),
            ),
          );
        }
        else if (course.name == 'FCP') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreenFCP(
                title: course.name,
              ),
            ),
          );
        }
        else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreenFEE(
                title: course.name,
              ),
            ),
          );
        }
        },

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                course.thumbnail,
                height: 60,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(course.name),
                  // Text(
                  //   "Author ${course.author}",
                  //   style: Theme.of(context).textTheme.bodySmall,
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  // LinearProgressIndicator(
                  //   value: course.completedPercentage,
                  //   backgroundColor: Colors.black12,
                  //   color: kPrimaryColor,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color? color;
  final VoidCallback onTap;

  const CustomIconButton({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    this.color = Colors.white,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 2.0,
            spreadRadius: .05,
          ), //BoxShadow
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Center(child: child),
      ),
    );
  }
}
