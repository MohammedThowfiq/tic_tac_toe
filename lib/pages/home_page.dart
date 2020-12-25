import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCross = true;
  List<String> gameState;
  String message;

  AssetImage edit = AssetImage("assets/edit.png");
  AssetImage cross = AssetImage("assets/cross.png");
  AssetImage circle = AssetImage("assets/circle.png");

  @override
  void initState() {
    super.initState();

    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  reset() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  getImage(String name) {
    switch (name) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  playGame(int index) {
    setState(() {
      if (this.gameState[index] == "empty") {
        if (this.isCross) {
          this.gameState[index] = "cross";
          this.isCross = false;
        } else {
          this.gameState[index] = "circle";
          this.isCross = true;
        }
        //this.isCross = !this.isCross;
        this.checkWin();
      }
    });
  }

  checkWin() {
    if ((gameState[0] != "edit") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = "${this.gameState[0]} wins";
      });
    } else if ((gameState[3] != "edit") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = "${this.gameState[3]} wins";
      });
    } else if ((gameState[6] != "edit") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[6]} wins";
      });
    } else if ((gameState[0] != "edit") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = "${this.gameState[0]} wins";
      });
    } else if ((gameState[1] != "edit") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = "${this.gameState[1]} wins";
      });
    } else if ((gameState[2] != "edit") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[2]} wins";
      });
    } else if ((gameState[0] != "edit") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[0]} wins";
      });
    } else if ((gameState[2] != "edit") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = "${this.gameState[2]} wins";
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        this.message = "Game Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    playGame(i);
                  },
                  child: Image(
                    image: this.getImage(this.gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "${this.message}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          MaterialButton(
            onPressed: reset,
            minWidth: 300.0,
            height: 50.0,
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.purple,
            child: Text(
              "Reset Game",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            child: Text(
              "Developed by Mohammed Thowfiq",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
