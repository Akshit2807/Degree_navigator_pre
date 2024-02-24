import 'package:untitled2/course_contents/semester1/details_screen_mathematics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/courseS3.dart';

class CourseSemester3 extends StatefulWidget {
  const CourseSemester3({Key? key}) : super(key: key);

  @override
  _CourseSemester3State createState() => _CourseSemester3State();
}

class _CourseSemester3State extends State<CourseSemester3> {
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
                          'Semester 3',
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
                        course: courses3[index],
                      );
                    },
                    itemCount: courses3.length,
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
  final CourseS3 course;
  const CourseContainer({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                title: course.name,
              ))),
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
