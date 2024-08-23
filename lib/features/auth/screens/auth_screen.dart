import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/shared/widgets/custom_button.dart';
import 'package:amazon_clone/shared/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

enum Auth{
  signin,
  signup
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth_screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
    Auth _auth = Auth.signup;
    final _signUpFormKey = GlobalKey<FormState>();
    final _signInFormKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final AuthService authService = AuthService(); 
    
    @override
    void dispose(){
      super.dispose();
      _nameController.dispose();
      _emailController.dispose();
      _passwordController.dispose();
    }

    void signUpUser(){
      authService.signUpUser(context: context, name: _nameController.text, email: _emailController.text, password: _passwordController.text);
    }

    void signInUser(){
      authService.signInUser(context: context, email: _emailController.text, password: _passwordController.text);
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                "Welcome To Shopz",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),

              ListTile(
                title: const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                  },

                ),
              ),


              if(_auth == Auth.signup)
                Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextfield(controller: _nameController, hintText: "Username",),
                      const SizedBox(height: 30,),
                      CustomTextfield(controller: _emailController, hintText: "email",),
                      const SizedBox(height: 30,),
                      CustomTextfield(controller: _passwordController, hintText: "password",),
                      const SizedBox(height: 30,),
                      CustomButton(
                        text: 'Create Account', 
                        onTap: (){
                          if(_signUpFormKey.currentState!.validate()){
                            signUpUser();
                          }
                        }
                      )
                    ],
                  ),
                ),
              

              ListTile(
                title: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },

                ),
              ),
               if(_auth == Auth.signin)
                Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextfield(controller: _emailController, hintText: "email",),
                      const SizedBox(height: 30,),
                      CustomTextfield(controller: _passwordController, hintText: "paassword",),
                      const SizedBox(height: 30,),
                      CustomButton(text: 'Login',
                        onTap: (){
                            if(_signInFormKey.currentState!.validate()){
                              signInUser();
                            }
                          } 
                      )
                    ],
                  ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}