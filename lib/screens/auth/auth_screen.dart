// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:api_app/controllers/login_controller.dart';
import 'package:api_app/controllers/registeration_controller.dart';
import 'package:api_app/screens/auth/widgets/InputTextFieldWidget1.dart';
import 'package:api_app/screens/auth/widgets/input_fields.dart';
import 'package:api_app/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  RegisterationController registerationController =
      Get.put(RegisterationController());

  LoginController loginController = Get.put(LoginController());
  var _formkey = GlobalKey<FormState>();

 // var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Center(
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    /*Container(
                      child: Text(
                        'WELCOME',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),*/
                   /* Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       *//* MaterialButton(
                          color: !isLogin.value ? Colors.white : Colors.amber,
                          onPressed: () {
                            isLogin.value = false;
                          },
                          child: Text('Register'),
                        ),*//*
                        MaterialButton(

                          color: isLogin.value ? Colors.white : Colors.amber,
                          onPressed: () {

                              isLogin.value = true;

                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),*/

                    Row(

                      children: [

                        const Spacer(),
                        Expanded(

                          flex: 8,
                          child: Image.asset("assets/logo.png",width: 200,height: 200,),
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(height: 16.0 * 2),
                    Text(
                      "Atharva".toUpperCase(),
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0 * 2),


                    loginWidget()
                   // isLogin.value ? loginWidget() : registerWidget()
                  ]),

          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        InputTextFieldWidget(registerationController.nameController, 'name'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registerationController.emailController, 'email address'),
        SizedBox(
          height: 20,
        ),
        TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            controller:registerationController.passwordController ,
        ),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => registerationController.registerWithEmail(),
          title: 'Register',
        )
      ],
    );
  }

  Widget loginWidget() {
    return Form(
      key:_formkey,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          InputTextFieldWidget(loginController.emailController, 'User Name',

          ),
          SizedBox(
            height: 20,
          ),


          InputTextFieldWidget1(loginController.passwordController, 'password'),
          SizedBox(
            height: 20,
          ),

          SubmitButton(
            onPressed: () => loginController.loginWithEmail(),
            title: 'Login',
          )
        ],
      ),
    );
  }
}
