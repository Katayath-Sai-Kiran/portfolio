import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});
  late bool isMobile;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        isMobile = constraints.maxWidth < 600;
        return Container(
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
                "Conatct",
                style: GoogleFonts.beVietnamPro(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 21,
                ),
              ),
              SizedBox(height: isMobile ? 16 : Get.height * 0.07),

              if (isMobile)
                Column(
                  children: [
                    Text(
                      'Got an idea? Or just stalking my work? Either way, say hi!',
                      style: GoogleFonts.beVietnamPro(
                        color: kWhiteColor,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Whether it’s a million-dollar app idea, a freelance gig, or a simple “Hey, I love your work!” — I’m all ears (and keyboards).',
                      style: GoogleFonts.beVietnamPro(
                        color: kWhiteColor,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    _formWidget(),
                  ],
                ),
              if (!isMobile)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Column(
                        children: [
                          Text(
                            'Got an idea? Or just stalking my work? Either way, say hi!',
                            style: GoogleFonts.beVietnamPro(
                              color: kWhiteColor,
                              fontSize: 26,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Whether it’s a million-dollar app idea, a freelance gig, or a simple “Hey, I love your work!” — I’m all ears (and keyboards).',
                            style: GoogleFonts.beVietnamPro(
                              color: kWhiteColor,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 2),
                    Expanded(flex: 5, child: _formWidget()),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Column _formWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What should I call you?",
          style: GoogleFonts.beVietnamPro(color: kWhiteColor, fontSize: 19),
        ),
        SizedBox(height: 12),
        TextFormField(
          style: GoogleFonts.beVietnamPro(color: kWhiteColor, fontSize: 14),
          cursorColor: kPrimaryColor,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: "Iron Man, Elon, or just Alex...",
            hintStyle: GoogleFonts.beVietnamPro(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade800,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(height: 24),
        Text(
          "Where can I reach you?",
          style: GoogleFonts.beVietnamPro(color: kWhiteColor, fontSize: 19),
        ),
        SizedBox(height: 12),
        TextFormField(
          style: GoogleFonts.beVietnamPro(color: kWhiteColor, fontSize: 14),
          cursorColor: kPrimaryColor,
          textInputAction: TextInputAction.next,

          decoration: InputDecoration(
            hintText: "Don't worry, no spam. Pinky promise.",
            hintStyle: GoogleFonts.beVietnamPro(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade800,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(height: 24),
        Text(
          "Spill your thoughts here",
          style: GoogleFonts.beVietnamPro(color: kWhiteColor, fontSize: 19),
        ),
        SizedBox(height: 12),
        TextFormField(
          maxLines: 5,
          style: GoogleFonts.beVietnamPro(color: kWhiteColor, fontSize: 14),
          textInputAction: TextInputAction.newline,

          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            hintText: "App idea? Bug report? Existential crisis?",

            hintStyle: GoogleFonts.beVietnamPro(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey.shade800,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        SizedBox(height: 32),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(Get.width, 56),
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Text(
            "Launch Message 🚀",
            style: GoogleFonts.beVietnamPro(color: kWhiteColor),
          ),
        ),
      ],
    );
  }
}

class FunnyContactPage extends StatelessWidget {
  const FunnyContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Got an idea? Or just stalking my work? Either way, say hi!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Whether it’s a million-dollar app idea, a freelance gig, or a simple “Hey, I love your work!” — I’m all ears (and keyboards).',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            const ContactForm(),
            const SizedBox(height: 40),
            const Text(
              'Other ways to say hi:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.email),
                const SizedBox(width: 8),
                Text('me@yourdomain.com'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.link),
                const SizedBox(width: 8),
                Text('LinkedIn / GitHub etc.'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name (or Alias)'),
            onChanged: (val) => setState(() => name = val),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            onChanged: (val) => setState(() => email = val),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Message'),
            maxLines: 4,
            onChanged: (val) => setState(() => message = val),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Message sent! (or pigeon released)'),
                  ),
                );
              }
            },
            child: const Text('Send Carrier Pigeon'),
          ),
        ],
      ),
    );
  }
}
