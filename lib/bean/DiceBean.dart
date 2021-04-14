class DiceBean {
  String diceImgPath = "";
  int diceNum = 0;
  bool diceSelected = false;
  bool success = false;

  DiceBean(this.diceNum, this.diceSelected, this.success) {
    diceImgPath = "images/dice${this.diceNum}.png";
  }
}
