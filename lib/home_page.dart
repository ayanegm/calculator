import 'package:calc/custom_button.dart';
import 'package:calc/logic.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  String displayValue = "0";
  final Logic calculatorLogic = Logic();
  bool isTypingSecondNumber = false;
  bool isFreshStart = false;

  void handleNumberPress(String ch) {
    setState(() {
      if (isFreshStart) {
        displayValue = ch;
        isFreshStart = false;
      } else if (isTypingSecondNumber) {
        displayValue = ch;
        isTypingSecondNumber = false;
      } else {
        displayValue = calculatorLogic.writeNumber(displayValue, ch);
      }
    });
  }

  void handleClear() {
    setState(() {
      displayValue = calculatorLogic.clear();
      isTypingSecondNumber = false;
      isFreshStart = false;
    });
  }

  void handleBackspace() {
    setState(() {
      displayValue = calculatorLogic.clearOneDigit(displayValue);
      isFreshStart = false;
    });
  }

  void onOperatorPress(String op) {
    calculatorLogic.setOperation(displayValue, op);
    isTypingSecondNumber = true;
    isFreshStart = false;
  }

  void handleEquals() {
    setState(() {
      displayValue = calculatorLogic.calculate(displayValue);
      isTypingSecondNumber = false;
      isFreshStart = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<List<Map<String, dynamic>>> buttonData = [
  [{"text": "1", "action": () => handleNumberPress("1")},
  {"text": "2", "action": () => handleNumberPress("2")},
  {"text": "3", "action": () => handleNumberPress("3")},

  {"text": "+", "action": () => onOperatorPress("+"),"color":Colors.orange},
  ],
  [
  {"text": "4", "action": () => handleNumberPress("4")},
  {"text": "5", "action": () => handleNumberPress("5")},
  {"text": "6", "action": () => handleNumberPress("6")},
  {"text": "-", "action": () => onOperatorPress("-"),"color":Colors.orange},
  ],
  [{"text": "7", "action": () => handleNumberPress("7")},
  {"text": "8", "action": () => handleNumberPress("8")},
  {"text": "9", "action": () => handleNumberPress("9")},
  {"text": "x", "action": () => onOperatorPress("x"),"color":Colors.orange},
  ],
    [{"text": "C", "action": () => handleClear(),"color":Colors.blueGrey},
  {"text": "D", "action": () => handleBackspace(),"color":Colors.blueGrey},
    {"text": "0", "action": () => handleNumberPress("0"),"color":Colors.orange},
    {"text": "=", "action": () => handleEquals(),"color":Colors.orange},

    ]
];

    return Scaffold(
    body: Column(
      children: [
        Text(displayValue, style: const TextStyle(fontSize: 48)),
        // Map the rows to Row widgets
        ...buttonData.map((row) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row.map((data) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              width: 70, 
              height: 70, 
              child: CustomButton(
                text: data["text"],
                onPressed: data["action"],
                color: data['color'],
              ),
            ),
          )).toList(),
        )).toList(),
      ],
    ),
  );
  }
}