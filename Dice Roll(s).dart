/* 
 * @author Kashikizu
 * Initial Completion Date: 25/03/2024 (dd/mm/yyyy)
 * Update: 28/03/2024 (Revamped the whole thing)
 */

import 'dart:math';

void main() {
  //Rolls dice
  Roll d = Roll();
  d.ocd();
}

class Roll extends DiceCalc {
  Roll() {
    List<int> sides = [0, 0, 0, 0, 0, 0]; //Frequency of sides of the dice

    int n = gen(); //Determines the roll amount
    if (n == 0) {
      print("No dice was rolled");
    } else {
      print("Dice was rolled $n times");
      for (int i = 0; i < n; i++) {
        int roll = rand() % 6; //Rolling for the result
        int s = i + 1;
        //Result display
        switch (roll) {
          case 0:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          case 1:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          case 2:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          case 3:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          case 4:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          case 5:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          default:
            {
              print(roll);
              print(sides[roll]);
            }
        }
      }
      List<int> sides2 = [
        0,
        0,
        0,
        0,
        0,
        0
      ]; //Another dice to copy the result to
      diceCopy(sides, sides2); //Copies dice results
      List<int> freq = [
        0,
        0
      ]; //Tracking the frequency of highest and lowest side
      int high = diceHigh(sides2, freq); //Gets highest side
      int low = diceLow(sides2, freq); //Gets lowest side
      int max = diceMax(sides2); //Gets most frequent side
      ocd();
      mostRolled(sides, max, n); //Prints most frequent side stats
      typeRolled(
          sides, high, freq[0], n, "Highest"); //Prints highest side stats
      typeRolled(sides, low, freq[1], n, "Lowest"); //Prints lowest side stats
      ocd();
    }
  }
}

class DiceCalc extends UnivCalc {
  DiceCalc() {}

  //Easier result printing
  int res(int side, s, roll) {
    side++;
    print("Dice #$s rolled a ${roll + 1}");
    return side;
  }

  //Gets most frequent side
  int diceMax(List<int> dice) {
    int max = 0;
    dice.sort();
    max = dice[5];
    return max;
  }

  //Copies dice results
  void diceCopy(List<int> side, side2) {
    for (int i = 0; i < 6; i++) {
      side2[i] = side[i];
    }
  }

  //Gets highest side
  int diceHigh(List<int> side2, freq) {
    int high = 0;
    for (int i = 5; i > 0; i--) {
      if (side2[i] != 0) {
        high = i + 1;
        freq[0] = side2[i];
        break;
      }
    }
    return high;
  }

  //Gets lowest side
  int diceLow(List<int> side2, freq) {
    int low = 0;
    for (int i = 0; i < 6; i++) {
      if (side2[i] != 0) {
        low = i + 1;
        freq[1] = side2[i];
        break;
      }
    }
    return low;
  }

  //Prints most frequent side stats
  void mostRolled(List<int> dice, int max, n) {
    print("Most Rolled Side(s)");
    for (int i = 0; i < 6; i++) {
      if (max == dice[i]) {
        print(i + 1);
      }
    }
    print("Rolled $max times");
    double times = percCalc(max, n); //Calculates statistics
    print("Rolled $times% of the times");
    ocd();
  }

  //Prints extreme side stats
  void typeRolled(List<int> dice, int est, freq, n, String type) {
    print("$type Rolled Side:");
    print(est);
    double times = percCalc(freq, n); //Calculates statistics
    print("Rolled $freq times");
    print("Rolled $times% of the times");
    ocd();
  }
}

class UnivCalc {
  UnivCalc() {}

  //Calculates % stats
  double percCalc(int f, n) {
    double percFace = (f / n) * 100;
    double percRound = double.parse(percFace.toStringAsFixed(2));
    return percRound;
  }

  void univRoll(int n) {}

  //Returns a random number
  int rand() {
    int value = Random().nextInt(6969);
    return value;
  }

  void ocd() {
    print("");
  }

  //Returns a random number between 10; Used for determining loop numbers
  int gen() {
    int value = Random().nextInt(10);
    return value;
  }
}
