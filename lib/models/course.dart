class Course {
  String name;
  String author;
  String thumbnail;

  Course({
    required this.author,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    author: "DevWheels",
    name: "Flutter Novice to Ninja",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "DevWheels",
    name: "React Novice to Ninja",
    thumbnail: "assets/icons/react.jpg",
  ),
  Course(
    author: "DevWheels",
    name: "Node - The complete guide",
    thumbnail: "assets/icons/node.png",
  ),
  Course(
    author: "DevWheels",
    name: "Flutter Novice to Ninja",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "DevWheels",
    name: "React Novice to Ninja",
    thumbnail: "assets/icons/react.jpg",
  ),
  Course(
    author: "DevWheels",
    name: "Node - The complete guide",
    thumbnail: "assets/icons/node.png",
  ),
];
