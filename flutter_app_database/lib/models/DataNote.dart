class DataNote {
  int _id;
  String _name;
  String _description;
  String _date;
  int _priority;
  DataNote(this._name, this._date, this._priority, [this._description]);
  DataNote.withId(this._id, this._name,this._date, this._priority, [this._description]);

  int get id => _id;
  String get name => _name;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  set name(String newName){
    if (newName.length <= 255){
      this._name = newName;
    }
  }
  set description(String description){
    if (description.length <= 255){
      this._description = description;
    }
  }
  set date(String date){
    this._date = date;
  }
  set priority(int priority){
    if (1 <= priority && priority <=2) {
      this._priority = priority;
    }
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['date'] = _date;
    map['priority'] = _priority;
    return map;
  }
  DataNote.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];
    this._name = map['name'];
    this._description = map['description'];
    this._date = map['date'];
    this._priority = map['priority'];
  }

}