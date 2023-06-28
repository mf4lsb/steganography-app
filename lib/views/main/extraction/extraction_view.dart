import 'package:flutter/material.dart';
import 'package:steganography_app/constants/custom_colors.dart';
import 'package:steganography_app/constants/typo.dart';
import 'package:steganography_app/views/shared/custom_text_field_v2.dart';

class ExtractionView extends StatelessWidget {
  const ExtractionView({Key? key}) : super(key: key);

  @override
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Stego Image',
                  style: AppTypography.title
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
                  style: AppTypography.title
                ),
                const CustomTextFieldV2(
                  hintText: 'Enter your key heres',
                ),
                const SizedBox(height: 24),
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
                    child: Text(
                      'Extraction',
                      style: AppTypography.regular12.copyWith(fontSize: 16, color: Color(0xff602B6F))
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Text('Watermarking', style: AppTypography.regular12.copyWith(fontSize: 18))),
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
                        'Save',
                        style: AppTypography.regular12.copyWith(
                          fontSize: 14,
                          color: CustomColors.primaryPurple,
                        ),
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
                        style: AppTypography.regular12.copyWith(
                          fontSize: 14,
                          color: CustomColors.primaryPurple,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

  
