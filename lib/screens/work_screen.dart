import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/projetc_model.dart';
import 'package:portfolio/utils/colors.dart';

class WorkScreen extends StatelessWidget {
  WorkScreen({super.key});

  late bool isMobile;

  static List<ProjetcModel> projects = [
    ProjetcModel(
      name: "MoneyMinds",
      points: ["Flutter Web", "Dash Video Streaming", "Nester Navigation"],
      banner: "assets/logos/m2.png",
      description:
          "Money Minds is an educational platform designed to empower individuals with the skills, knowledge, and resources to build and grow their personal wealth. It offers expert-led training, practical business strategies, and a supportive community to help you unlock your financial potential. Whether you're looking to start a business, boost your income, or master financial literacy, Money Minds provides the tools and insights to accelerate your journey to financial freedom.",
      techStack: [
        "assets/techstack/flutter.png",
        "assets/techstack/dart.png",
        "assets/techstack/sentry.png",
        "assets/techstack/github.png",
        "assets/techstack/firebase.png",
      ],
    ),
    ProjetcModel(
      name: "TtuthCatcher",
      points: [
        "Built a custom camera module in Flutter to capture high-resolution photos",
        "Applied design thinking principles to transform Figma prototypes into intuitive",
        "Integrated In-App Purchases (IAP)",
      ],
      banner: "assets/logos/tc.png",
      description:
          "A blockchain-powered app that enables users to capture and verify authentic moments by minting them as NFTs, combating deepfakes and misinformation in real-time",
      techStack: [
        "assets/techstack/flutter.png",
        "assets/techstack/dart.png",
        "assets/techstack/github.png",
        "assets/techstack/firebase.png",
      ],
    ),
    ProjetcModel(
      name: "Aezo",
      points: [
        "Integrated Bubble.io as the backend platform",
        "Built custom UI components",
        "Applied performance optimization techniques",
      ],
      banner: "assets/logos/aezo.png",
      description:
          "Aezo is a platform tailored for trade associations, enabling streamlined member management, communication, and engagement through a responsive and customizable UI.",
      techStack: [
        "assets/techstack/flutter.png",
        "assets/techstack/dart.png",
        "assets/techstack/bubbble.png",
        "assets/techstack/github.png",
        "assets/techstack/firebase.png",
      ],
    ),
    ProjetcModel(
      name: "Aezo",
      points: ["Flutter Web", "Dash Video Streaming", "Nester Navigation"],
      banner: "assets/logos/aezo.png",
      description:
          "Money Minds is an educational platform designed to empower individuals with the skills, knowledge, and resources to build and grow their personal wealth. It offers expert-led training, practical business strategies, and a supportive community to help you unlock your financial potential. Whether you're looking to start a business, boost your income, or master financial literacy, Money Minds provides the tools and insights to accelerate your journey to financial freedom.",
      techStack: [
        "assets/techstack/flutter.png",
        "assets/techstack/dart.png",
        "assets/techstack/sentry.png",
        "assets/techstack/github.png",
        "assets/techstack/firebase.png",
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        isMobile = constraints.maxWidth < 600;
        return Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 16 : Get.width * 0.13,
                ),
                height: Get.height,
                color: kBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: isMobile ? 16 : Get.height * 0.1),
                    Text(
                      "Projects",
                      style: GoogleFonts.beVietnamPro(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
                      ),
                    ),
                    SizedBox(height: isMobile ? 16 : Get.height * 0.05),
                    Expanded(
                      child: GridView.builder(
                        itemCount: projects.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: isMobile ? 12 : 24,
                          crossAxisSpacing: isMobile ? 12 : 24,
                          crossAxisCount: isMobile ? 1 : 3,
                          childAspectRatio: isMobile ? 1.6 : 1.4,
                        ),
                        itemBuilder: (context, index) {
                          return ProjectCard(project: projects[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 1, color: Colors.grey.shade800),
          ],
        );
      },
    );
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});

  final ProjetcModel project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        isHovered = true;
        setState(() {});
      },
      onExit: (event) {
        isHovered = false;
        setState(() {});
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            top: isHovered ? -35 : 0,
            right: isHovered ? -10 : 0,
            bottom: 0,
            left: 10,
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),

                border: Border.all(color: kPrimaryColor, width: 1),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            bottom: isHovered ? 10 : 0,
            left: isHovered ? -10 : 0,
            top: 0,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: kPrimaryColor, width: 1),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            top: isHovered ? -20 : 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade800),
                borderRadius: BorderRadius.circular(4),
                color: kBackgroundColor,
              ),
              margin: EdgeInsets.only(bottom: isHovered ? 20 : 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: kBackgroundColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey.shade800),
                              ),
                              width: Get.width * 0.035,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.asset(widget.project.banner),
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              widget.project.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.beVietnamPro(
                                color: kWhiteColor,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          widget.project.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.beVietnamPro(
                            color: kWhiteColor,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              widget.project.points
                                  .map(
                                    (e) => Row(
                                      children: [
                                        Icon(
                                          Icons.circle_outlined,
                                          size: 14,
                                          color: kPrimaryColor,
                                        ),
                                        SizedBox(width: 8),
                                        Flexible(
                                          child: Text(
                                            e,
                                            maxLines: 1,

                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.beVietnamPro(
                                              color: kWhiteColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(color: kBackgroundColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          widget.project.techStack
                              .map((e) => Image.asset(e, height: 20, width: 20))
                              .toList(),
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
