import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mlrcc/common/app_bar.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/core/utils.dart';
import 'package:mlrcc/features/user/controller/user_controller.dart';
import 'package:mlrcc/theme/pallete.dart';

class InsertUserDetailsView extends ConsumerStatefulWidget {
  final String uid;
  final String name;
  final String email;
  final String imageUrl;
  static route(uid, name, email, imageUrl) => MaterialPageRoute(
        builder: (context) => InsertUserDetailsView(
          uid: uid,
          name: name,
          email: email,
          imageUrl: imageUrl,
        ),
      );
  const InsertUserDetailsView(
      {super.key,
      required this.uid,
      required this.name,
      required this.email,
      required this.imageUrl});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InsertUserDetailsViewState();
}

class _InsertUserDetailsViewState extends ConsumerState<InsertUserDetailsView> {
  // create controller for textfield
  final phoneNumber = TextEditingController();
  final rollno = TextEditingController();

  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Pallete.accentColor,
    ),
    borderRadius: BorderRadius.circular(10),
  );
  @override
  Widget build(BuildContext context) {
    var branch = 'Enter your branch';
    var semester = 1;
    var year = 1;
    var section = 'Enter your section';
    final size = MediaQuery.of(context).size;
    return Container(
      color: Pallete.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Pallete.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter your details',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    ],
                    controller: phoneNumber,
                    decoration: InputDecoration(
                      border: border,
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                      prefixIcon: LineIcon.mobilePhone(),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextField(
                    inputFormatters: [],
                    controller: rollno,
                    decoration: InputDecoration(
                      border: border,
                      labelText: 'Roll Number',
                      hintText: 'Enter your roll number',
                      prefixIcon: LineIcon.userGraduate(),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  DropdownButtonFormField(
                    menuMaxHeight: size.height * 0.3,
                    decoration: InputDecoration(
                      border: border,
                      labelText: 'Branch',
                      hintText: 'Select your branch',
                      prefixIcon: LineIcon.book(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        branch = value.toString();
                      });
                    },
                    value: branch,
                    items: UIConstants.branchDetails,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: border,
                      labelText: 'Section',
                      hintText: 'Select your section',
                      prefixIcon: LineIcon.penFancy(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        section = value.toString();
                      });
                    },
                    value: section,
                    items: UIConstants.sectionDetails,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: border,
                      labelText: 'Year',
                      hintText: 'Select your year',
                      prefixIcon: LineIcon.calendar(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        year = value;
                      });
                    },
                    value: year,
                    items: UIConstants.yearDetails,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: border,
                      labelText: 'Semester',
                      hintText: 'Select your semester',
                      prefixIcon: LineIcon.cookie(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        semester = value;
                      });
                    },
                    value: semester,
                    items: UIConstants.semesterDetails,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    height: size.height * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        ref.read(userControllerProvider.notifier).saveUserData(
                            context: context,
                            uid: widget.uid,
                            name: widget.name,
                            email: widget.email,
                            rno: rollno.text.toUpperCase(),
                            branch: branch,
                            semester: semester,
                            year: year,
                            phone: phoneNumber.text,
                            section: section,
                            imageUrl: widget.imageUrl);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 30,
                        primary: Pallete.accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Submit your details'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
