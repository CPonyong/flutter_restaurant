import 'package:flutter/material.dart';
import 'package:restaurant/widgets/bg_theme.dart';
import 'package:restaurant/widgets/show_image.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = true;

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void _toggleEye() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  loginImage(size),
                  user(size),
                  password(size),
                  loginButton(size),
                  createAccountBtn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row createAccountBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/createAccount');
            },
            child: Text('Create Account'))
      ],
    );
  }

  Container loginButton(double size) {
    return Container(
      width: size * 0.5,
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {}
        },
        child: Text('Login'),
      ),
    );
  }

  Container password(double size) {
    return Container(
      width: size * 0.5,
      child: TextFormField(
        controller: passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter password';
          } else {
            return null;
          }
        },
        obscureText: _passwordVisible,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: () {
              _toggleEye();
            },
            icon: Icon(Icons.remove_red_eye),
          ),
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

  Container user(double size) {
    return Container(
      width: size * 0.5,
      margin: EdgeInsets.symmetric(vertical: 16),
      child: TextFormField(
        controller: userController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill username';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          labelText: 'User',
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_box_rounded),
          ),
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

  Container loginImage(double size) {
    return Container(
      width: size * 0.5,
      height: 200,
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowImage(),
    );
  }
}
