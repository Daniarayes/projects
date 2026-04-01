// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool isMale = true;
//   double height = 174;
//   int weight = 60;
//   int age = 29;

//   @override
//   Widget build(BuildContext context) {
//     double bmi = weight / ((height / 100) * (height / 100));

//     return Scaffold(
//       backgroundColor: const Color(0xff0A0E21),
//       body: SafeArea(
//         child: Column(
//           children: [
//             const TitleSection(),

//             GenderSection(
//               isMale: isMale,
//               onMale: () => setState(() => isMale = true),
//               onFemale: () => setState(() => isMale = false),
//             ),

//             HeightSection(
//               height: height,
//               onChange: (v) => setState(() => height = v),
//             ),

//             NumbersSection(
//               weight: weight,
//               age: age,
//               onWeightAdd: () => setState(() => weight++),
//               onWeightRemove: () => setState(() => weight--),
//               onAgeAdd: () => setState(() => age++),
//               onAgeRemove: () => setState(() => age--),
//             ),

//             CalculateButton(bmi: bmi),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //// SECTIONS

// class TitleSection extends StatelessWidget {
//   const TitleSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.all(14),
//       child: Text(
//         "BMI CALCULATOR",
//         style: TextStyle(color: Colors.white, fontSize: 22 ),
//       ),
//     );
//   }
// }

// class GenderSection extends StatelessWidget {
//   final bool isMale;
//   final VoidCallback onMale;
//   final VoidCallback onFemale;

//   const GenderSection({
//     super.key,
//     required this.isMale,
//     required this.onMale,
//     required this.onFemale,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         GenderCard(
//           isSelected: isMale,
//           icon: Icons.male,
//           text: "MALE",
//           onTap: onMale,
//         ),
//         GenderCard(
//           isSelected: !isMale,
//           icon: Icons.female,
//           text: "FEMALE",
//           onTap: onFemale,
//         ),
//       ],
//     );
//   }
// }

// class HeightSection extends StatelessWidget {
//   final double height;
//   final Function(double) onChange;

//   const HeightSection({
//     super.key,
//     required this.height,
//     required this.onChange,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 220,
//       child: Card(
//         color: const Color(0xff1D1E33),
//         margin: const EdgeInsets.all(10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("HEIGHT", style: TextStyle(color: Colors.grey)),
//             Text(
//               "${height.toInt()} cm",
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Slider(
//               value: height,
//               min: 100,
//               max: 220,
//               activeColor: Colors.pink,
//               onChanged: onChange,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NumbersSection extends StatelessWidget {
//   final int weight;
//   final int age;
//   final VoidCallback onWeightAdd;
//   final VoidCallback onWeightRemove;
//   final VoidCallback onAgeAdd;
//   final VoidCallback onAgeRemove;

//   const NumbersSection({
//     super.key,
//     required this.weight,
//     required this.age,
//     required this.onWeightAdd,
//     required this.onWeightRemove,
//     required this.onAgeAdd,
//     required this.onAgeRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         NumberCard(
//           title: "WEIGHT",
//           value: weight,
//           onAdd: onWeightAdd,
//           onRemove: onWeightRemove,
//         ),
//         NumberCard(
//           title: "AGE",
//           value: age,
//           onAdd: onAgeAdd,
//           onRemove: onAgeRemove,
//         ),
//       ],
//     );
//   }
// }

// class CalculateButton extends StatelessWidget {
//   final double bmi;

//   const CalculateButton({super.key, required this.bmi});

//   @override
//   Widget build(BuildContext context) {
//     String result = bmi < 18.5
//         ? "UNDERWEIGHT"
//         : bmi < 25
//         ? "NORMAL"
//         : bmi < 30
//         ? "OVERWEIGHT"
//         : "OBESE";

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResultPage(bmi: bmi, result: result),
//           ),
//         );
//       },
//       child: Container(
//         width: double.infinity,
//         height: 60,
//         color: Colors.pink,
//         child: const Center(
//           child: Text(
//             "CALCULATE",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ////COMPONENTS

// class GenderCard extends StatelessWidget {
//   final bool isSelected;
//   final IconData icon;
//   final String text;
//   final VoidCallback onTap;

//   const GenderCard({
//     super.key,
//     required this.isSelected,
//     required this.icon,
//     required this.text,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Card(
//           color: isSelected ? const Color(0xff1D1E33) : const Color(0xff111328),
//           margin: const EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, color: Colors.white, size: 60),
//               const SizedBox(height: 10),
//               Text(text, style: const TextStyle(color: Colors.grey)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NumberCard extends StatelessWidget {
//   final String title;
//   final int value;
//   final VoidCallback onAdd;
//   final VoidCallback onRemove;

//   const NumberCard({
//     super.key,
//     required this.title,
//     required this.value,
//     required this.onAdd,
//     required this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Card(
//         color: const Color(0xff1D1E33),
//         margin: const EdgeInsets.all(10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(title, style: const TextStyle(color: Colors.grey)),
//             Text(
//               value.toString(),
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: onRemove,
//                   icon: const Icon(Icons.remove, color: Colors.white),
//                 ),
//                 IconButton(
//                   onPressed: onAdd,
//                   icon: const Icon(Icons.add, color: Colors.white),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ResultPage extends StatelessWidget {
//   final double bmi;
//   final String result;

//   const ResultPage({super.key, required this.bmi, required this.result});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff0A0E21),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text("Your Result"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               bmi.toStringAsFixed(1),
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 60,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               result,
//               style: const TextStyle(
//                 color: Colors.green,
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/': (context) => const HomePage(),
        '/result': (context) => const ResultPage(),
      },
    );
  }
}
