import 'dart:io';

void main(List<String> arguments) {
  int number;
  int ch;
                     
  LBSIMCounter lbsimCounter;

//taking input for username
  print('Please enter user name');
  String? name = stdin.readLineSync();             

  if (name != null && name.isNotEmpty) {    //string type can be null so applying a condition
    lbsimCounter = LBSIMCounter(
      userName: name,
      count: 100,
    );
  } else {
    return;
  }

  //while loop for menu
  bool stop = false;
  while (!stop) {                                            
    print('Enter operational value');       //take a number that wil be added or deleted from counter
    String? num = stdin.readLineSync();

    if (num != null && num.isNotEmpty) {
      print('The number you entered is: $num'); // display the number
      number = int.parse(num);
    } else {
      number = 0;
    }

    print('''
    Enter your choice
    0. Print value
    1. Increment
    2. Decrement
    3. Multiply 
    4. Divide
    5. Reminder
    6. Change User Name
    7. Stop the operation
  ''');

    String? choice = stdin.readLineSync();       // take a choice

    if (choice != null && choice.isNotEmpty) {
      ch = int.parse(choice);
    } else {
      ch = -1;
    }

    print('starting counter with value: ${lbsimCounter.count}');

    switch (ch) {
      case 0:
        print(lbsimCounter.count);
        break;
      case 1:
        incrementCounter(counter: lbsimCounter, incrementValue: number);
        break;
      case 2:
        decrementCounter(counter: lbsimCounter, decrementValue: number);
        break;
      case 3:
        multiplyCounter(counter: lbsimCounter, multiplyValue: number);
        break;
      case 4:
        divideCounter(counter: lbsimCounter, divideValue: number);
        break;
      case 5:
        reminderCounter(counter: lbsimCounter, divisorValue: number );
        break;
      case 6:
        changeUserName(counter: lbsimCounter);
        break;
      case 7:
        stop = true;
        break;
      default:
        print('Invalid Option');
    }
    print(
        'Current value of count is ${lbsimCounter.count} by ${lbsimCounter.userName}');
  }

  print(
      'Final value of count is ${lbsimCounter.count} ${lbsimCounter.userName}');
}

void changeUserName({required LBSIMCounter counter}) {
  String? tempInput = stdin.readLineSync();
  if (tempInput != null && tempInput.isNotEmpty) {
    print('New user is :$tempInput');
    counter.userName = tempInput;
  }
}

void incrementCounter(
    {required LBSIMCounter counter, required int incrementValue}) {
  counter.count = counter.count + incrementValue;
}

void decrementCounter(
    {required LBSIMCounter counter, required int decrementValue}) {
  counter.count = counter.count - decrementValue;
}
void multiplyCounter(
    {required LBSIMCounter counter, required int multiplyValue}) {
  counter.count = counter.count * multiplyValue;
}

void divideCounter(
    {required LBSIMCounter counter, required int divideValue}) {
  counter.count = counter.count ~/ divideValue;
}

void reminderCounter(
    {required LBSIMCounter counter, required int divisorValue}) {
  counter.count = counter.count % divisorValue;
}

class LBSIMCounter {
  int count;
  String userName;

  LBSIMCounter({required this.count, required this.userName});
}
