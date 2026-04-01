import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  double height = 174;
  int weight = 60;
  int age = 29;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0E21),
      body: SafeArea(
        child: Column(
          children: [
            /// Title
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "BMI CALCULATOR",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),

            /// Gender
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isMale = true),
                    child: Card(
                      color: isMale
                          ? const Color(0xff1D1E33)
                          : const Color(0xff111328),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.male, color: Colors.white, size: 60),
                          SizedBox(height: 10),
                          Text("MALE", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isMale = false),
                    child: Card(
                      color: !isMale
                          ? const Color(0xff1D1E33)
                          : const Color(0xff111328),
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.female, color: Colors.white, size: 60),
                          SizedBox(height: 10),
                          Text("FEMALE", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// Height
            SizedBox(
              height: 220,
              child: Card(
                color: const Color(0xff1D1E33),
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("HEIGHT", style: TextStyle(color: Colors.grey)),
                    Text(
                      "${height.toInt()} cm",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Slider(
                      value: height,
                      min: 100,
                      max: 220,
                      activeColor: Colors.pink,
                      onChanged: (v) => setState(() => height = v),
                    ),
                  ],
                ),
              ),
            ),

            /// Weight & age
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: const Color(0xff1D1E33),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => setState(() => weight--),
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () => setState(() => weight++),
                              icon: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Card(
                    color: const Color(0xff1D1E33),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("AGE", style: TextStyle(color: Colors.grey)),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => setState(() => age--),
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () => setState(() => age++),
                              icon: const Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Button
            GestureDetector(
              onTap: () {
                double bmi = weight / ((height / 100) * (height / 100));

                String result = bmi < 18.5
                    ? "UNDERWEIGHT"
                    : bmi < 25
                    ? "NORMAL"
                    : bmi < 30
                    ? "OVERWEIGHT"
                    : "OBESE";

                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: {'bmi': bmi, 'result': result},
                );
              },
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.pink,
                child: const Center(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
