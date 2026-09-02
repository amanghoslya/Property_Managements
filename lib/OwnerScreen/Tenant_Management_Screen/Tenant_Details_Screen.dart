import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/core/constant/appColor.dart';
import 'package:svg_flutter/svg.dart';

class TenantDetailsScreen extends StatefulWidget {
  const TenantDetailsScreen({super.key});

  @override
  State<TenantDetailsScreen> createState() => _TenantDetailsScreenState();
}

class _TenantDetailsScreenState extends State<TenantDetailsScreen> {
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
                    "Tenant Details",
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292832),
                      letterSpacing: -0.64,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "View tenant and occupancy information",
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
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFF101C16), width: 1.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/tenantImg.png",
                      width: 70.w,
                      height: 70.h,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Arjun Kapoor",
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF000000),
                        letterSpacing: -0.3,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Primary Tenant",
                      style: GoogleFonts.outfit(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF000000),
                        letterSpacing: -0.3,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 21.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        border: Border.all(
                          color: Color(0xFF000000),
                          width: 1.w,
                        ),
                      ),
                      child: Text(
                        "Active Tenant",
                        style: GoogleFonts.outfit(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Tenant Information",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.heading,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    _documentRow(title: "Full Name", value: "Arjun Kapoor"),
                    _documentRow(title: "Tenant Type", value: "Primary Tenant"),
                    _documentRow(title: "Move-in Date", value: "15 Jan 2026"),
                    _documentRow(
                      title: "Occupancy Status",
                      value: "Currently Occupied",
                      showBottomBorder: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Property Details",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.heading,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 15.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: Color(0xFF000000),
                              width: 1.w,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/SvgImage/proAparment.svg",
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Apartment A-204",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF101C16),
                                letterSpacing: -0.2,
                              ),
                            ),
                            Text(
                              "Green Valley Residency",
                              style: GoogleFonts.outfit(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF000000),
                                letterSpacing: -0.2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Divider(color: Color.fromRGBO(42, 41, 51, 0.6)),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Property Type",
                            style: GoogleFonts.outfit(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(42, 41, 51, 0.6),
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Property Type",
                            style: GoogleFonts.outfit(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(42, 41, 51, 0.6),
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Apartment",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF101C16),
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "A-204",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF101C16),
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "FLOOR",
                            style: GoogleFonts.outfit(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(42, 41, 51, 0.6),
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Text(
                            "Ownership",
                            style: GoogleFonts.outfit(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(42, 41, 51, 0.6),
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "2nd Floor",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF101C16),
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Tenant",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF101C16),
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Contact Information",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF101C16),
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFCEF),
                        border: Border.all(color: AppColors.heading),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.heading,
                                width: 1.2,
                              ),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Icon(
                              Icons.phone_outlined,
                              color: AppColors.heading,
                              size: 16.sp,
                            ),
                          ),

                          SizedBox(height: 8.h),

                          Text(
                            "Phone",
                            style: GoogleFonts.outfit(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.heading,
                            ),
                          ),

                          SizedBox(height: 8.h),
                          Text(
                            "+91 98XXXXXX42",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.heading,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 20.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFCEF),
                        border: Border.all(color: AppColors.heading),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.heading),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Icon(
                              Icons.mail_outline,
                              color: AppColors.heading,
                              size: 16.sp,
                            ),
                          ),

                          SizedBox(height: 8.h),

                          Text(
                            "Email",
                            style: GoogleFonts.outfit(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.heading,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "arjun@example.com",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.heading,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                "Additional Information",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  "Tenant information is maintained for property management and relevant property-related communication.",
                  style: GoogleFonts.outfit(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.heading,
                    letterSpacing: -0.2,
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

  Widget _documentRow({
    required String title,
    required String value,
    bool showBottomBorder = true,
  }) {
    return SizedBox(
      height: 50.h,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                border: showBottomBorder
                    ? const Border(
                        bottom: BorderSide(color: Color(0xFFC8C8C1), width: 1),
                      )
                    : null,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(42, 41, 51, 0.6),
                  letterSpacing: -0.24,
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              border: showBottomBorder
                  ? const Border(
                      bottom: BorderSide(color: Color(0xFFC8C8C1), width: 1),
                    )
                  : null,
            ),
            alignment: Alignment.centerRight,
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: GoogleFonts.outfit(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
                letterSpacing: -0.24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
