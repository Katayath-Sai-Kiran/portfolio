import 'dart:math';

import 'package:animated_floating_widget/enums/enums.dart';
import 'package:animated_floating_widget/widgets/floating_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controllers/profile_hover_controller.dart';
import 'package:portfolio/models/package_model.dart';
import 'package:portfolio/screens/packages_screen.dart';
import 'package:portfolio/urtils/responsive_utils.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});
  final List<String> greetings = [
    // Indian Languages
    'Namaste', // Hindi
    'Vanakkam', // Tamil
    'Namaskaram', // Telugu
    'Namaskar', // Marathi/Odia/Bengali/Nepali
    'Nomoskar', // Bengali (alternative)
    'Sat Sri Akal', // Punjabi
    'Namaskara', // Kannada
    'Nōmaste', // Malayalam
    // Major World Languages
    'Hi', // English
    'Hola', // Spanish
    'Salut', // French
    'Hallo', // German
    'Ciao', // Italian
    'Olá', // Portuguese
    'Salaam', // Persian/Arabic
    'Hej', // Swedish/Danish
    'Halo', // Indonesian
    'Zdravstvuyte', // Russian
    'Konnichiwa', // Japanese
    'Annyeong', // Korean
    'Nǐ hǎo', // Chinese (Mandarin)
    'Merhaba', // Turkish
    'Szia', // Hungarian
    'Selam', // Amharic/Ethiopian
    'Yā, yā', // Maori
    'Sawasdee', // Thai
    'Shalom', // Hebrew
  ];

  bool isMobile = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        isMobile = constraints.maxWidth < 600;
        return Column(
          children: [
            if (isMobile) SizedBox(height: isMobile ? 16 : Get.height * 0.17),
            if (isMobile)
              Stack(
                children: [
                  Container(
                    width: Get.height * 0.5,
                    height: Get.height * 0.5,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      "assets/images/profile.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black45,
                            Colors.black45,
                            Colors.black38,
                            Colors.black12,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: _greetings(),
                    ),
                  ),
                ],
              ),
            if (!isMobile)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.13),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: _greetings()),
                    SizedBox(width: 32),
                    Expanded(flex: 4, child: ProfileHoverEffect()),
                  ],
                ),
              ),
            Spacer(),
            Divider(height: 1, color: Colors.grey.shade800),
          ],
        );
      },
    );
  }

  Column _greetings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          width: isMobile ? Get.width : 200,
          child: DefaultTextStyle(
            style: GoogleFonts.beVietnamPro(
              color: kWhiteColor,
              fontWeight: FontWeight.w500,
              fontSize: isMobile ? 17 : 21,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts:
                  greetings.map((e) {
                    return FadeAnimatedText(
                      e,
                      duration: Duration(milliseconds: 1500),
                      fadeInEnd: 0.1,
                      fadeOutBegin: 0.9,
                    );
                  }).toList(),

              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ),

        Row(
          children: [
            Text(
              "I'm",
              style: GoogleFonts.beVietnamPro(
                color: kWhiteColor,
                fontSize: isMobile ? 32 : 46,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              " Sai Kiran",
              style: GoogleFonts.beVietnamPro(
                color: kWhiteColor,
                fontWeight: FontWeight.w600,
                fontSize: isMobile ? 32 : 46,
              ),
            ),
          ],
        ),
        SizedBox(
          width: isMobile ? Get.width * 0.9 : null,
          child: Text(
            "I write Flutter code that mostly works—and when it doesn't, I pretend it's a feature",
            style: GoogleFonts.beVietnamPro(
              color: kWhiteColor,
              fontWeight: FontWeight.w500,
              fontSize: isMobile ? 17 : 21,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileHoverEffect extends StatefulWidget {
  const ProfileHoverEffect({super.key});

  @override
  ProfileHoverEffectState createState() => ProfileHoverEffectState();
}

class ProfileHoverEffectState extends State<ProfileHoverEffect> {
  double getRandomNumber() {
    final Random random = Random();
    return (5 + random.nextInt(6)).toDouble();
  }

  final List<Offset> poppedPackagesOffsets = [
    Offset(Get.width * 0.07, (Get.height * 0.5) * 0.45), // top left
    Offset(-Get.width * 0.2, -(Get.height * 0.5) * 0.4), // top right
    Offset(Get.width * 0.11, -(Get.height * 0.5) * 0.6), // top center
  ];
  final List<Offset> poppedProjectOffsets = [
    Offset(-Get.width * 0.15, (Get.height * 0.5) * 0.3), // bottom left
    Offset(-Get.width * 0.12, -(Get.height * 0.5) * 0.65), // top center
    Offset(Get.width * 0.14, -(Get.height * 0.5) * 0.3), // bottom right
  ];

  final List<Offset> offsetsPackages = [
    Offset(-0, -0),
    Offset(0, 0),
    Offset(0, 0),
  ];

  final List projects = [
    "assets/logos/m2.png",
    "assets/logos/tc.png",
    "assets/logos/aezo.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Consumer<ProfileHoverController>(
        builder: (context, ProfileHoverController profileHoverController, _) {
          final bool hoveredProjects =
              profileHoverController.hoveringIndex == 1;
          final bool hovered = profileHoverController.hoveringIndex == 2;
          return Center(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                ...List.generate(3, (index) {
                  final PackageModel package = PackagesScreen.packages[index];
                  return AnimatedPositioned(
                    duration: Duration(milliseconds: 300),

                    curve: Curves.easeOut,
                    left:
                        (Get.height * 0.5) / 2 +
                        (hovered
                            ? poppedPackagesOffsets[index].dx
                            : offsetsPackages[index].dx),
                    top:
                        (Get.height * 0.5) / 2 +
                        (hovered
                            ? poppedPackagesOffsets[index].dy
                            : offsetsPackages[index].dy),
                    child: FloatingWidget(
                      direction: FloatingDirection.leftCenterToRightCenter,
                      horizontalSpace: getRandomNumber(),
                      verticalSpace: getRandomNumber(),

                      child: AnimatedScale(
                        scale: hovered ? 1.7 : 1.0,
                        duration: Duration(milliseconds: 300),
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey.shade800),
                          ),
                          width: Get.width * 0.07,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(package.banner),
                              SizedBox(height: 4),
                              Text(
                                package.name,
                                style: GoogleFonts.beVietnamPro(
                                  color: kWhiteColor,
                                  fontSize: 6,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                package.description,
                                style: GoogleFonts.beVietnamPro(
                                  color: kWhiteColor,
                                  fontSize: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                ...List.generate(3, (index) {
                  return AnimatedPositioned(
                    duration: Duration(milliseconds: 300),

                    curve: Curves.easeOut,
                    left:
                        (Get.height * 0.5) / 2 +
                        (hoveredProjects
                            ? poppedProjectOffsets[index].dx
                            : offsetsPackages[index].dx),
                    top:
                        (Get.height * 0.5) / 2 +
                        (hoveredProjects
                            ? poppedProjectOffsets[index].dy
                            : offsetsPackages[index].dy),
                    child: FloatingWidget(
                      direction: FloatingDirection.leftCenterToRightCenter,
                      horizontalSpace: getRandomNumber(),
                      verticalSpace: getRandomNumber(),

                      child: AnimatedScale(
                        scale: hoveredProjects ? 1.7 : 1.0,
                        duration: Duration(milliseconds: 300),
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: kBackgroundColor,
                            // borderRadius: BorderRadius.circular(4),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade700),
                          ),
                          width: Get.width * 0.05,
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                projects[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),

                // Main image with hover detection
                Container(
                  width: Get.height * 0.5,
                  height: Get.height * 0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "assets/images/profile.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
