import 'package:flutter/material.dart';
import 'package:tic_tac_toe/results_screen.dart';
import 'package:tic_tac_toe/game.dart';
import 'package:tic_tac_toe/button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
     double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double btnWidth = screenWidth * 0.3; 
    //double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(190, 10, 221, 186),
        title: Text('ROCK-PAPER-SCISSOR',
        style: TextStyle(
          fontWeight: FontWeight.w400,
        ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 186, 185, 153),
      body:  SafeArea(
        child: LayoutBuilder(
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255, 49, 20, 118), width: 5.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "SCORE",
                            style: TextStyle(
                              color: Color.fromARGB(255, 187, 7, 232),
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${Game.gameScore}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 62, 4, 76),
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
              
                    /* Setting the Game play pad */
                    SizedBox(
                width: double.infinity,
                height: screenHeight * 0.45,
                child: Center(
                  child: LayoutBuilder(
              builder: (context, constraints) {
                //double btnSize = constraints.maxWidth * 0.3; // Adjust button size dynamically
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "Rock",
                      child: gameBtn(() {
                        print("you choosed rock");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameScreen(GameChoice("Rock")),
                          ),
                        );
                      }, "assets/rock_btn.png", btnWidth),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Hero(
                          tag: "Scisors",
                          child: gameBtn(() {
                            print("you choosed scisors");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameScreen(GameChoice("Scisors")),
                              ),
                            );
                          }, "assets/scisor_btn.png", btnWidth),
                        ),
                        Hero(
                          tag: "Paper",
                          child: gameBtn(() {
                            print("you choosed paper");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameScreen(GameChoice("Paper")),
                              ),
                            );
                          }, "assets/paper_btn.png", btnWidth),
                        ),
                      ],
                    ),
                  ],
                );
              },
                  ),
                ),
              ),
                    SizedBox(
                      width: double.infinity,
                      child: RawMaterialButton(
                        padding: const EdgeInsets.all(24.0),
                        onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
              return AlertDialog(
                title: Text("Game Rules"),
                content: Text("Rock beats Scissors, Scissors beats Paper, Paper beats Rock."),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Close"),
                  ),
                ],
              );
                  },
                );
              },
                        shape: const StadiumBorder(
                            side: BorderSide(color: Color.fromARGB(255, 12, 5, 5), width: 5)),
                        child: const Text(
                          "Rules",
                          style: TextStyle(
                              color: Color.fromARGB(255, 143, 6, 6),
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}