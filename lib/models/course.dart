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
    author: "AKAD",
    name: "Engineering Mathematics",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "AKAD",
    name: "Engineering Physics",
    thumbnail: "assets/icons/react.jpg",
  ),
  Course(
    author: "AKAD",
    name: "FCP",
    thumbnail: "assets/icons/node.png",
  ),
  Course(
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
