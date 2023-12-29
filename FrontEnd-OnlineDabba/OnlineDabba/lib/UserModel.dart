class UserModel {
  late String _name;
  late String _id;
  late String _email;
  late String _phone;
  late String _password;
  late String _confirmpassword;

  String get name => _name;
  set name(String name) => _name = name;

  String get id => _id;
  set id(String id) => _id = id;

  String get email => _email;
  set email(String email) => _email = email;

  String get phone => _phone;
  set phone(String phone) => _phone = phone;

  String get password => _password;
  set password(String password) => _password = password;

  String get confirmpassword => _confirmpassword;
  set confirmpassword(String password) => _confirmpassword = confirmpassword;

  UserModel.empty();

  UserModel(this._name, this._id, this._email, this._phone, this._password);

  UserModel.fromMap(Map<String,dynamic> map){
    this._id=map['_id'].toString();
    this._name=map['name'].toString();
    this._email=map['email'].toString();
    this._phone=map['phonenumber'].toString();
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'phone': phone,
      'password': password,
      'confirmpassword': confirmpassword,
    };
  }
}