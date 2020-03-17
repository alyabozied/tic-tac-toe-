class cellstate {
  int value;
  cellstate(this.value);
}

class game {
  int currentplayer;
  game(this.currentplayer);
}

String checkWinner(List<cellstate> _state) {
  // for (int i = 0; i < 9; i++) {
  //   print(_state[i].value );
  // }
  for (int i = 0; i < 9; i += 3) {
    if (_state[i].value == _state[i + 1].value &&
        _state[i].value == _state[i + 2].value &&
        _state[i].value != 2) {
      return playerCode(_state[i].value);
    }
  }
  for (int i = 0; i < 3; i++) {
    if (_state[i].value == _state[i + 3].value &&
        _state[i].value == _state[i + 6].value &&
        _state[i].value != 2) {
      return playerCode(_state[i].value);
    }
  }

  if (_state[0].value == _state[8].value &&
      _state[0].value == _state[4].value &&
      _state[0].value != 2) {
    return playerCode(_state[0].value);
  }
  if (_state[2].value == _state[6].value &&
      _state[2].value == _state[4].value &&
      _state[2].value != 2) {
    return playerCode(_state[2].value);
  }
  for (int i = 0; i < 9; i++) {
    if (_state[i].value == 2) return " ";
  }
  return "Draw";
}

String playerCode(int code) {
  if (code == 0) return "X";
  return "O";
}
