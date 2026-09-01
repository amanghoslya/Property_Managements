import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/OwnerScreen/Bottom_Screen/Complaint_Screen/Complaints_screen.dart';
import 'package:property_care/OwnerScreen/Bottom_Screen/Document_Screen/document_screen.dart';
import 'package:property_care/OwnerScreen/Bottom_Screen/Home_screen/NotificationScreen.dart';
import 'package:property_care/OwnerScreen/Bottom_Screen/Profile_Screen/profile_screen.dart';
import 'package:property_care/OwnerScreen/Bottom_Screen/Property_Screen/property_screen.dart';
import 'package:property_care/core/constant/appColor.dart';

class MyBottomScreen extends StatefulWidget {
  const MyBottomScreen({super.key});

  @override
  State<MyBottomScreen> createState() => _MyBottomScreenState();
}

class _MyBottomScreenState extends State<MyBottomScreen> {
  int selectIndex = 0;

  List<Widget> get screen => [
    HomeScreen(),
    PropertyScreen(),
    ComplaintsScreen(),
    DocumentScreen(),
    ProfileScreen(),
  ];
  DateTime? lastBackPressed;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectIndex != 0) {
          setState(() {
            selectIndex = 0;
          });
          return false;
        }
        final now = DateTime.now();
        if (lastBackPressed == null ||
            now.difference(lastBackPressed!) > Duration(seconds: 2)) {
          lastBackPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              width: 200.w,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
              content: Center(
                child: Text(
                  "Press back again to exit",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              duration: Duration(seconds: 1),
            ),
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBg,
        body: screen[selectIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: AppColors.scaffoldBg,
            border: Border(top: BorderSide(color: AppColors.heading, width: 1)),
          ),
          child: BottomNavigationBar(
            backgroundColor: AppColors.background,
            currentIndex: selectIndex,

            selectedItemColor: const Color(0xff17221D),
            unselectedItemColor: const Color(0xff7D848D),

            selectedLabelStyle: GoogleFonts.manrope(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.heading,
            ),

            unselectedLabelStyle: GoogleFonts.manrope(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff7D848D),
            ),

            type: BottomNavigationBarType.fixed,

            onTap: (index) {
              setState(() {
                selectIndex = index;
              });
            },

            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/bottam_img.png",
                  width: 30.w,
                  height: 30.h,
                  color: selectIndex == 0
                      ? const Color(0xff17221D)
                      : const Color(0xff7D848D),
                ),
                label: "Home",
              ),

              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/bottom_img2.png",
                  width: 30.w,
                  height: 30.h,
                  color: selectIndex == 1
                      ? const Color(0xff17221D)
                      : const Color(0xff7D848D),
                ),
                label: "Property",
              ),

              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/bottom_img3.png",
                  width: 30.w,
                  height: 30.h,
                  color: selectIndex == 2
                      ? const Color(0xff17221D)
                      : const Color(0xff7D848D),
                ),
                label: "Complaints",
              ),

              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/bottom_img4.png",
                  width: 30.w,
                  height: 30.h,
                  color: selectIndex == 3
                      ? const Color(0xff17221D)
                      : const Color(0xff7D848D),
                ),
                label: "Documents",
              ),

              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/bottom_img5.png",
                  width: 30.w,
                  height: 30.h,
                  color: selectIndex == 4
                      ? const Color(0xff17221D)
                      : const Color(0xff7D848D),
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showPropertyPopup() {
    int selectedProperty = 0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.25),
      builder: (bottomSheetContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 14.w,
                right: 14.w,
                top: 14.h,
                bottom: MediaQuery.of(context).padding.bottom + 14.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffF8F5ED),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  Row(
                    children: [
                      Text(
                        "MY PROPERTIES",
                        style: GoogleFonts.outfit(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff171717),
                          letterSpacing: -0.54,
                        ),
                      ),

                      const Spacer(),

                      Text(
                        "2 Properties",
                        style: GoogleFonts.outfit(
                          fontSize: 13.sp,
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 32.h),
                  propertyItem(
                    "Apartment A-204",
                    "Green Valley Residency - Jaipur",
                    selectedProperty == 0,
                    onTap: () {
                      setModalState(() {
                        selectedProperty = 0;
                      });

                      print("Apartment A-204 Selected");
                    },
                  ),

                  SizedBox(height: 16.h),
                  propertyItem(
                    "Apartment B-104",
                    "Sunrise Heights - Jaipur",
                    selectedProperty == 1,
                    onTap: () {
                      setModalState(() {
                        selectedProperty = 1;
                      });

                      print("Apartment B-104 Selected");
                    },
                  ),

                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () {
                      print("Add New Property");
                    },
                    child: Container(
                      width: double.infinity,
                      height: 34.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff777777)),
                      ),
                      child: Text(
                        "+  Add New Property",
                        style: GoogleFonts.outfit(
                          fontSize: 12.sp,
                          color: const Color(0xff171717),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Container(
          color: AppColors.scaffoldBg,
          padding: EdgeInsets.only(
            left: 18.w,
            right: 18.w,
            top: 28.h,
            // bottom: 12.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning",
                      style: GoogleFonts.manrope(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.heading,
                        letterSpacing: -0.39,
                      ),
                    ),

                    SizedBox(height: 4.h),

                    Text(
                      "HELLO, RAHUL 👋",
                      style: GoogleFonts.manrope(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.heading,
                        letterSpacing: -0.64,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                    Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Notificationscreen(),
                          ),
                        );
                },
                child: Container(
                  height: 36.h,
                  width: 36.w,
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBg,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: const Color(0xffB8BCB8),
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 24.sp,
                      color: const Color(0xff101C16),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 8.w),
              Container(
                height: 36.h,
                width: 36.w,
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBg,
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    color: const Color(0xffB8BCB8),
                    width: 1.w,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.person_outline,
                    size: 25.sp,
                    color: Color(0xff101C16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                  child: Image.asset(
                    "assets/home_img.png",
                    width: double.infinity,
                    height: 305.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff101C16).withOpacity(0.0),
                          Color(0xff101C16).withOpacity(0.0),
                          Color(0xff101C16),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    onTap: () {
                      print("hello");

                      showPropertyPopup();
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        top: 14.h,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 7.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff171717),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/Vector (1).png",
                            height: 16.h,
                            width: 15.w,
                          ),

                          SizedBox(width: 10.w),

                          Text(
                            "Apartment A-204",
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.white,
                              letterSpacing: -0.54,
                            ),
                          ),

                          const Spacer(),

                          Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: const Color(0xff171717),
                              size: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20.w,
                  right: 20.w,
                  top: 88.h,
                  child: Row(
                    children: [
                      Container(
                        height: 31.h,
                        width: 106.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                          child: Text(
                            "MY PROPERTY",
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 11.sp,
                              letterSpacing: -0.34,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 57.w,
                        height: 29.h,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(20, 30, 25, 0.4),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: Text(
                            "01 / 05",
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned.fill(
                //   child: Container(
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //         colors: [
                //           Color(0xff101C16).withOpacity(0.0),
                //           Color(0xff101C16).withOpacity(0.0),
                //           Color(0xff101C16),
                //         ],
                //       ),
                //       borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(30.r),
                //         bottomRight: Radius.circular(30.r),
                //       ),
                //     ),
                //   ),
                // ),
                Positioned(
                  left: 20.w,
                  right: 20.w,
                  bottom: 24.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "MY PROPERTY",
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w500,
                                fontSize: 11.sp,
                                color: Colors.white,
                                letterSpacing: -0.34,
                              ),
                            ),

                            SizedBox(height: 5.h),

                            Text(
                              "Apartment A-204",
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w500,
                                fontSize: 21.sp,
                                color: Colors.white,
                                letterSpacing: -0.7,
                              ),
                            ),

                            SizedBox(height: 3.h),

                            Text(
                              "Green Valley Residency · Jaipur",
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: Colors.white.withOpacity(0.65),
                                letterSpacing: -0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 27.h,
                        width: 82.w,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(20, 30, 25, 0.65),
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Container(
                                width: 45.w,
                                height: 16.h,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "Good",
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current Care Package",
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: Color.fromRGBO(42, 41, 51, 0.6),
                              letterSpacing: -0.39,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "Premium Care",
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Color(0xff2A2933),
                              letterSpacing: -0.54,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 31.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(color: Color(0xff17221D)),
                        ),
                        child: Center(
                          child: Text(
                            "ACTIVE",
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: Color(0xff17221D),
                              letterSpacing: -0.39,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Divider(thickness: 1, color: Colors.black),
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(184, 134, 11, 0.9),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff000000)),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Container(
                            width: 39.w,
                            height: 39.h,
                            decoration: BoxDecoration(
                              color: const Color(0xff000000),
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.auto_awesome,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Property Assistant",
                                    style: GoogleFonts.outfit(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff101010),
                                      letterSpacing: -0.54,
                                    ),
                                  ),

                                  SizedBox(width: 6.w),

                                  Container(
                                    height: 14.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffAE8130),
                                      borderRadius: BorderRadius.circular(3.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "AI",
                                        style: GoogleFonts.outfit(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 2.h),

                              Text(
                                "Ask me anything about your property",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.outfit(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff000000),
                                  letterSpacing: -0.24,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 8.w),

                        Container(
                          width: 41.w,
                          height: 41.h,
                          decoration: BoxDecoration(
                            color: const Color(0xffC18D0B),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1.5),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                              size: 22.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F5ED),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: const Color(0xff4F5752),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 42.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                color: const Color(0xffF8F5ED),
                                borderRadius: BorderRadius.circular(7.r),
                                border: Border.all(
                                  color: const Color(0xff4F5752),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.build_outlined,
                                size: 20.sp,
                                color: const Color(0xff303832),
                              ),
                            ),

                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Service Requests",
                                    style: GoogleFonts.outfit(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff000000),
                                      letterSpacing: -0.4,
                                    ),
                                  ),

                                  SizedBox(height: 2.h),

                                  Text(
                                    "Raise & track property services",
                                    style: GoogleFonts.outfit(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 0.6),
                                      letterSpacing: -0.24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 38.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xff101C16),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                size: 18.sp,
                                color: const Color(0xff101C16),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 8.h),

                        Container(
                          height: 1,
                          width: double.infinity,
                          color: const Color(0xff101C16),
                        ),

                        SizedBox(height: 10.h),

                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Active Requests",
                                  style: GoogleFonts.outfit(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                ),

                                SizedBox(height: 2.h),

                                Text(
                                  "02",
                                  style: GoogleFonts.outfit(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff101C16),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: 18.w),

                            Container(
                              height: 28.h,
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              decoration: BoxDecoration(
                                color: const Color(0xffE8E6DE),
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: const Color(0xff101C16),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 4.w,
                                    height: 4.h,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff000000),
                                      shape: BoxShape.circle,
                                    ),
                                  ),

                                  SizedBox(width: 6.w),

                                  Text(
                                    "In Progress",
                                    style: GoogleFonts.outfit(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff101C16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Text(
                              "View All →",
                              style: GoogleFonts.outfit(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff101C16),
                                letterSpacing: -0.34,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    children: [
                      Text(
                        "Property Overview",
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2A2933),
                          fontSize: 16.sp,
                          letterSpacing: -0.54,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View All",
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2A2933),
                          fontSize: 13.sp,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17.h),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          "assets/vector_img.png",
                          width: double.infinity,
                          height: 182.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  const Color(0xff101C16),
                                  const Color(0xff101C16).withOpacity(0.65),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Content
                      Positioned(
                        left: 19.w,
                        top: 30.h,
                        child: Text(
                          "PROPERTY AT A GLANCE",
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: -0.34,
                          ),
                        ),
                      ),

                      Positioned(
                        left: 19.w,
                        top: 63.h,
                        child: Row(
                          children: [
                            _infoItem("2", "Pending\nIssues"),

                            _verticalDivider(),

                            _infoItem("1", "Open\nMaintenance"),

                            _verticalDivider(),

                            _infoItem("15 AUG", "Last\nInspection"),

                            _verticalDivider(),

                            _infoItem("5", "Documents"),

                            _verticalDivider(),
                          ],
                        ),
                      ),

                      Positioned(
                        left: 19.w,
                        bottom: 30.h,
                        child: Row(
                          children: [
                            Container(
                              width: 18.w,
                              height: 18.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xffD8B400),
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 9.w,
                                  height: 9.w,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffD8B400),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "Everything is being monitored",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          "assets/home2_img.png",
                          width: double.infinity,
                          height: 235.h,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Gradient
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  const Color(0xff000000).withOpacity(0.95),
                                  const Color(0xff000000).withOpacity(0.70),
                                  const Color(0xff000000).withOpacity(0.20),
                                  Colors.transparent,
                                ],
                                stops: const [0.0, 0.45, 0.72, 1.0],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15.w,
                        top: 16.h,
                        child: Row(
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffD4B800),
                                  width: 1.2,
                                ),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: Icon(
                                Icons.description_outlined,
                                color: const Color(0xffD4B800),
                                size: 12.sp,
                              ),
                            ),

                            SizedBox(width: 7.w),

                            Text(
                              "PROPERTY REPORT",
                              style: GoogleFonts.outfit(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                letterSpacing: -0.24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 15.w,
                        top: 48.h,
                        child: Text(
                          "Property Audit Report",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: -0.54,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15.w,
                        top: 70.h,
                        child: Text(
                          "Latest Property Audit",
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(255, 255, 255, 0.6),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15.w,
                        top: 93.h,
                        child: Row(
                          children: [
                            Container(
                              width: 38.w,
                              height: 38.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xffD4B800),
                                  width: 1.3,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "86",
                                  style: GoogleFonts.outfit(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffD4B800),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 10.w),

                            Text(
                              "OVERALL\nSCORE",
                              style: GoogleFonts.outfit(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                height: 1.15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 15.w,
                        right: 15.w,
                        bottom: 53.h,
                        child: Container(
                          height: 1,
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                        ),
                      ),
                      Positioned(
                        left: 15.w,
                        bottom: 30.h,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Audit Date: ",
                                style: GoogleFonts.outfit(
                                  fontSize: 13.sp,
                                  color: Colors.white.withOpacity(0.65),
                                ),
                              ),
                              TextSpan(
                                text: "15 August 2026",
                                style: GoogleFonts.outfit(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15.w,
                        bottom: 30.h,
                        child: Text(
                          "View Report →",
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffD4B800),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  _maintenanceItem(
                    title: "Bathroom maintenance updated",
                    description: "Plumbing repair is currently in progress.",
                    time: "2h",
                    icon: Icons.check,
                    isCompleted: true,
                    isLast: false,
                  ),
                  _maintenanceItem(
                    title: "Inspection completed",
                    description: "Latest inspection report is now available.",
                    time: "2h",
                    icon: Icons.access_time,
                    isCompleted: false,
                    isLast: false,
                  ),
                  _maintenanceItem(
                    title: "New document uploaded",
                    description: "Maintenance report has been added.",
                    time: "2h",
                    icon: Icons.indeterminate_check_box_outlined,
                    isCompleted: false,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoItem(String value, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.outfit(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(
      width: 1.w,
      height: 38.h,
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      color: Colors.white,
    );
  }

  Widget _maintenanceItem({
    required String title,
    required String description,
    required String time,
    required IconData icon,
    required bool isCompleted,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LEFT TIMELINE
          SizedBox(
            width: 68.w,
            child: Column(
              children: [
                /// CIRCLE
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted
                        ? const Color(0xff101C16)
                        : AppColors.scaffoldBg,
                    border: isCompleted
                        ? null
                        : Border.all(
                            color: const Color(0xff101C16),
                            width: 1.5,
                          ),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: isCompleted ? 23.sp : 18.sp,
                      color: isCompleted
                          ? Colors.white
                          : const Color(0xff101C16),
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1.2.w,
                      color: const Color(0xff303832),
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(width: 14.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 0.h, bottom: 28.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.outfit(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff24242A),
                            letterSpacing: -0.55,
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff8B8B8B),
                            letterSpacing: -0.25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    time,
                    style: GoogleFonts.outfit(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff24242A),
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

  Widget propertyItem(
    String title,
    String subtitle,
    bool selected, {
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selected
              ? Color.fromRGBO(23, 23, 23, 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(
            color: selected ? const Color(0xff101010) : const Color(0xff777777),
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                "assets/home_img.png",
                width: 79.w,
                height: 64.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.outfit(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff2A2933),
                      letterSpacing: -0.54,
                    ),
                  ),

                  SizedBox(height: 5.h),

                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(
                      fontSize: 12.sp,
                      color: Color.fromRGBO(42, 41, 51, 0.7),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 8.w),

            /// Selected Circle
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: selected ? const Color(0xff101010) : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xff101010)),
              ),
              child: selected
                  ? Icon(Icons.check, color: Colors.white, size: 14.sp)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
