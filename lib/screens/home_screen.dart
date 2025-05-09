import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:entry/entry.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controllers/profile_hover_controller.dart';
import 'package:portfolio/screens/about_screen.dart';
import 'package:portfolio/screens/packages_screen.dart';
import 'package:portfolio/screens/work_screen.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool isDrawerOpen = false;
  int hoveringPage = -1;

  @override
  void initState() {
    super.initState();
  }

  final pages = [AboutScreen(), WorkScreen(), PackagesScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: Get.width,
                  height: 80,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          isDrawerOpen = !isDrawerOpen;
                          setState(() {});
                        },
                        icon: Icon(Icons.menu, color: kWhiteColor, size: 32),
                      ),
                      Text(
                        "Portfolio",
                        style: GoogleFonts.bebasNeue(
                          color: kPrimaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 0),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height - 80,
                          child: PageView.builder(
                            pageSnapping: false,
                            controller: _pageController,
                            itemCount: pages.length,
                            scrollDirection: Axis.vertical,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return pages[index];
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _drawer(),
            _pageIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _pageIndicator() {
    return Positioned(
      right: 15,
      top: 0,
      bottom: 0,
      child: Consumer<ProfileHoverController>(
        builder: (context, ProfileHoverController profileHoverController, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Entry.offset(
                duration: Duration(milliseconds: 500),
                xOffset: 30,
                yOffset: 0,
                child: Row(
                  children: [
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: hoveringPage == 0 ? 1.0 : 0.0,
                      child: AnimatedSlide(
                        duration: Duration(milliseconds: 200),
                        offset:
                            hoveringPage == 0 ? Offset(0, 0) : Offset(0.5, 0),
                        child: Text(
                          "About",
                          style: GoogleFonts.bebasNeue(color: kWhiteColor),
                        ),
                      ),
                    ),

                    if (hoveringPage == 0) SizedBox(width: 8),
                    IconButton(
                      onHover: (value) {
                        final int newHoveringPage = value ? 0 : -1;
                        if (hoveringPage != newHoveringPage) {
                          setState(() {
                            hoveringPage = newHoveringPage;
                          });
                          profileHoverController.updateHoverungIndex(
                            newHoveringPage,
                          );
                        }
                      },
                      onPressed: () {
                        _currentPage = 0;
                        _pageController.animateToPage(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                        setState(() {});
                      },
                      padding: EdgeInsets.zero,

                      icon: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: Icon(
                          _currentPage == 0
                              ? Icons.circle
                              : Icons.circle_outlined,
                          key: ValueKey(_currentPage == 0),
                          size: 24,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Entry.offset(
                duration: Duration(milliseconds: 700),
                xOffset: 30,
                yOffset: 0,
                child: Row(
                  children: [
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: hoveringPage == 1 ? 1.0 : 0.0,
                      child: AnimatedSlide(
                        duration: Duration(milliseconds: 200),
                        offset:
                            hoveringPage == 1 ? Offset(0, 0) : Offset(0.5, 0),
                        child: Text(
                          "Projects",
                          style: GoogleFonts.bebasNeue(color: kWhiteColor),
                        ),
                      ),
                    ),
                    if (hoveringPage == 1) SizedBox(width: 8),

                    IconButton(
                      onHover: (value) {
                        final int newHoveringPage = value ? 1 : -1;
                        if (hoveringPage != newHoveringPage) {
                          setState(() {
                            hoveringPage = newHoveringPage;
                          });
                        }
                        profileHoverController.updateHoverungIndex(
                          newHoveringPage,
                        );
                      },
                      onPressed: () {
                        _currentPage = 1;
                        _pageController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                        setState(() {});
                      },
                      icon: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: Icon(
                          _currentPage == 1
                              ? Icons.circle
                              : Icons.circle_outlined,
                          key: ValueKey(_currentPage == 1),
                          size: 24,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Entry.offset(
                duration: Duration(milliseconds: 900),
                xOffset: 30,
                yOffset: 0,
                child: Row(
                  children: [
                    // if (hoveringPage == 2)
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: hoveringPage == 2 ? 1.0 : 0.0,
                      child: AnimatedSlide(
                        duration: Duration(milliseconds: 200),
                        offset:
                            hoveringPage == 2 ? Offset(0, 0) : Offset(0.5, 0),
                        child: Text(
                          "Packages",
                          style: GoogleFonts.bebasNeue(color: kWhiteColor),
                        ),
                      ),
                    ),

                    if (hoveringPage == 2) SizedBox(width: 8),

                    IconButton(
                      onHover: (value) {
                        final int newHoveringPage = value ? 2 : -1;
                        if (hoveringPage != newHoveringPage) {
                          setState(() {
                            hoveringPage = newHoveringPage;
                          });
                        }
                        profileHoverController.updateHoverungIndex(
                          newHoveringPage,
                        );
                      },
                      onPressed: () {
                        _currentPage = 2;
                        _pageController.animateToPage(
                          2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                        setState(() {});
                      },
                      icon: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: Icon(
                          _currentPage == 2
                              ? Icons.circle
                              : Icons.circle_outlined,
                          key: ValueKey(_currentPage == 2),
                          size: 24,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Entry.offset(
                duration: Duration(milliseconds: 1100),
                xOffset: 30,
                yOffset: 0,
                child: Row(
                  children: [
                    // if (hoveringPage == 3)
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: hoveringPage == 3 ? 1.0 : 0.0,
                      child: AnimatedSlide(
                        duration: Duration(milliseconds: 200),
                        offset:
                            hoveringPage == 3 ? Offset(0, 0) : Offset(0.5, 0),
                        child: Text(
                          "Contact",
                          style: GoogleFonts.bebasNeue(color: kWhiteColor),
                        ),
                      ),
                    ),

                    if (hoveringPage == 3) SizedBox(width: 8),

                    IconButton(
                      onHover: (value) {
                        final int newHoveringPage = value ? 3 : -1;
                        if (hoveringPage != newHoveringPage) {
                          setState(() {
                            hoveringPage = newHoveringPage;
                          });
                        }
                        profileHoverController.updateHoverungIndex(
                          newHoveringPage,
                        );
                      },
                      onPressed: () {
                        _currentPage = 3;
                        _pageController.animateToPage(
                          3,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                        setState(() {});
                      },
                      icon: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: Icon(
                          _currentPage == 3
                              ? Icons.circle
                              : Icons.circle_outlined,
                          key: ValueKey(_currentPage == 3),
                          size: 24,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  AnimatedPositioned _drawer() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      left: isDrawerOpen ? 0 : -Get.width * 0.17,
      child: Container(
        height: Get.height,
        width: Get.width * 0.17,
        color: kPrimaryColor,
        child: Column(
          children: [
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: () {
                    isDrawerOpen = false;
                    setState(() {});
                  },
                  icon: Icon(Icons.close, color: kBackgroundColor, size: 32),
                ),
              ),
            ),
            SizedBox(height: 12),
            Entry.offset(
              key: UniqueKey(),
              duration: Duration(milliseconds: 700),
              xOffset: -125,
              yOffset: 0,
              visible: true,

              child: InkWell(
                onTap: () async {
                  final Uri linkedInUrl = Uri.parse(
                    "https://www.linkedin.com/in/sai-kiran-katayath-6687941a5/",
                  );
                  if (await canLaunchUrl(linkedInUrl)) {
                    launchUrl(linkedInUrl);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: Get.width * 0.17,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: kBackgroundColor),
                      top: BorderSide(color: kBackgroundColor),
                    ),
                  ),
                  child: Text(
                    "LinkedIn",
                    style: GoogleFonts.bebasNeue(
                      color: kBackgroundColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Entry.offset(
              key: UniqueKey(),
              duration: Duration(milliseconds: 900),
              xOffset: -125,
              yOffset: 0,
              visible: true,
              child: InkWell(
                onTap: () async {
                  final Uri githubUri = Uri.parse(
                    "https://github.com/Katayath-Sai-Kiran",
                  );

                  if (await canLaunchUrl(githubUri)) {
                    launchUrl(githubUri);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: Get.width * 0.17,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: kBackgroundColor)),
                  ),
                  child: Text(
                    "Github",
                    style: GoogleFonts.bebasNeue(
                      color: kBackgroundColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

            Entry.offset(
              key: UniqueKey(),
              duration: Duration(milliseconds: 1100),
              xOffset: -125,
              yOffset: 0,
              visible: true,
              child: InkWell(
                onTap: () async {
                  final Uri mediumUri = Uri.parse(
                    "https://medium.com/@saikirankatayath",
                  );

                  if (await canLaunchUrl(mediumUri)) {
                    launchUrl(mediumUri);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: Get.width * 0.17,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: kBackgroundColor)),
                  ),
                  child: Text(
                    "Medium",
                    style: GoogleFonts.bebasNeue(
                      color: kBackgroundColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Entry.offset(
              key: UniqueKey(),
              duration: Duration(milliseconds: 1300),
              xOffset: -125,
              yOffset: 0,
              visible: true,
              child: InkWell(
                onTap: () async {
                  final stackOverflowUri = Uri.parse(
                    "https://stackoverflow.com/users/13438961/sai-kiran-katayath",
                  );
                  if (await canLaunchUrl(stackOverflowUri)) {
                    launchUrl(stackOverflowUri);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: Get.width * 0.17,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: kBackgroundColor)),
                  ),
                  child: Text(
                    "StackOverflow",
                    style: GoogleFonts.bebasNeue(
                      color: kBackgroundColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
