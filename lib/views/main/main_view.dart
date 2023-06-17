import 'package:flutter/material.dart';
import 'package:steganography_app/views/main/attack/attack_view.dart';
import 'package:steganography_app/views/main/embedding/embedding_view.dart';
import 'package:steganography_app/views/main/extraction/extraction_view.dart';
import 'package:steganography_app/views/main/learn/learn_view.dart';

import '../../constants/custom_colors.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 92,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 134,
                      height: double.infinity,
                      color: Colors.red,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.account_circle),
                      color: CustomColors.primaryPurple,
                      iconSize: 50,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: CustomColors.primaryPurple,
              child: Row(
                children: [
                  Expanded(
                    child: _buildItemTabBar(
                      name: 'Learn',
                      pageNumber: 0,
                    ),
                  ),
                  Expanded(
                    child: _buildItemTabBar(
                      name: 'Embedding',
                      pageNumber: 1,
                    ),
                  ),
                  Expanded(
                    child: _buildItemTabBar(
                      name: 'Extraction',
                      pageNumber: 2,
                    ),
                  ),
                  Expanded(
                    child: _buildItemTabBar(
                      name: 'Attack',
                      pageNumber: 3,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                children: const [
                  LearnView(),
                  EmbeddingView(),
                  ExtractionView(),
                  AttackView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell _buildItemTabBar({
    required String name,
    required int pageNumber,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          currentPage = pageNumber;
          _pageController.jumpToPage(pageNumber);
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        decoration: currentPage == pageNumber
            ? const BoxDecoration(
                border: Border(
                  bottom:
                      BorderSide(color: CustomColors.secondaryOrange, width: 3),
                ),
              )
            : null,
        child: Text(
          name,
          style: const TextStyle(
            color: CustomColors.secondaryOrange,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
