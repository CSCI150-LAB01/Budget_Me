import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IndivBar{
  final int x;
  final double y;
  final int x2;
  final double y2;
  //final charts.Color color;

  IndivBar({required this.x, required this.y,required this.x2,required this.y2});
}

class BarData{
  final double totalBudget;
  final double monthlyIncome;
  final double rent;
  final double carPayment;
  final double pets;

  final double totalBudget2;
  final double monthlyIncome2;
  final double rent2;
  final double carPayment2;
  final double pets2;
  BarData({
    required this.totalBudget, 
    required this.monthlyIncome,
    required this.rent,
    required this.carPayment,
    required this.pets,

    required this.totalBudget2, 
    required this.monthlyIncome2,
    required this.rent2,
    required this.carPayment2,
    required this.pets2,
  });
  List<IndivBar> barData = [];

  void initBarData(){
    barData = [
      IndivBar(x:0, y:totalBudget,   x2:0, y2:totalBudget2),
      IndivBar(x:1, y:monthlyIncome, x2:1, y2:monthlyIncome2),
      IndivBar(x:2, y:rent,          x2:2, y2:rent2),
      IndivBar(x:3, y:carPayment,    x2:3, y2:carPayment2),
      IndivBar(x:4, y:pets,          x2:4, y2:pets2),

    ];
  }
}

Widget getBottomTitle(double value, TitleMeta meta){
  const style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch(value.toInt()){
    case 0:
      text = const Text('Total', style: style);
    case 1:
      text = const Text('Month', style: style);
    case 2:
      text = const Text('Rent', style: style);
    case 3:
      text = const Text('Car', style: style);
    case 4:
      text = const Text('Pet', style: style);
    default:
      text = const Text('', style: style);
  }
  return SideTitleWidget(child: text , axisSide: meta.axisSide);
}

Image logoWidget(String imageName) {
  //Grab image from assets folder func
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 300,
    color: Colors.white,
  );
}

TextField textbox(String text) {
  return TextField();
}

TextField textBox2(String text){
  return TextField(
    style: TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,

    ),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(color: Colors.white),

      fillColor: Colors.white,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
  );
}

TextField textBox3(String text){
  return TextField(
    style: TextStyle(color: Colors.black.withOpacity(0.9),
    fontWeight: FontWeight.bold,fontSize: 10,
    ),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(color: Colors.black),

      fillColor: Colors.black,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
  );
}

TextField textBoxPos(String text){
  return TextField(
    style: TextStyle(color: Colors.black,
    fontWeight: FontWeight.bold,fontSize: 16,
    ),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(color: Color.fromARGB(255, 0, 67, 1)),

      fillColor: Colors.black,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
  );
}

TextField textBoxNeg(String text){
  return TextField(
    style: TextStyle(color: Colors.red,
    fontWeight: FontWeight.bold,fontSize: 16,
    ),
    decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(color: Colors.red),

      fillColor: Colors.black,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
  );
}

TextField questions(String text) {
  return TextField(
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      //prefixIcon: Icon(
      //   icon,
      //   color: Colors.white70,
      // ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container confirmButton(BuildContext context, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      }, //onPressed
      child: Text(
        'Continue',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
  );
} //confirmButton

Container updateButton(BuildContext context, Function onTap) {
  return Container(
    width: 50,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      }, //onPressed
      child: Text(
        '+',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
  );
} //confirmButton

Container signInUpButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      // ignore: sort_child_properties_last
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
  );
}
