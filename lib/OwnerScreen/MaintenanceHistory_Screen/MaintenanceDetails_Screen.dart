import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/core/constant/appColor.dart';

class MaintenancedetailsScreen extends StatefulWidget {
  const MaintenancedetailsScreen({super.key});

  @override
  State<MaintenancedetailsScreen> createState() =>
      _MaintenancedetailsScreenState();
}

class _MaintenancedetailsScreenState extends State<MaintenancedetailsScreen> {
  final activities = [
    {
      "title": "Maintenance Requested",
      "date": "10 Aug 2026 • 09:20 AM",
      // "description": "Complaint successfully submitted by property owner.",
    },
    {
      "title": "Maintenance Assigned",
      "date": "10 Aug 2026 • 11:15 AM",
      // "description": "Complaint reviewed by the association team.",
    },
    {
      "title": "Work Started",
      "date": "12 Aug 2026 • 09:30 AM",
      // "description": "Maintenance supervisor assigned for inspection.",
    },
    {
      "title": "Work Completed",
      "date": "12 Aug 2026 • 12:45 PM",
      // "description": "Maintenance supervisor assigned for inspection.",
    },
  ];
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
                    "Maintenance Details",
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292832),
                      letterSpacing: -0.64,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "View complete maintenance information",
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
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.heading),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffFFFCEF),
                            border: Border.all(
                              color: AppColors.heading,
                              width: 1.2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.bolt,
                            size: 20.sp,
                            color: AppColors.heading,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Electrical Maintenance",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff292832),
                                letterSpacing: -0.64,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              "Preventive Maintenance",
                              style: GoogleFonts.outfit(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(42, 41, 51, 0.6),
                                letterSpacing: -0.24,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.heading),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Text(
                              "Completed",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff292832),
                                letterSpacing: -0.64,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Divider(thickness: 1, color: AppColors.heading),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Text(
                          "Maintenance ID",
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.heading,
                            letterSpacing: -0.24,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "MR-2048",
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.heading,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Maintenance Information",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  letterSpacing: -0.24,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    _documentRow(
                      title: "Property",
                      value: "Apartment A-204",
                      color: AppColors.heading,
                    ),
                    _documentRow(
                      title: "Category",
                      value: "Electrical",
                      color: Color(0xffAE8130),
                    ),
                    _documentRow(
                      title: "Work Type",
                      value: "Preventive Maintenance",
                      color: AppColors.heading,
                    ),
                    _documentRow(
                      title: "Request Date",
                      value: "10 Aug 2026",
                      color: AppColors.heading,
                    ),
                    _documentRow(
                      title: "Completed Date",
                      value: "12 Aug 2026",
                      color: AppColors.heading,
                    ),
                    _documentRow(
                      title: "Current Status",
                      value: "Completed",
                      color: Color(0xff24B06A),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Work Details",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  letterSpacing: -0.24,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(16, 28, 22, 0.1),
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  "Electrical inspection and preventive maintenance was completed for the apartment. Switch points and electrical connections were checked and required maintenance work was completed by the assigned maintenance team.",
                  style: GoogleFonts.outfit(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.heading,
                    letterSpacing: -0.24,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Maintenance Timeline",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  letterSpacing: -0.24,
                ),
              ),
              SizedBox(height: 11.h),
              Container(
                padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 17.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    ...List.generate(activities.length, (index) {
                      final activity = activities[index];
                      return _TimelineItem(
                        title: activity["title"]!,
                        date: activity["date"]!,
                        isLast: index == activities.length - 1,
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Assigned Team",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  letterSpacing: -0.24,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(),
                ),
                child: Row(
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
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rahul Sharma",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff292832),
                            letterSpacing: -0.64,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Maintenance Supervisor",
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(42, 41, 51, 0.6),
                            letterSpacing: -0.24,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "Assigned",
                      style: GoogleFonts.outfit(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.heading,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Related Documents",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  letterSpacing: -0.24,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 51.w,
                      height: 51.w,
                      decoration: const BoxDecoration(color: Color(0xffF1F1EC)),
                      child: Image.asset("assets/pdf.png", fit: BoxFit.cover),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Maintenance_Report_MR2048.pdf",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff292832),
                            letterSpacing: -0.64,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Maintenance Report • 820 KB",
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(42, 41, 51, 0.6),
                            letterSpacing: -0.24,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "View",
                      style: GoogleFonts.outfit(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.heading,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Notes",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  letterSpacing: -0.24,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: AppColors.heading, width: 1.5),
                  ),
                ),
                child: Text(
                  "Maintenance work has been completed successfully. No further action is currently required from the property owner.",
                  style: GoogleFonts.outfit(
                    fontSize: 13.sp,
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
    required Color color,
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
                  color: const Color.fromRGBO(42, 41, 51, 0.6),
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
                color: color,
                letterSpacing: -0.24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String title;
  final String date;
  final bool isLast;

  const _TimelineItem({
    required this.title,
    required this.date,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 25.w,
            child: Column(
              children: [
                Container(
                  width: 25.w,
                  height: 25.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFFFEF4),
                    border: Border.all(
                      color: const Color(0xFF101C16),
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF101C16),
                      ),
                    ),
                  ),
                ),
                // Vertical Line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1..w,
                      color: const Color(0xFF000000),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 17.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(
                      fontSize: 16.sp,
                      height: 1.1,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF101C16),
                      letterSpacing: -0.2,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    date,
                    style: GoogleFonts.outfit(
                      fontSize: 11.sp,
                      height: 1.1,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(42, 41, 51, 0.5),
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
