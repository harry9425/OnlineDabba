class MessData {
  late String _id;
  late String _name;
  late double _avgRatings;
  late String _ownerId;
  late List<String> _subscribed;
  late List<String> _reviewId;
  late List<String> _plans;
  late String _address;
  late String _phoneNumber;
  late DateTime _dateStarted;

  MessData(
      this._id,
      this._name,
      this._avgRatings,
      this._ownerId,
      this._subscribed,
      this._reviewId,
      this._plans,
      this._address,
      this._phoneNumber,
      this._dateStarted,
      );

  MessData.empty();

   MessData.fromJson(Map<String, dynamic> json) {
      this._id= json['_id'].toString();
      this._name= json['name'];
      this._avgRatings= json['avgratings']?.toDouble();
      this._ownerId= json['ownerid'];
     this. _subscribed= List<String>.from(json['subscribed']);
     this._reviewId= List<String>.from(json['reviewid']);
      this._plans= List<String>.from(json['plans']);
      this._address= json['address'];
      this._phoneNumber= json['phonenumber'];
      this._dateStarted= DateTime.parse(json['datestarted']);
  }


  String get id => _id;
  set id(String value) => _id = value;

  String get name => _name;
  set name(String value) => _name = value;

  double get avgRatings => _avgRatings;
  set avgRatings(double value) => _avgRatings = value;

  String get ownerId => _ownerId;
  set ownerId(String value) => _ownerId = value;

  List<String> get subscribed => _subscribed;
  set subscribed(List<String> value) => _subscribed = value;

  List<String> get reviewId => _reviewId;
  set reviewId(List<String> value) => _reviewId = value;

  List<String> get plans => _plans;
  set plans(List<String> value) => _plans = value;

  String get address => _address;
  set address(String value) => _address = value;

  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) => _phoneNumber = value;

  DateTime get dateStarted => _dateStarted;
  set dateStarted(DateTime value) => _dateStarted = value;
}
