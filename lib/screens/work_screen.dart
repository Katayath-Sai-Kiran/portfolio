import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/colors.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.13),
            height: Get.height,
            color: kBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.1),
                Text(
                  "Projects",
                  style: GoogleFonts.beVietnamPro(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 21,
                  ),
                ),
                SizedBox(height: Get.height * 0.05),
                Expanded(
                  child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      crossAxisCount: 3,
                      childAspectRatio: 1.6,
                    ),
                    itemBuilder: (context, index) {
                      return ProjectCard();
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
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key});

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
          if (isHovered)
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

                  border: Border.all(color: kPrimaryColor, width: 2),
                ),
              ),
            ),
          if (isHovered)
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              bottom: isHovered ? 10 : 0,
              left: isHovered ? -10 : 0,
              top: 0,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),

                  border: Border.all(color: kPrimaryColor, width: 2),
                ),
              ),
            ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: isHovered ? -20 : 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade800),
                borderRadius: BorderRadius.circular(4),
                color: kBackgroundColor,
              ),
              margin: EdgeInsets.only(bottom: isHovered ? 20 : 0),
            ),
          ),
        ],
      ),
    );
  }
}
