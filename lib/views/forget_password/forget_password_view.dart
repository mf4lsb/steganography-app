import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';
import '../shared/custom_button.dart';
import '../shared/custom_text_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
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
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          iconSize: 36,
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 194,
                        height: 194,
                        color: CustomColors.primaryPurple,
                      ),
                      const SizedBox(height: 34),
                      const Text(
                        'Forget Password',
                        style: TextStyle(fontSize: 45),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 34),
                      const Text(
                        "Don't worry it happens. Please enter the address associated with your account.",
                        style: TextStyle(
                          fontSize: 16,
                          color: CustomColors.primaryPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 39),
                      const CustomTextField(
                        hintText: 'Enter your email',
                      ),
                      const SizedBox(height: 34),
                      CustomButton(
                        textButton: 'Submit',
                        onPressed: () {},
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
