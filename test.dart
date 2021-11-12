int toSum(int number) {
  String strNum = number.toString();
  int sum = 0;
  for (int i = 0; i < strNum.length; i++) {
    sum += int.tryParse(strNum[i])!;
  }
  return sum;
}

void main() {
  print(toSum(456));
}
