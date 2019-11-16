class State {
  String _method;
  String _oName;
  String _oId;
  String _timestamp;
  String _iState;
  String _iProgress;

  State(String method, String objName, String objId, String timestamp, String state, String progress) {
    this._method = method;
    this._oName = objName;
    this._oId = objId;
    this._timestamp = timestamp;
    this._iState = state;
    this._iProgress = progress;
  }

  String get method {
    return this._method;
  }
  String get oName {
    return this._oName;
  }
  String get oId {
    return this._oId;
  }
  String get timestamp {
    return this._timestamp;
  }
  int get timestampNum {
    return int.parse(this._timestamp);
  }
  String get iState {
    return this._iState;
  }
  String get iProgress {
    return this._iProgress;
  }
  double get iProgressNum {
    return double.parse(this._iProgress.split('%')[0]);
  }
}
