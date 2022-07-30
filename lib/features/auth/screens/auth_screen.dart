import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/themes/app_global_colors.dart';
import 'package:amazon_clone/themes/app_text_theme.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const String routeName = '/auth-screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppGlobalColors.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome", style: AppTextTheme.title),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? AppGlobalColors.backgroundColor
                    : AppGlobalColors.greyBackgroundCOlor,
                title: Text('Create Account', style: AppTextTheme.bold),
                leading: Radio(
                  activeColor: AppGlobalColors.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    _auth = val!;
                    setState(() {});
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: AppGlobalColors.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            hintText: 'Email', controller: _emailController),
                        const SizedBox(height: 10),
                        CustomTextField(
                            hintText: 'Password',
                            controller: _passwordController),
                        const SizedBox(height: 10),
                        CustomTextField(
                            hintText: 'Name', controller: _nameController),
                        const SizedBox(height: 10),
                        CustomButton(text: 'Sign Up', onTap: () {})
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? AppGlobalColors.backgroundColor
                    : AppGlobalColors.greyBackgroundCOlor,
                title: Text('Sign in', style: AppTextTheme.bold),
                leading: Radio(
                  activeColor: AppGlobalColors.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    _auth = val!;
                    setState(() {});
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: AppGlobalColors.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            hintText: 'Email', controller: _emailController),
                        const SizedBox(height: 10),
                        CustomTextField(
                            hintText: 'Password',
                            controller: _passwordController),
                        const SizedBox(height: 10),
                        CustomButton(text: 'Sign In', onTap: () {})
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}