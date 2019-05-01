
class User {

	int _id;
	String _title;
	String _email;
  String _phone;
	String _password;

	User(this._title,this._email,this._phone,this._password);

	User.withId(this._id, this._title, this._email, this._phone,this._password);

	int get id => _id;

	String get title => _title;

	String get email => _email;

	String get phone => _phone;

	String get password => _password;

	set title(String newTitle) {
		this._title = newTitle;
	}

	set email(String newEmail) {
		this._email = newEmail;
	}

	set phone(String newPhone) {
		this._phone = newPhone;
	}

	set password(String newPass) {
		this._password = newPass;
	}

	// Convert a User object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['title'] = _title;
		map['email'] = _email;
		map['phone'] = _phone;
		map['password'] = _password;

		return map;
	}

	// Extract a User object from a Map object
	User.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._title = map['title'];
		this._email = map['email'];
		this._phone = map['phone'];
		this._password = map['password'];
	}
}









