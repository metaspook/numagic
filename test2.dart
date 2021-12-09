// ignore_for_file: avoid_print

void main() {
  // var inNum = 3.5;
  // var inNum = "3";
  var inNum = 3;

  //  If conditional flow 1.
  if (inNum is int) {
    print('This is Integer');
  } else if (inNum is double) {
    print('This is double');
  } else if (inNum is String) {
    print('This is String');
  } else {
    print('This is another type or no number');
  }

  //  If conditional flow 2.
  if (inNum.runtimeType == int) {
    print('This is Integer');
  } else if (inNum.runtimeType == double) {
    print('This is double');
  } else if (inNum.runtimeType == String) {
    print('This is String');
  } else {
    print('This is another type or no number');
  }

  //  Ternary conditional flow 1.
  inNum is int
      ? print('This is Integer')
      : inNum is double
          ? print('This is double')
          : inNum is String
              ? print('This is String')
              : print('This is another type or no number');

  //  Ternary conditional flow 2.
  inNum.runtimeType == int
      ? print('This is Integer')
      : inNum.runtimeType == double
          ? print('This is double')
          : inNum.runtimeType == String
              ? print('This is String')
              : print('This is another type or no number');

  //  Switch conditional case.
  switch (inNum.runtimeType) {
    case int:
      print('This is Integer');
      break;
    case double:
      print('This is double');
      break;
    case String:
      print('This is String');
      break;
    default:
      print('This is another type or no number');
      break;
  }
}
