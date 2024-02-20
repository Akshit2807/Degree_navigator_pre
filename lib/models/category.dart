class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: '1st Semester',
    noOfCourses: 55,
    thumbnail: 'assets/icons/1sem01.jpg',
  ),
  Category(
    name: '2nd Semester',
    noOfCourses: 20,
    thumbnail: 'assets/icons/2sem01.png',
  ),
  Category(
    name: '3rd Semester',
    noOfCourses: 16,
    thumbnail: 'assets/icons/3sem02.png',
  ),
  Category(
    name: '4th Semester',
    noOfCourses: 25,
    thumbnail: 'assets/icons/4sem01.jpg',
  ),
];
