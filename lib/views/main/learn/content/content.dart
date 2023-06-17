import 'package:flutter/material.dart';

import '../../../../constants/custom_colors.dart';

class LearnContent extends StatelessWidget {
  final String title;
  final String content;
  final String image;

  const LearnContent({
    super.key,
    required this.content,
    required this.image,
    required this.title,
  });

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
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              iconSize: 36,
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 32,
                              color: CustomColors.primaryPurple,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 210,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff5B5B5B))),
                      ),
                      const SizedBox(height: 38),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xff5B5B5B),
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            content,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(height: 29),
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
