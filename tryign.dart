void main() {
  ////////////////
  ///Task 1
  int? age = 90;
  String? name = "Hamza";
  double? gpa = 3.4;
  bool? isGraduated = false;
  print(
    "age is  ${age} , name is ${name} gpa is ${gpa} isGenerated is ${isGraduated}",
  );
  ///////////////////////////////
  ///Task 2
  print(gradeOf(4));
  ///////////////////////////////
  ///Task 3
  double bmiValue = bmi(weight: 60, height: 173);
  printCategory(bmiValue);
  ///////////////////////////////
  ///Task 4
  print(findStudent() ?? "Not Found");
  ///////////////////////////////
  ///Task 5
  List<int> scores = [45, 88, 62, 91, 30, 77];
  print(scores.where((n) => n >= 50));
  int total = scores.fold(0, (prev, n) => prev + n);
  print(total);
  print(scores.map((n) => (n / 100) * 100));
  print(
    scores.reduce(
      (value, element) => value <= element ? value = element : value,
    ),
  );
  ////////////////////////////////////
}

//////////////////
///Task 2
String gradeOf(double gpa) {
  if (gpa >= 3.5) {
    return "Excellent";
  } else if (gpa >= 3) {
    return 'Very Good';
  } else if (gpa >= 2.5) {
    return "Good";
  } else {
    gpa >= 2 ? "Pass" : "Fail";
  }
  return "enter a  valid value";
}

///////////////////////////////
/// Task 3
double bmi({required double weight, required double height}) {
  return weight / (height * height);
}

void printCategory(double bmiValue) {
  if (bmiValue < 18.5) {
    print("UnderWeight");
  } else if (bmiValue >= 18.5 && bmiValue <= 24.9) {
    print("Normal");
  } else {
    print("OverWeight");
  }
}

///////////////////////////////
/// Task 4
String? findStudent([String? name]) {
  List<String> names = ["Ali", "Ahmed", "Samira", "Mo"];
  bool isFound = names.contains(name);
  if (isFound) {
    return name;
  }
  return null;
}

///////////////////////////////
/// Task 5
