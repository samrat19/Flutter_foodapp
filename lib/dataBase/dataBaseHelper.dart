import 'package:food/dataBase/userData.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

	static DatabaseHelper _databaseHelper; 
	static Database _database;                

	String userTable = 'User_table';
	String colId = 'id';
	String colTitle = 'title';
	String colEmail = 'email';
	String colPhone = 'phone';
	String colPass = 'password';

	DatabaseHelper._createInstance(); 

	factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance(); 
		}
		return _databaseHelper;
	}

	Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
	}

	Future<Database> initializeDatabase() async {
		// Get the directory path for both Android and iOS to store database.
		Directory directory = await getApplicationDocumentsDirectory();
		String path = directory.path + 'Users.db';

		// Open/create the database at a given path
		var UsersDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
		return UsersDatabase;
	}

	void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE $userTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, '
				'$colEmail TEXT, $colPhone TEXT, $colPass TEXT)');
	}

	// Fetch Operation: Get all User objects from database
	Future<List<Map<String, dynamic>>> getUserMapList() async {
		Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $UserTable order by $colPriority ASC');
		var result = await db.query(userTable, orderBy: '$colId ASC');
		return result;
	}

	// Insert Operation: Insert a User object to database
	Future<int> insertUser(User user) async {
		Database db = await this.database;
		var result = await db.insert(userTable, user.toMap());
		return result;
	}

	// Update Operation: Update a User object and save it to database
	Future<int> updateUser(User User) async {
		var db = await this.database;
		var result = await db.update(userTable, User.toMap(), where: '$colId = ?', whereArgs: [User.id]);
		return result;
	}

	// Delete Operation: Delete a User object from database
	Future<int> deleteUser(int id) async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $userTable WHERE $colId = $id');
		return result;
	}

	// Get number of User objects in database
	Future<int> getCount() async {
		Database db = await this.database;
		List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $userTable');
		int result = Sqflite.firstIntValue(x);
		return result;
	}

	// Get the 'Map List' [ List<Map> ] and convert it to 'User List' [ List<User> ]
	Future<List<User>> getUserList() async {

		var UserMapList = await getUserMapList(); // Get 'Map List' from database
		int count = UserMapList.length;         // Count the number of map entries in db table

		List<User> userList = List<User>();
		// For loop to create a 'User List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			userList.add(User.fromMapObject(UserMapList[i]));
		}

		return userList;
	}

}







