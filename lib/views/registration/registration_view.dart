import 'package:flutter/material.dart';
import 'package:steganography_app/views/shared/custom_button.dart';
import 'package:steganography_app/views/shared/custom_text_field.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  bool isPasswordHide = true;
  bool isRePasswordHide = true;

  void _navigateToLogInView() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
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
                    const Text(
                      'Register',
                      style: TextStyle(fontSize: 48),
                    ),
                    const SizedBox(height: 24),
                    const CustomTextField(hintText: 'Enter username'),
                    const SizedBox(height: 20),
                    const CustomTextField(
                      hintText: 'Enter your email',
                    ),
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
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Re-nter password',
                      obscureText: isRePasswordHide,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isRePasswordHide = !isRePasswordHide;
                          });
                        },
                        child: Icon(isRePasswordHide
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    const SizedBox(height: 37),
                    CustomButton(
                      textButton: 'Register',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 18),
                    _buildLogInQuestion(),
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

  Row _buildLogInQuestion() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Have an account already?  ',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff0D0C0C),
          ),
        ),
        InkWell(
          onTap: () => _navigateToLogInView(),
          child: const Text(
            'Log in',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        )
      ],
    );
  }
}
