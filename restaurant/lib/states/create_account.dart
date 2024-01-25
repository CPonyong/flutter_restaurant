import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/utility/dialog.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formField = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Create Account'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formField,
              child: Column(
                children: [
                  userName(size),
                  passWord(size),
                  createAccount(size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container createAccount(double size) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton.icon(
        onPressed: () {
          if (formField.currentState!.validate()) {
            String name = userNameController.text;
            String password = passwordController.text;
          }
        },
        icon: Icon(Icons.cloud_upload),
        label: Text('Create Account'),
      ),
    );
  }

  Container userName(double size) {
    return Container(
      width: size * 0.5,
      margin: EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        controller: userNameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Username Connt blank';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          label: Text('Username'),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  Container passWord(double size) {
    return Container(
      width: size * 0.5,
      margin: EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        controller: passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Pass word cannt blank';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          label: Text('Password'),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  Future<Null> insertNewUser({String? name, String? password}) async {
    String url = 'http://10.0.2.2:8080/customer/insert';
    await Dio().get(url).then((value) async {
      if (value.toString() != 'null') {
        normalDialog(context, 'User Duplicate', 'Please change user name');
      } else {
        String url = 'http://10.0.2.2:8080/customer/insert';
        await Dio().get(url).then((value) => null);
      }
    });
  }
}
