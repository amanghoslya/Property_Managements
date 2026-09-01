import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_care/core/constant/appColor.dart';

class Editprofilescreen extends StatefulWidget {
  const Editprofilescreen({super.key});

  @override
  State<Editprofilescreen> createState() => _EditprofilescreenState();
}

class _EditprofilescreenState extends State<Editprofilescreen> {
  final ImagePicker _picker = ImagePicker();

  File? selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          selectedImage = File(image.path);
        });
      }
    } catch (e) {
      debugPrint("Image picker error: $e");
    }
  }

  void _showImagePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
              child: const Text("Camera"),
            ),

            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
              child: const Text("Gallery"),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            isDefaultAction: true,
            child: const Text("Cancel"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        automaticallyImplyLeading: false,
        titleSpacing: 20.w,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 41.w,
                  height: 41.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(16, 28, 22, 0.3),
                    ),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: const Color(0xff101C16),
                    size: 16.sp,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit Profile",
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292832),
                      letterSpacing: -0.64,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Update your personal information",
                    style: GoogleFonts.outfit(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(42, 41, 51, 0.6),
                      letterSpacing: -0.24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(height: 33.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: selectedImage != null
                              ? Image.file(
                                  selectedImage!,
                                  width: 80.r,
                                  height: 80.r,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/profile (2).png",
                                  width: 80.r,
                                  height: 80.r,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Positioned(
                          right: -5.w,
                          bottom: -1.h,
                          child: GestureDetector(
                            onTap: _showImagePicker,
                            child: Container(
                              width: 30.r,
                              height: 30.r,
                              decoration: BoxDecoration(
                                color: const Color(0xff101C16),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                                size: 15.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    GestureDetector(
                      onTap: _showImagePicker,
                      child: Text(
                        "Update profile photo",
                        style: GoogleFonts.outfit(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff101C16),
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                "Personal Information",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF101C16),
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 9.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: Color(0xFF000000), width: 1.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextfield(
                      label: "Full Name",
                      hintText: "Enter Name",
                      keyboardType: TextInputType.name,
                    ),
                    _buildTextfield(
                      label: "Email Address",
                      hintText: "juned@example.com",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    _buildTextfield(
                      label: "Phone Number",
                      hintText: "+91 98XXXXXX42",
                      keyboardType: TextInputType.number,
                    ),
                    _buildTextfield(
                      label: "Account Type",
                      hintText: "Property Owner",
                      keyboardType: TextInputType.streetAddress,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                height: 36.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff000000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFFFFFF),
                      fontSize: 14.sp,
                      letterSpacing: -0.34,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: double.infinity,
                height: 36.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.scaffoldBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                      side: BorderSide(color: AppColors.heading),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      fontSize: 14.sp,
                      letterSpacing: -0.34,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextfield({
    required String label,
    required String hintText,
    required TextInputType keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF000000),
            letterSpacing: -0.2,
          ),
        ),

        SizedBox(height: 7.h),

        Container(
          height: 44.h,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: TextField(
            cursorHeight: 18.h,
            cursorColor: AppColors.heading,
            cursorWidth: 1.5.w,
            keyboardType: keyboardType,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              isDense: true,

              hintText: hintText,
              hintStyle: GoogleFonts.outfit(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(16, 28, 22, 0.6),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(color: AppColors.heading),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(16, 28, 22, 0.6),
                ),
              ),

              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 6.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
