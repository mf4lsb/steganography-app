import 'package:flutter/material.dart';
import 'package:steganography_app/constants/typo.dart';
// ignore: unused_import
import 'package:steganography_app/views/main/attack/attack_view.dart';
import 'package:steganography_app/views/main/embedding/embedding_view.dart';
import 'package:steganography_app/views/main/extraction/extraction_view.dart';
import 'package:steganography_app/views/main/learn/learn_view.dart';
import 'package:steganography_app/views/profil_screen/profil_screen.dart';

import '../../constants/custom_colors.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final PageController _pageController =                         //Perintah untuk mengendalikan tampilan interface yang terdiri dari beberapa halaman
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
              height: 80,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 100,
                      width: 140,
                      child: 
                      Image.asset('assets/images/1.png', fit: BoxFit.cover),

                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilScreen()));
                      },
                      icon: const Icon(Icons.account_circle),
                      color: CustomColors.primaryPurple,
                      iconSize: 40,
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
                    child: _buildItemTabBar(                    //Menampilkan Menu pada Tabbar
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
          style: AppTypography.regular.copyWith(
            color: CustomColors.secondaryOrange,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
