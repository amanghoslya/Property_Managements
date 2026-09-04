import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/OwnerScreen/Tenant_Management_Screen/Add_Tenant_Screen.dart';
import 'package:property_care/OwnerScreen/Tenant_Management_Screen/Tenant_Details_Screen.dart';
import 'package:property_care/core/constant/appColor.dart';

class TenantmanagementScreen extends StatefulWidget {
  const TenantmanagementScreen({super.key});

  @override
  State<TenantmanagementScreen> createState() => _TenantmanagementScreenState();
}

class _TenantmanagementScreenState extends State<TenantmanagementScreen> {
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
                    "Tenant Management",
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292832),
                      letterSpacing: -0.64,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Manage tenants for your property",
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
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
            SizedBox(height: 30.h),
            Row(
              children: [
                Text(
                  "Current Tenant",
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w500,
                    color: AppColors.heading,
                    fontSize: 16.sp,
                    letterSpacing: -0.2,
                  ),
                ),
                Spacer(),
                Text(
                  "1 Active",
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w500,
                    color: AppColors.heading,
                    fontSize: 16.sp,
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: const Color(0xffFFFCEF),
                border: Border.all(color: AppColors.heading, width: 1.2),
                borderRadius: BorderRadius.circular(13.r),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 51.w,
                        height: 51.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffF1F1EC),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/tenantImg.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 13.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Arjun Kapoor",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.heading,
                                letterSpacing: -0.2,
                              ),
                            ),

                            SizedBox(height: 5.h),

                            Text(
                              "Tenant • Apartment A-204",
                              style: GoogleFonts.outfit(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.heading,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.h,
                          horizontal: 22.w,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.heading,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Text(
                          "Active",
                          style: GoogleFonts.outfit(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.heading,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),
                  Container(
                    width: double.infinity,
                    height: 1.h,
                    color: const Color(0xff999999),
                  ),

                  SizedBox(height: 12.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _detailItem(
                          title: "Mobile Number",
                          value: "+91 98XXXXX42",
                        ),
                      ),

                      Expanded(
                        child: _detailItem(
                          title: "Move-in Date",
                          value: "01 Aug 2026",
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 19.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _detailItem(
                          title: "Monthly Rent",
                          value: "₹18,000",
                        ),
                      ),

                      Expanded(
                        child: _detailItem(
                          title: "Move-out Date",
                          value: "Not Set",
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => TenantDetailsScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 29.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.heading,
                              borderRadius: BorderRadius.circular(7.r),
                            ),
                            child: Text(
                              "View Tenant Details",
                              style: GoogleFonts.outfit(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 15.w),
                      Container(
                        width: 32.w,
                        height: 29.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFCEF),
                          border: Border.all(
                            color: AppColors.heading,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: Icon(
                          Icons.edit_outlined,
                          size: 16.sp,
                          color: AppColors.heading,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.heading),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Current Rent Status",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.heading,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Paid",
                        style: GoogleFonts.outfit(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.heading,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Text(
                        "Monthly Rent",
                        style: GoogleFonts.outfit(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(42, 41, 51, 0.6),
                          letterSpacing: -0.2,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Last Payment",
                        style: GoogleFonts.outfit(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(42, 41, 51, 0.6),
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Text(
                        "₹18,000",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.heading,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "01 Aug 2026",
                        style: GoogleFonts.outfit(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.heading,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              height: 36.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.heading,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => AddTenantScreen()),
                  );
                },
                child: Text(
                  "+ Add New Tenant",
                  style: GoogleFonts.outfit(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailItem({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(42, 41, 51, 0.6),
            letterSpacing: -0.2,
          ),
        ),

        SizedBox(height: 6.h),

        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.heading,
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }
}
