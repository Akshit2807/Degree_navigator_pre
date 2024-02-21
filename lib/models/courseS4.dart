class CourseS4 {
  String name;
  String author;
  String thumbnail;

  CourseS4({
    required this.author,
    required this.name,
    required this.thumbnail,
  });
}

List<CourseS4> courses4 = [
  CourseS4(
    author: "AKAD",
    name: "Engineering Mathematics",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  CourseS4(
    author: "AKAD",
    name: "Engineering Physics",
    thumbnail: "assets/icons/react.jpg",
  ),
  CourseS4(
    author: "AKAD",
    name: "FCP",
    thumbnail: "assets/icons/node.png",
  ),
  CourseS4(
    author: "AKAD",
    name: "FEE",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  // Course(
  //   author: "AKAD",
  //   name: "React Novice to Ninja",
  //   thumbnail: "assets/icons/react.jpg",
  // ),
  // Course(
  //   author: "AKAD",
  //   name: "Node - The complete guide",
  //   thumbnail: "assets/icons/node.png",
  // ),
];
