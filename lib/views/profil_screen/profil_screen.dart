import 'package:flutter/material.dart';
import 'package:steganography_app/constants/custom_colors.dart';
import 'package:steganography_app/constants/typo.dart';
import 'package:steganography_app/data/auth_service.dart';
// ignore: unused_import
import 'package:steganography_app/views/login/login_view.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF7E7FB),
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.close)),
        iconTheme: IconThemeData(color: Color(0xff602B6F)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFFF5AE52)
              ),
              child: Center(
                child: Text('A', style: AppTypography.medium.copyWith(fontSize: 40, color: CustomColors.primaryPurple)),
              ),
            ),
            SizedBox(height: 10,),
            Text('email@gmail.com', style: AppTypography.regular12.copyWith(fontSize: 18, color: CustomColors.primaryPurple)
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ElevatedButton(
                    onPressed: () async {
                     await AuthService.logOut();
                     Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF5AE52),
                      fixedSize: Size(MediaQuery.of(context).size.width, double.infinity),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: 
                      Text('Log Out',style: AppTypography.medium.copyWith(fontSize: 24, color: Colors.white)
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}