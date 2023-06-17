import 'package:flutter/material.dart';
import 'package:steganography_app/views/forget_password/forget_password_view.dart';
import 'package:steganography_app/views/main/main_view.dart';
import 'package:steganography_app/views/registration/registration_view.dart';
import 'package:steganography_app/views/shared/custom_button.dart';
import 'package:steganography_app/views/shared/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isPasswordHide = true;

  void _navigateToRegistrationView() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegistrationView(),
        ),
      );

  void _navigateToForgetPasswordView() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ForgetPasswordView(),
        ),
      );

  void _navigateToMainView() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainView(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Login',
                              style: TextStyle(fontSize: 48),
                            ),
                            const SizedBox(height: 24),
                            const CustomTextField(hintText: 'Enter username'),
                            const SizedBox(height: 20),
                            CustomTextField(
                              hintText: 'Enter password',
                              obscureText: isPasswordHide,
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isPasswordHide = !isPasswordHide;
                                  });
                                },
                                child: Icon(isPasswordHide
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                            const SizedBox(height: 37),
                            CustomButton(
                              textButton: 'Login',
                              onPressed: () {
                                _navigateToMainView();
                              },
                            ),
                            const SizedBox(height: 18),
                            InkWell(
                              onTap: () => _navigateToForgetPasswordView(),
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff060606)),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(height: 10),
                    _buildHorizontalRule(),
                    const SizedBox(height: 12),
                    _buildSignUpQuestion(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Row _buildHorizontalRule() {
    return Row(
      children: [
        Expanded(child: Container(height: 3, color: Colors.black)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'or',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(child: Container(height: 3, color: Colors.black))
      ],
    );
  }

  Row _buildSignUpQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don’t have an account?  ',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff0D0C0C),
          ),
        ),
        InkWell(
          onTap: () => _navigateToRegistrationView(),
          child: const Text(
            'Sign up',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        )
      ],
    );
  }
}
