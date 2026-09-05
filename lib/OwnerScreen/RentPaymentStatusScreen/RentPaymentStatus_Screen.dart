import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/core/constant/appColor.dart';

class RentpaymentstatusScreen extends StatefulWidget {
  const RentpaymentstatusScreen({super.key});

  @override
  State<RentpaymentstatusScreen> createState() =>
      _RentpaymentstatusScreenState();
}

class _RentpaymentstatusScreenState extends State<RentpaymentstatusScreen> {
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
                    "RENT PAYMENT STATUS",
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292832),
                      letterSpacing: -0.64,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Track tenant rent payment information",
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apartment A-204",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: AppColors.heading,
                            fontSize: 18.sp,
                            letterSpacing: -0.2,
                          ),
                        ),
                        Text(
                          "Green Valley Residency",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(42, 41, 51, 0.5),
                            fontSize: 13.sp,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.heading),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        "Active",
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          color: AppColors.heading,
                          fontSize: 18.sp,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading, width: 1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Outstanding Utility Charges",
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF101C16),
                        letterSpacing: -0.2,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      "₹3,240",
                      style: GoogleFonts.outfit(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF101C16),
                        letterSpacing: -0.2,
                      ),
                    ),

                    SizedBox(height: 3.h),

                    Text(
                      "Current unpaid utility charges",
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF101C16),
                        letterSpacing: -0.2,
                      ),
                    ),

                    SizedBox(height: 18.h),

                    Row(
                      children: [
                        Expanded(
                          child: _utilityInfoBox(
                            title: "Current Month",
                            value: "August 2026",
                          ),
                        ),

                        SizedBox(width: 18.w),

                        Expanded(
                          child: _utilityInfoBox(
                            title: "Pending Bills",
                            value: "2",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Current Utility Status",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  fontSize: 18.sp,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 16.h),
              _utilityCard(
                title: "Electricity",
                subtitle: "Monthly electricity charge",
                amount: "₹2,100",
                date: "28 Aug",
                status: "Pending",
                paid: false,
              ),
              SizedBox(height: 14.h),
              _utilityCard(
                title: "Water",
                subtitle: "Monthly water charge",
                amount: "₹2,100",
                date: "08 Aug",
                status: "Paid",
                paid: true,
              ),
              SizedBox(height: 24.h),
              Text(
                "Utility Payment History",
                style: GoogleFonts.outfit(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF101C16),
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading, width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  children: [
                    _rentHistoryItem(
                      month: "September 2026",
                      subtitle: "Rent",
                      status: "Pending",
                      amount: "₹18,000",
                      statusColor: const Color(0xFFB77B00),
                    ),

                    _rentHistoryItem(
                      month: "August 2026",
                      subtitle: "Paid On",
                      status: "Paid",
                      amount: "05 Aug 2026",
                      statusColor: AppColors.heading,
                    ),

                    _rentHistoryItem(
                      month: "July 2026",
                      subtitle: "Paid On",
                      status: "Paid",
                      amount: "05 Jul 2026",
                      statusColor: AppColors.heading,
                    ),

                    _rentHistoryItem(
                      month: "June 2026",
                      subtitle: "Recorded Status",
                      status: "Overdue",
                      amount: "Overdue",
                      statusColor: const Color(0xFFB77B00),
                      showDivider: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _utilityInfoBox({required String title, required String value}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.heading),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF101C16),
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            value,
            style: GoogleFonts.outfit(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF101C16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _utilityCard({
    required String title,
    required String subtitle,
    required String amount,
    required String date,
    required String status,
    required bool paid,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.heading),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(3.r),
                ),
                child: Icon(Icons.bolt, size: 16.sp, color: AppColors.heading),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.outfit(
                        fontSize: 19.sp,
                        color: const Color(0xFF101C16),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.outfit(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: paid ? AppColors.heading : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  paid ? "Paid" : "Unpaid",
                  style: GoogleFonts.outfit(
                    fontSize: 13.sp,
                    color: paid ? AppColors.heading : Colors.red,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          Divider(color: AppColors.heading, height: 1),

          SizedBox(height: 14.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _info("AMOUNT", amount),
              _info("DUE DATE", date),
              _info("STATUS", status),
            ],
          ),
        ],
      ),
    );
  }

  Widget _info(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(fontSize: 12.sp, color: Colors.grey),
        ),
        SizedBox(height: 3.h),
        Text(
          value,
          style: GoogleFonts.outfit(
            fontSize: 18.sp,
            color: const Color(0xFF101C16),
          ),
        ),
      ],
    );
  }

  Widget _rentHistoryItem({
    required String month,
    required String subtitle,
    required String status,
    required String amount,
    required Color statusColor,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      month,
                      style: GoogleFonts.outfit(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF101C16),
                        letterSpacing: -0.2,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      subtitle,
                      style: GoogleFonts.outfit(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF777777),
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: statusColor, width: 1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      status,
                      style: GoogleFonts.outfit(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: statusColor,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),

                  SizedBox(height: 3.h),

                  Text(
                    amount,
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF101C16),
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        if (showDivider)
          Divider(height: 1, thickness: 0.8, color: const Color(0xFF999999)),
      ],
    );
  }
}
