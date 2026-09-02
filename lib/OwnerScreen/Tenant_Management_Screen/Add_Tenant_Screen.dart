import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:property_care/core/constant/appColor.dart';

class AddTenantScreen extends StatefulWidget {
  const AddTenantScreen({super.key});

  @override
  State<AddTenantScreen> createState() => _AddTenantScreenState();
}

class _AddTenantScreenState extends State<AddTenantScreen> {
  DateTime? moveInDate;
  DateTime? moveOutDate;

  Future<void> selectMoveInDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: moveInDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        moveInDate = pickedDate;
      });
    }
  }

  Future<void> selectMoveOutDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: moveOutDate ?? moveInDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        moveOutDate = pickedDate;
      });
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) {
      return "dd-mm-yyyy";
    }

    return DateFormat("dd-MM-yyyy").format(date);
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
                    "Add Tenant",
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292832),
                      letterSpacing: -0.64,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Add tenant details for your property",
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
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: AppColors.heading),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/auditImg.png",
                          height: 18.h,
                          width: 18.w,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Property",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(42, 41, 51, 0.5),
                            fontSize: 11.sp,
                            letterSpacing: -0.2,
                          ),
                        ),
                        Text(
                          "Apartment A-204",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: AppColors.heading,
                            fontSize: 16.sp,
                            letterSpacing: -0.2,
                          ),
                        ),
                        Text(
                          "Green Valley Residency",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(42, 41, 51, 0.5),
                            fontSize: 11.sp,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "Owner",
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w500,
                        color: Color(0xffAE8130),
                        fontSize: 14.sp,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              Text(
                "Tenant Information",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  fontSize: 16.sp,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
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
                      label: "Tenant Full Name",
                      hintText: "Enter Tenant Name",
                      keyboardType: TextInputType.name,
                    ),
                    _buildTextfield(
                      label: "Mobile Number",
                      hintText: "Enter Mobile Number",
                      keyboardType: TextInputType.number,
                    ),
                    _buildTextfield(
                      label: "Email Address (Optional)",
                      hintText: "Enter Email Address",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    _buildTextfield(
                      label: "Tenant Status",
                      hintText: "Active",
                      keyboardType: TextInputType.streetAddress,
                    ),
                    _buildTextfield(
                      label: "Mobile Number",
                      hintText: "Enter Mobile Number",
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              Text(
                "Occupancy Details",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  fontSize: 16.sp,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFCEF),
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(13.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Move-in Date",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.heading,
                              letterSpacing: -0.2,
                            ),
                          ),

                          SizedBox(height: 6.h),

                          GestureDetector(
                            onTap: selectMoveInDate,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: const Color(0xffFFFCEF),
                                border: Border.all(color: AppColors.heading),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Text(
                                formatDate(moveInDate),
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: moveInDate == null
                                      ? const Color(0xff8C8C8C)
                                      : AppColors.heading,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 8.w),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expected Move-out",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.heading,
                              letterSpacing: -0.2,
                            ),
                          ),

                          SizedBox(height: 7.h),

                          GestureDetector(
                            onTap: selectMoveOutDate,

                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: const Color(0xffFFFCEF),
                                border: Border.all(color: AppColors.heading),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Text(
                                // IMPORTANT: yaha moveOutDate hoga
                                formatDate(moveOutDate),

                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: moveOutDate == null
                                      ? const Color(0xff8C8C8C)
                                      : AppColors.heading,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 23.h),
              Text(
                "Rental Details",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: Color(0xFF000000), width: 1.w),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildTextfield(
                        label: "Monthly Rent",
                        hintText: "₹ Enter amount",
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: _buildTextfield(
                        label: "Security Deposit",
                        hintText: "₹ Enter amount",
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26.h),
              SizedBox(
                width: double.infinity,
                height: 36.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.heading,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Save Tenant",
                    style: GoogleFonts.outfit(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: double.infinity,
                height: 36.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.scaffoldBg,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.heading),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.outfit(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
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
          margin: EdgeInsets.only(bottom: 8.h),
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
                fontSize: 15.sp,
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
