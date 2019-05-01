import 'package:flutter/material.dart';
import 'package:food/credenTials/signIn.dart';
import 'package:food/dataBase/dataBaseHelper.dart';
import 'package:food/dataBase/userData.dart';

class SignUp extends StatefulWidget {

	@override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

	DatabaseHelper helper = DatabaseHelper();

	User note;

	TextEditingController titleController = TextEditingController();
	TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

	@override
  Widget build(BuildContext context) {

		TextStyle textStyle = Theme.of(context).textTheme.title;

    return WillPopScope(

	    onWillPop: () {
		    moveToLastScreen();
	    },

	    child: Scaffold(
	    body: Padding(
		    padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
		    child: ListView(
			    children: <Widget>[
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: titleController,
						    style: textStyle,
						    onChanged: (value) {
						    	debugPrint('Something changed in Title Text Field');
						    	updateTitle();
						    },
						    decoration: InputDecoration(
							    labelText: 'Useer Name',
							    labelStyle: textStyle,
							    border: OutlineInputBorder(
								    borderRadius: BorderRadius.circular(5.0)
							    )
						    ),
					    ),
				    ),
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: emailController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updateEmail();
						    },
						    decoration: InputDecoration(
								    labelText: 'EmailId',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),
            Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: phoneController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Phone Number Text Field');
							    upDatePhoneNUmber();
						    },
						    decoration: InputDecoration(
								    labelText: 'Phone NUmber',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),

            Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: passController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in PassWord Text Field');
							    upDatePassword();
						    },
						    decoration: InputDecoration(
								    labelText: 'PassWord',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Row(
						    children: <Widget>[
						    	Expanded(
								    child: RaisedButton(
									    color: Theme.of(context).primaryColorDark,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Save',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
									    	setState(() {
									    	  debugPrint("Save button clicked");
									    	  _save();
									    	});
									    },
								    ),
							    ),
							    Container(width: 5.0,),
						    ],
					    ),
				    ),
			    ],
		    ),
	    ),

    ));
  }

  void moveToLastScreen() => Navigator.pop(context, true);
  
  void updateTitle() => note.title = titleController.text;

	void updateEmail() => note.email = emailController.text;

  void upDatePhoneNUmber() => note.phone = phoneController.text;

  void upDatePassword()=> note.password = passController.text;

	void _save() async {

		moveToLastScreen();
		int result;
		result = await helper.insertUser(note);
		if (result != 0) {  
			_showAlertDialog('Status', 'Note Saved Successfully');
      print("No Problem");
		} else {  
			_showAlertDialog('Status', 'Problem Saving Note');
      print("Problem");
		}

	}



	void _showAlertDialog(String title, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(title),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
	}

}
