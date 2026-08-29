import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/Bottom_Screen/Complaint_Screen/ComplaintTrackingScreen.dart';
import 'package:property_care/core/constant/appColor.dart';

class ComplaintDetailScreen extends StatefulWidget {
  const ComplaintDetailScreen({super.key});

  @override
  State<ComplaintDetailScreen> createState() => _ComplaintDetailScreenState();
}

class _ComplaintDetailScreenState extends State<ComplaintDetailScreen> {
  final activities = [
    {
      "title": "Bathroom maintenance updated",
      "date": "21 Aug 2026 · 10:42 AM",
      "description": "Complaint successfully submitted by property owner.",
    },
    {
      "title": "Complaint Reviewed",
      "date": "21 Aug 2026 · 11:05 AM",
      "description": "Complaint reviewed by the association team.",
    },
    {
      "title": "Assigned to Maintenance",
      "date": "21 Aug 2026 · 11:15 AM",
      "description": "Maintenance supervisor assigned for inspection.",
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
              SizedBox(width: 9.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "COMPLAINT DETAILS",
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
                    "COMPLAINT INFORMATION",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 19.h),
                decoration: BoxDecoration(
                  color: Color.fromARGB(25, 16, 28, 22),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0xFF101C16), width: 1.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "COMPLAINT ID · CMP-2026-00124",
                                style: GoogleFonts.outfit(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(178, 42, 41, 51),
                                  letterSpacing: -0.3,
                                ),
                              ),
                              Text(
                                "Water Leakage in Bathroom",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.outfit(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF101C16),
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 13.w,
                            vertical: 4.5.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            border: Border.all(
                              color: const Color(0xFF101C16),
                              width: 1.w,
                            ),
                          ),
                          child: Text(
                            "OPEN",
                            style: GoogleFonts.outfit(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF101C16),
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Your complaint has been received and is currently awaiting assignment to the maintenance team.",
                      style: GoogleFonts.outfit(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(178, 42, 41, 51),
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0xFF101C16), width: 1.w),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 41.w,
                      height: 41.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                          color: Color(0xFF101C16),
                          width: 1.w,
                        ),
                      ),
                      child: Icon(
                        Icons.elevator_outlined,
                        size: 17.sp,
                        color: const Color(0xFF3E443D),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Property",
                          style: GoogleFonts.outfit(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(127, 42, 41, 51),
                            letterSpacing: -0.3,
                          ),
                        ),
                        Text(
                          "Apartment A-204",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF101C16),
                            letterSpacing: -0.3,
                            height: 1.h,
                          ),
                        ),
                        Text(
                          "Green Valley Residency",
                          style: GoogleFonts.outfit(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(127, 42, 41, 51),
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Category",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF101C16),
                  letterSpacing: -0.2,
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
                    _documentRow(title: "Category", value: "Electrical"),
                    _documentRow(
                      title: "Priority",
                      value: "High",
                      valueColor: const Color(0xFFAE8130),
                    ),
                    _documentRow(
                      title: "Submitted On",
                      value: "21 Aug 2026 · 10:42 AM",
                    ),
                    _documentRow(
                      title: "Last Updated",
                      value: "21 Aug 2026 · 11:15 AM",
                    ),
                    _documentRow(
                      title: "Resolution Type",
                      value: "Maintenance Visit",
                      showBottomBorder: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                "Complaint Description",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF101C16),
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Color.fromARGB(25, 16, 28, 22),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0xFF101C16), width: 1.w),
                ),
                child: Text(
                  "Water is continuously leaking from the bathroom pipe connection near the wash basin. The leakage has increased since yesterday and water is collecting on the floor.",
                  style: GoogleFonts.outfit(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF101C16),
                    letterSpacing: -0.2,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Assigned To",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF101C16),
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0xFF101C16), width: 1.w),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/rajkumar.png",
                      width: 50.w,
                      height: 50.h,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Raj Kumar",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF101C16),
                            letterSpacing: -0.2,
                          ),
                        ),
                        Text(
                          "Maintenance Supervisor",
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(16, 28, 22, 0.5),
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 46.w,
                      height: 46.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.4),
                        border: Border.all(
                          color: Color(0xFF101C16),
                          width: 1.w,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.call_outlined,
                          color: Color(0xFF101C16),
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                "Assigned To",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF101C16),
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0xFF101C16), width: 1.w),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.4),
                        border: Border.all(
                          color: Color(0xFF101C16),
                          width: 1.w,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.description_outlined,
                          color: Color(0xFF101C16),
                          size: 20.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Raj Kumar",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF101C16),
                            letterSpacing: -0.2,
                          ),
                        ),
                        Text(
                          "Maintenance Supervisor",
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(16, 28, 22, 0.5),
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "View",
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF101C16),
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Complaint Activity",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF101C16),
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 20.h),
              ...List.generate(activities.length, (index) {
                final activity = activities[index];
                return _TimelineItem(
                  title: activity["title"]!,
                  date: activity["date"]!,
                  description: activity["description"]!,
                  isLast: index == activities.length - 1,
                );
              }),
              SizedBox(height: 27.h),
              Row(
                children: [
                  Expanded(
                    child: _buildButton(
                      title: "Close Complaint",
                      backgroundColor: Colors.transparent,
                      borderColor: const Color(0xFF101C16),
                      textColor: const Color(0xFF101C16),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: _buildButton(
                      title: "Track Resolution",
                      backgroundColor: const Color(0xFF101C16),
                      borderColor: const Color(0xFF101C16),
                      textColor: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ComplaintTrackingScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _documentRow({
    required String title,
    required String value,
    Color valueColor = const Color(0xFF171A18),
    bool showBottomBorder = true,
  }) {
    return SizedBox(
      height: 54.h,
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

  Widget _buildButton({
    required String title,
    required Color backgroundColor,
    required Color borderColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 40.h,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          side: BorderSide(color: borderColor, width: 1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final bool isLast;

  const _TimelineItem({
    required this.title,
    required this.date,
    required this.description,
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
                  SizedBox(height: 6.h),
                  Text(
                    description,
                    style: GoogleFonts.outfit(
                      fontSize: 11.sp,
                      height: 1.2,
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
