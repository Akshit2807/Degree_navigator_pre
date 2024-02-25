import 'package:Degree_Navigator/constants/color.dart';
import 'package:Degree_Navigator/models/category.dart';
import 'package:Degree_Navigator/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/search_testfield.dart';

import 'course_screens/courseSemester1.dart';
import 'course_screens/courseSemester2.dart';
import 'course_screens/courseSemester3.dart';
import 'course_screens/courseSemester4.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,
          child: Column(
            children: [
              AppBar(),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore Categories",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: kPrimaryColor),
                  ),
                )
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 24,
            ),
            itemBuilder: (context, index) {
              return CategoryCard(
                category: categoryList[index],
              );
            },
            itemCount: categoryList.length,
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const CourseSemester1(),
      //   ),
      // ),

      onTap: () {
        // Conditionally navigate based on category.thumbnail
        if (category.name == '1st Semester') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CourseSemester1(),
            ),
          );
        } else if (category.name == '2nd Semester') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CourseSemester2(),
            ),
          );
        } else if (category.name == '3rd Semester') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CourseSemester3(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CourseSemester4(),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Image.asset(
                    category.thumbnail,
                    // fit: BoxFit.fill,
                    // height: kCategoryCardImageSize,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.name),
            Text(
              "${category.noOfCourses.toString()} courses",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );

  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color(0xff886ff2),
            Color(0xff6849ef),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,\nGood Morning",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CircleButton(
                icon: Icons.person,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchTextField()
        ],
      ),
    );
  }
}
