import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final _formKey = GlobalKey<FormState>();

  late String _passcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          children: [
             Center(
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
      
            SizedBox(height: 10),
      
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                labelText: "Passcode",
              ),
              onSaved: (String? value){
                _passcode = value!;
              },
              validator: (String? value){
                if(value!.isEmpty){
                  return 'Passcode is required.';
                }else if(!(value.isNotEmpty && value.length >= 6)){
                  return 'The passcode must be at least 6 characters long.';
                }
                return null;
              },
            ),
            
            SizedBox(height: 10),
      
            ElevatedButton(
              onPressed: (){
                submit();
              },
              child: Text("Log in")
            ),
          ],
        ),
      )
    );
  }

  submit() {

      final isvalid = _formKey.currentState!.validate();

      if(isvalid){
        _formKey.currentState!.save();

        if(_passcode == "happy code"){
          Navigator.pushNamedAndRemoveUntil(context, "list",  (route) => false);
        }else{
          return showDialog(
            context: context, 
            builder: (_) => new AlertDialog(
              title: new Text("Error"),
              content: new Text("Passcode incorrect!"),
              actions: <Widget>[
                TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
        }
      }

  }
}