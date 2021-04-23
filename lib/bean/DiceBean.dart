class DiceBean {
  String diceImgPath = "";
  int idNum = 0;
  int diceNum = 0;
  bool diceSelected = false;
  bool success = false;

  DiceBean(this.idNum, this.diceNum, this.diceSelected, this.success) {
    diceImgPath = "images/normal/dice${this.diceNum}.png";
  }
}
