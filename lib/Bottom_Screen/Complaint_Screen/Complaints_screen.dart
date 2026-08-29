import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/Bottom_Screen/Complaint_Screen/ComplaintDetailScreen.dart';
import 'package:property_care/Bottom_Screen/Complaint_Screen/CreateComplaintScreen.dart';
import 'package:property_care/core/constant/appColor.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  int selectedFilter = 0;
  int selectedSummary = 0;

  final List<Map<String, dynamic>> complaints = [
    {
      "title": "Water Leakage in Bathroom",
      "complaintId": "CMP-2026-00124",
      "status": "OPEN",
      "priority": "High Priority",
      "date": "21 Aug 2026",
      "icon": Icons.water_damage_outlined,
    },
    {
      "title": "Lift Maintenance Issue",
      "complaintId": "CMP-2026-00118",
      "status": "IN PROGRESS",
      "priority": "Medium",
      "date": "18 Aug 2026",
      "icon": Icons.elevator_outlined,
    },
    {
      "title": "Common Area Lighting Issue",
      "complaintId": "CMP-2026-00105",
      "status": "RESOLVED",
      "priority": "Low Priority",
      "date": "10 Aug 2026",
      "icon": Icons.receipt_long_outlined,
    },
  ];

  final List<String> filters = ["All", "Open", "In Progress", "Resolved"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.scaffoldBg,
        titleSpacing: 20.w,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "COMPLAINTS",
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff292832),
                    letterSpacing: -0.64,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "PROPERTY COMPLAINTS & QUERIES",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildSummaryCards(),
              SizedBox(height: 24.h),
              _buildSearchBox(),
              SizedBox(height: 20.h),
              _buildFilters(),
              SizedBox(height: 20.h),
              _buildComplaintHeader(),
              SizedBox(height: 27.h),
              Padding(
                padding: EdgeInsets.only(bottom: 60.h),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: complaints.length,
                  itemBuilder: (context, index) {
                    return _buildComplaintCard(complaints[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 50.h,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => CreateComplaintScreen()),
            );
          },
          backgroundColor: const Color(0xFF101C16),
          foregroundColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          icon: Icon(Icons.add, size: 20.sp),
          label: Text(
            "New Complaint",
            style: GoogleFonts.outfit(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: -0.2,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildSummaryCards() {
    return Row(
      children: [
        Expanded(
          child: _summaryCard(index: 0, count: "03", title: "Total"),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: _summaryCard(index: 1, count: "01", title: "Open"),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: _summaryCard(index: 2, count: "02", title: "Resolved"),
        ),
      ],
    );
  }

  Widget _summaryCard({
    required int index,
    required String count,
    required String title,
  }) {
    final bool isSelected = selectedSummary == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSummary = index;
          selectedFilter = 0;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF6C3) : const Color(0xFFEFEEE6),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Color(0xFF101C16), width: 1.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              count,
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF101C16),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(178, 42, 41, 51),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Color(0xFF101C16), width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Color(0xFF101C16), width: 1.w),
        ),
        hintText: "Search documents...",
        hintStyle: GoogleFonts.outfit(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(153, 42, 41, 51),
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 20.sp,
          color: Color.fromARGB(153, 42, 41, 51),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
      ),
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(filters.length, (index) {
          final bool isSelected = selectedFilter == index;
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedFilter = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 13.w),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xff101C16)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(40.r),
                  border: Border.all(color: const Color(0xff101C16), width: 1),
                ),
                alignment: Alignment.center,
                child: Text(
                  filters[index],
                  style: GoogleFonts.outfit(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : const Color(0xff101C16),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildComplaintHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "My Complaints",
          style: GoogleFonts.outfit(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF101C16),
            letterSpacing: -0.3,
          ),
        ),

        Text(
          "03 Records",
          style: GoogleFonts.outfit(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF101C16),
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildComplaintCard(Map<String, dynamic> complaint) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => ComplaintDetailScreen()),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: const Color(0xFF101C16), width: 1.w),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 41.w,
                  height: 41.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: Color(0xFF101C16), width: 1.w),
                  ),
                  child: Icon(
                    complaint["icon"],
                    size: 17.sp,
                    color: const Color(0xFF3E443D),
                  ),
                ),
                SizedBox(width: 5.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        complaint["title"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF101C16),
                          letterSpacing: -0.3,
                        ),
                      ),

                      Text(
                        "Complaint ID · ${complaint["complaintId"]}",
                        style: GoogleFonts.outfit(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(178, 42, 41, 51),
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.w),
                Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF101C16),
                      width: 1.w,
                    ),
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    size: 20.sp,
                    color: Color(0xFF292D32),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Divider(
              height: 1,
              thickness: 0.7,
              color: Color.fromARGB(102, 16, 28, 22),
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
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
                    complaint["status"],
                    style: GoogleFonts.outfit(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF101C16),
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  complaint["priority"],
                  style: GoogleFonts.outfit(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF101C16),
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  complaint["date"],
                  style: GoogleFonts.outfit(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF101C16),
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
