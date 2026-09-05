import 'dart:io';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:property_care/core/constant/appColor.dart';

class CreateComplaintScreen extends StatefulWidget {
  const CreateComplaintScreen({super.key});

  @override
  State<CreateComplaintScreen> createState() => _CreateComplaintScreenState();
}

class _CreateComplaintScreenState extends State<CreateComplaintScreen> {
  String? selectedCategory;
  String? selectedSubject;

  final List<String> categories = [
    "Electrical",
    "Plumbing",
    "Civil",
    "Cleaning",
    "Security",
    "Other",
  ];

  final List<String> subjects = [
    "Electrical Issue",
    "Water Leakage",
    "Lift Maintenance",
    "Lighting Issue",
    "Other",
  ];

  int selectedPriority = 1;

  final List<String> priorities = ["Low", "Medium", "High"];

  final TextEditingController descriptionController = TextEditingController();
  File? selectedFile;
  String? selectedFileName;
  String? selectedFileType;

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffA5A69F),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Add Attachment",
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff101C16),
                  ),
                ),
                SizedBox(height: 18.h),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage();
                  },
                  leading: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff101C16),
                        width: 0.8.w,
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Icon(
                      Icons.image_outlined,
                      color: const Color(0xff101C16),
                      size: 21.sp,
                    ),
                  ),
                  title: Text(
                    "Upload Image",
                    style: GoogleFonts.outfit(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff101C16),
                    ),
                  ),
                  subtitle: Text(
                    "JPG, JPEG or PNG",
                    style: GoogleFonts.outfit(
                      fontSize: 12.sp,
                      color: const Color(0xff777777),
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: const Color(0xff101C16),
                  ),
                ),
                SizedBox(height: 5.h),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    _pickDocument();
                  },
                  leading: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff101C16),
                        width: 0.8.w,
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Icon(
                      Icons.description_outlined,
                      color: const Color(0xff101C16),
                      size: 21.sp,
                    ),
                  ),
                  title: Text(
                    "Upload Document",
                    style: GoogleFonts.outfit(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff101C16),
                    ),
                  ),
                  subtitle: Text(
                    "PDF, DOC or DOCX",
                    style: GoogleFonts.outfit(
                      fontSize: 10.sp,
                      color: const Color(0xff777777),
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: const Color(0xff101C16),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final File file = File(image.path);
      final int fileSize = await file.length();
      const int maxSize = 10 * 1024 * 1024;
      if (fileSize > maxSize) {
        _showError("Image size must be less than 10 MB.");
        return;
      }
      setState(() {
        selectedFile = file;
        selectedFileName = image.name;
        selectedFileType = "image";
      });
    } catch (e) {
      _showError("Unable to select image.");
    }
  }

  Future<void> _pickDocument() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ["pdf", "doc", "docx"],
      );
      if (result == null) {
        return;
      }
      final PlatformFile fileData = result.files.single;
      if (fileData.path == null) {
        _showError("Unable to select document.");
        return;
      }
      final File file = File(fileData.path!);
      final int fileSize = await file.length();
      const int maxSize = 10 * 1024 * 1024;
      if (fileSize > maxSize) {
        _showError("Document size must be less than 10 MB.");
        return;
      }
      setState(() {
        selectedFile = file;
        selectedFileName = fileData.name;
        selectedFileType = "document";
      });
    } catch (e) {
      _showError("Unable to select document.");
    }
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
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
              SizedBox(width: 9.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CREATE COMPLAINT",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292832),
                      letterSpacing: -0.64,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "RAISE A PROPERTY QUERY",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(
                      fontSize: 15.sp,
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
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: const Color(0xff101C16), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/document_img.png",
                            width: double.infinity,
                            height: 151.h,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 12.w,
                            top: 10.h,
                            child: Container(
                              width: 72.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: Color(0xff101C16),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Center(
                                child: Text(
                                  "A-204",
                                  style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Complaint For",
                          style: GoogleFonts.outfit(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff101C16),
                            letterSpacing: -0.54,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Apartment A-204 · Green Valley Residency",
                          style: GoogleFonts.outfit(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(42, 41, 51, 0.6),
                            letterSpacing: -0.34,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Complaint Information",
                style: GoogleFonts.outfit(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF101C16),
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(height: 16.h),
              _buildLabel("Complaint Category *"),
              SizedBox(height: 10.h),
              _buildDropdown(
                value: selectedCategory,
                hint: "Select Complain Category",
                items: categories,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
              SizedBox(height: 10.h),
              _buildLabel("Complaint Subject *"),
              SizedBox(height: 10.h),
              _buildDropdown(
                value: selectedSubject,
                hint: "Enter Complaint Subject",
                items: subjects,
                onChanged: (value) {
                  setState(() {
                    selectedSubject = value;
                  });
                },
              ),
              SizedBox(height: 10.h),
              _buildLabel("Description *"),
              SizedBox(height: 7.h),
              Container(
                height: 112.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(color: Color(0xFF101C16), width: 1.w),
                ),
                child: TextField(
                  controller: descriptionController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF101C16),
                    letterSpacing: -0.2,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12.w),
                    hintText: "Describe your complaint or query in detail...",
                    hintStyle: GoogleFonts.outfit(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(153, 41, 41, 51),
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Priority",
                style: GoogleFonts.outfit(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF101C16),
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(height: 10.h),
              _buildPriority(),
              SizedBox(height: 30.h),
              Text(
                "Attach Supporting Document / Image",
                style: GoogleFonts.outfit(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF101C16),
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  _showAttachmentOptions();
                },
                child: DottedBorder(
                  color: const Color(0xff101C16),
                  strokeWidth: 1,
                  dashPattern: const [2, 2],
                  radius: Radius.circular(10.r),
                  child: Container(
                    height: 104.h,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: selectedFile == null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 35.w,
                                height: 35.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFF101C16),
                                    width: 1.w,
                                  ),
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                child: Icon(
                                  Icons.file_upload_outlined,
                                  size: 18.sp,
                                  color: const Color(0xff101C16),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Add Attachment",
                                    style: GoogleFonts.outfit(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF101C16),
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    "JPG, PNG or PDF · Max 10 MB",
                                    style: GoogleFonts.outfit(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(153, 42, 41, 51),
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              children: [
                                Container(
                                  width: 40.w,
                                  height: 40.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xff101C16),
                                      width: 0.8.w,
                                    ),
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Icon(
                                    selectedFileType == "image"
                                        ? Icons.image_outlined
                                        : Icons.description_outlined,
                                    size: 20.sp,
                                    color: const Color(0xff101C16),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Text(
                                    selectedFileName ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.outfit(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff101C16),
                                    ),
                                  ),
                                ),

                                SizedBox(width: 8.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedFile = null;
                                      selectedFileName = null;
                                      selectedFileType = null;
                                    });
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 19.sp,
                                    color: const Color(0xff101C16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              _buildInfoBox(),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                height: 49.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF101C16),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    "Submit Complaint",
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.outfit(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF101C16),
        letterSpacing: -0.3,
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 48.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: const Color(0xFF101C16), width: 1.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          hint: Text(
            hint,
            style: GoogleFonts.outfit(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(153, 42, 41, 51),
              letterSpacing: -0.3,
            ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 20.sp,
            color: Color.fromARGB(153, 42, 41, 51),
          ),
          dropdownColor: Colors.white,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: GoogleFonts.outfit(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF101C16),
                  letterSpacing: -0.3,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildPriority() {
    return Row(
      children: List.generate(priorities.length, (index) {
        final bool isSelected = selectedPriority == index;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index != priorities.length - 1 ? 7.w : 0,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedPriority = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 38.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Color.fromARGB(102, 174, 129, 48)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: isSelected
                        ? Color(0xFFAE8130)
                        : Color.fromARGB(153, 42, 41, 51),
                    width: 1.w,
                  ),
                ),
                child: Text(
                  priorities[index],
                  style: GoogleFonts.outfit(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: isSelected
                        ? Color(0xFF2A2933)
                        : Color.fromARGB(153, 42, 41, 51),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.outfit(fontSize: 12.sp)),
        backgroundColor: const Color(0xff101C16),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget _buildInfoBox() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Color.fromARGB(25, 16, 28, 22),
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: const Color(0xFF101C16), width: 1.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "•",
            style: GoogleFonts.outfit(
              fontSize: 11.sp,
              color: const Color(0xff555555),
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Text(
              "After submission, a unique complaint ID will be generated. "
              "You can use it to track the complaint status and resolution progress.",
              style: GoogleFonts.outfit(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF2A2933),
                letterSpacing: -0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
