import 'package:flutter/material.dart';
import 'package:steganography_app/constants/custom_colors.dart';
import 'package:steganography_app/views/main/learn/content/content.dart';

import '../../../constants/common.dart';

class LearnView extends StatelessWidget {
  const LearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLearnItem(
            name: 'What is Steganography?',
            icon: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LearnContent(
                    content: Common.steganographyContent,
                    image: '',
                    title: 'Steganography',
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 52),
          _buildLearnItem(
            name: 'What is Quantum?',
            icon: '',
            onTap: () {},
          ),
          const SizedBox(height: 52),
          _buildLearnItem(
            name: 'How does Quantum Steganography Work?',
            icon: '',
            onTap: () {},
          ),
          const SizedBox(height: 62),
          _buildButtonSummary(),
        ],
      ),
    );
  }

  InkWell _buildLearnItem({
    required String name,
    required String icon,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 78,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xffFF66C4), Color(0xffFFDE59)],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: double.infinity,
                width: 75,
                color: Colors.red,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 21, color: CustomColors.primaryPurple),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: CustomColors.primaryPurple)),
                child: const Icon(
                  Icons.chevron_right,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildButtonSummary() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 78,
        decoration: BoxDecoration(
            color: CustomColors.primaryPurple,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4)
            ]),
        child: const Stack(
          children: [
            Center(
              child: Text(
                'Summary',
                style: TextStyle(fontSize: 32, color: Color(0xffF7E7FB)),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.chevron_right,
                    size: 50, color: Color(0xffF7E7FB)))
          ],
        ),
      ),
    );
  }
}
