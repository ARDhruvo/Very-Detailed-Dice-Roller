/* 
 * @author Kashikizu
 * Initial Completion Date: 25/3/2024 (dd/mm/yyyy)
 */

import 'dart:math';

void main() {
  //Rolls dices
  Dice d = Dice();
  d.ocd();
}

//The dice that is rolled
class Dice extends DiceRoll {
  //Main method for rolling the dice
  Dice() {
    int rolls = Random().nextInt(10);
    print("Number of dices rolled: $rolls");
    roll(rolls);
  }
}

class DiceRoll extends DiceCalc {
  DiceRoll() {}

  //Rolls the random amount of die
  void roll(int n) {
    //Counter for further calculations
    List<int> sides = [0, 0, 0, 0, 0, 0];

    for (int i = 0; i < n; i++) {
      //Tracks dice roll number
      int ser = i + 1;
      int rolled = (Random().nextInt(6969)) % 6;
      //Determines the result
      if (rolled == 0) {
        sides[0]++;
        print("Dice #$ser rolled a 1");
      } else if (rolled == 1) {
        sides[1]++;
        print("Dice #$ser rolled a 2");
      } else if (rolled == 2) {
        sides[2]++;
        print("Dice #$ser rolled a 3");
      } else if (rolled == 3) {
        sides[3]++;
        print("Dice #$ser rolled a 4");
      } else if (rolled == 4) {
        sides[4]++;
        print("Dice #$ser rolled a 5");
      } else {
        sides[5];
        print("Dice #$ser rolled a 6");
      }
    }
    ocd();
    //Finding the statistics of the results
    mostRolled(sides, n);
    highestRolled(sides, n);
    lowestRolled(sides, n);
  }
}

class DiceCalc {
  DiceCalc() {}

  //For finding the most rolled
  void mostRolled(List<int> sides, int n) {
    if (n == 0) {
      print("No dice was rolled");
    } else {
      print("Most rolled side(s): ");
      int mostFreq = sides.reduce(max);
      if (mostFreq == 1) {
        print("All sides were rolled equal number of times");
      } else {
        for (int i = 0; i < sides.length; i++) {
          if (mostFreq == sides[i]) {
            print(i + 1);
          }
        }
        double percSide = statCalc(mostFreq, n);
        print("Rolled $percSide% of the times");
      }
    }
    ocd();
  }

  //For finding the highest rolled
  void highestRolled(List<int> sides, int n) {
    if (n == 0) {
      return;
    } else {
      print("Highest rolled side: ");
      int highestFreq = 0;
      for (int i = 5; i > 0; i--) {
        if (sides[i] != 0) {
          highestFreq = i + 1;
          break;
        }
      }
      print(highestFreq);
      int iteration = sides[highestFreq - 1];
      double percSide = statCalc(iteration, n);
      print("Rolled $percSide% of the times");
    }
    ocd();
  }

  //For finding the lowest rolled
  void lowestRolled(List<int> sides, int n) {
    if (n == 0) {
      return;
    } else {
      print("Lowest rolled side: ");
      int lowestFreq = 0;
      for (int i = 0; i < 6; i++) {
        if (sides[i] != 0) {
          lowestFreq = i + 1;
          break;
        }
      }
      print(lowestFreq);
      int iteration = sides[lowestFreq - 1];
      double percSide = statCalc(iteration, n);
      print("Rolled $percSide% of the times");
    }
    ocd();
  }

  //Stat calculator
  double statCalc(int outcome, total) {
    double perc = (outcome / total) * 100;
    double percRound = double.parse(perc.toStringAsFixed(2));
    return percRound;
  }

  void ocd() {
    print("");
  }
}
