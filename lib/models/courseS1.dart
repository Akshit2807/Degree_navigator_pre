class CourseS1 {
  String name;
  String author;
  String thumbnail;

  CourseS1({
    required this.author,
    required this.name,
    required this.thumbnail,
  });
}

List<CourseS1> courses1 = [
  CourseS1(
    author: "AKAD",
    name: "Engineering Mathematics",
    thumbnail: "assets/icons/maths.png",
  ),
  CourseS1(
    author: "AKAD",
    name: "Engineering Physics",
    thumbnail: "assets/icons/science.png",
  ),
  CourseS1(
    author: "AKAD",
    name: "FCP",
    thumbnail: "assets/icons/data-science.png",
  ),
  CourseS1(
    author: "AKAD",
    name: "FEE",
    thumbnail: "assets/icons/cpu.png",
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
