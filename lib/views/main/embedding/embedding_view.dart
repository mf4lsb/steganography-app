// Page Two
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:steganography_app/constants/custom_colors.dart';
import 'package:steganography_app/constants/typo.dart';
import 'package:steganography_app/model/image_picker.dart';
import 'package:steganography_app/views/shared/custom_text_field_v2.dart';


class EmbeddingView extends StatefulWidget {
  final Widget? prefixIcon;
  

  const EmbeddingView({
    this.prefixIcon,
    Key? key}) : super(key: key);
    

  @override
  State<EmbeddingView> createState() => _EmbeddingViewState();
}

class _EmbeddingViewState extends State<EmbeddingView> {
  File? pickedImage;

  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child:  
            GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Citra Host',
                    style: AppTypography.title
                  ),
                  CustomTextFieldV2(
                    readOnly: true,
                    onTap: () async {
                      final imagePicker = ImagePickerHandler();

                      final pickedImage = await imagePicker.pickImage();
                    },
                    prefixIcon: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          border: Border.all(color: const Color(0xff5B5B5B)),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text('Choose File'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Watermarking',
                    style: AppTypography.title,
                  ),
                  CustomTextFieldV2(
                    readOnly: true,
                    onTap: () {},
                    prefixIcon: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          border: Border.all(color: const Color(0xff5B5B5B)),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text('Choose File'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Key',
                    style: AppTypography.title,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: widget.prefixIcon,
                      prefixIconConstraints: const BoxConstraints(minHeight: 0, minWidth: 0),
                      fillColor: Colors.white,
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff5B5B5B)),
                      borderRadius: BorderRadius.circular(10),
                  ),
                      enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff5B5B5B)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                      hintText: 'Enter your key heres', hintStyle: AppTypography.headline.copyWith(fontSize: 18, color: Color(0xff393838))),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Noise',
                    style: AppTypography.title,
                  ),
                  CustomTextFieldV2(
                    readOnly: true,
                    onTap: () {},
                    prefixIcon: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          border: Border.all(color: const Color(0xff5B5B5B)),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text('Choose Noise'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: CustomColors.primaryPurple,
                            ),
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0),
                      onPressed: () {},
                      child: 
                      Text('Embedding',
                        style: AppTypography.regular12.copyWith(fontSize: 16, color: Color(0xff602B6F)),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(child: Text('Stego-Image', style: AppTypography.regular12.copyWith(fontSize: 18))),
                  SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    height: 236,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Center(child: Text('Stego-Image (After)', style: AppTypography.regular12.copyWith(fontSize: 18))),
                  SizedBox(height: 10), 
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    height: 236,
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: CustomColors.primaryPurple,
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0),
                        onPressed: () {},
                        child: Text(
                          'Save',style: AppTypography.regular12.copyWith(fontSize: 14, color: Color(0xff602B6F))
                        ),
                      ),
                      const SizedBox(width: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: CustomColors.primaryPurple,
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0),
                        onPressed: () {},
                        child: Text(
                          'Share',
                          style: AppTypography.regular12.copyWith(fontSize: 14, color: Color(0xff602B6F))
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
