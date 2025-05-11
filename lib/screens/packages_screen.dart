import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/package_model.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  static List<PackageModel> packages = [
    PackageModel(
      description:
          "The Animated Dropdown Search package is a customizable Flutter widget that allows users to search and select from a list of options with a smooth animation. ",
      name: "animated_dropdown_search_codespark",
      link: "https://pub.dev/packages/animated_dropdown_search_codespark",
      banner: "assets/packages/advanced_text_input_formatters_codespark.png",
      downloads: 1,
      pubPoints: 264,
    ),
    PackageModel(
      description:
          "HighlightText is a Flutter widget that highlights specific parts of a given text. It supports case-sensitive searches, multiple queries, and regular expressions for advanced matching scenarios.",
      name: "text_highlight_codespark",
      link: "https://pub.dev/packages/text_highlight_codespark",
      banner: "assets/packages/text_highlight_codespark.png",
      downloads: 53,
      pubPoints: 160,
    ),
    PackageModel(
      description:
          "A collection of custom TextInputFormatters designed to enhance and control user input in Flutter apps.",
      name: "advanced_text_input_formatters_codespark",
      link: "https://pub.dev/packages/advanced_text_input_formatters_codespark",
      banner: "assets/packages/advanced_text_input_formatters_codespark.png",
      downloads: 1,
      pubPoints: 160,
    ),
    PackageModel(
      description:
          "A simple yet powerful Dart package that allows you to compare two strings and determine the match percentage between them using multiple algorithms, including the Levenshtein distance and Jaro-Winkler distance.",
      name: "text_comparison_score_codespark",
      link: "https://pub.dev/packages/text_comparison_score_codespark",
      banner: "assets/packages/text_comparison_score_codespark.png",
      downloads: 1,
      pubPoints: 160,
    ),
    PackageModel(
      description:
          "A simple yet powerful Dart package that allows you to compare two strings and determine the match percentage between them using multiple algorithms, including the Levenshtein distance and Jaro-Winkler distance.",
      name: "read_more_codespark",
      link: "https://pub.dev/packages/read_more_codespark",
      banner: "assets/packages/read_more_codespark.png",
      downloads: 51,
      pubPoints: 160,
    ),
  ];

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
                  "Packages (pub.dev)",
                  style: GoogleFonts.beVietnamPro(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 21,
                  ),
                ),
                SizedBox(height: Get.height * 0.05),
                Expanded(
                  child: GridView.builder(
                    itemCount: packages.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 18,
                      crossAxisCount: 3,
                      childAspectRatio: 1.6,
                    ),
                    itemBuilder: (context, index) {
                      return PackageCard(package: packages[index]);
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

class PackageCard extends StatefulWidget {
  const PackageCard({super.key, required this.package});

  final PackageModel package;

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
  bool isHovered = false;
  Color flutterBlue = Color(0xFF02569B);

  @override
  Widget build(BuildContext context) {
    final PackageModel package = widget.package;
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

                border: Border.all(color: Colors.grey.shade800, width: 1),
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

                border: Border.all(color: Colors.grey.shade800, width: 1),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: isHovered ? -20 : 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () async {
                if (await canLaunchUrl(Uri.parse(package.link))) {
                  launchUrl(Uri.parse(package.link));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(4),
                  color: kBackgroundColor,
                ),
                margin: EdgeInsets.only(bottom: isHovered ? 20 : 0),
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Image.asset(package.banner),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kBackgroundColor.withAlpha(150),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.download,
                                    color: kWhiteColor,
                                    size: 14,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    package.downloads.toString(),
                                    style: GoogleFonts.roboto(
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        package.name,
                        style: GoogleFonts.beVietnamPro(color: kWhiteColor),
                      ),

                      SizedBox(height: 10),
                      Text(
                        package.description,
                        style: GoogleFonts.beVietnamPro(
                          color: kWhiteColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
