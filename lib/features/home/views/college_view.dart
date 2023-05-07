import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:mlrcc/common/app_bar.dart';
import 'package:mlrcc/constants/ui_constants.dart';
import 'package:mlrcc/theme/pallete.dart';

class CollegeView extends StatefulWidget {
  const CollegeView({Key? key}) : super(key: key);

  @override
  State<CollegeView> createState() => _CollegeViewState();
}

class _CollegeViewState extends State<CollegeView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(title: "About Campus"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: size.height*0.15,
                      width: size.width*0.85,
                      child: Text("MLR Institute of Technology is known for its integrated curriculum with equal importance to academics, employable skills & sports. MLR Institute of Technology (MLRIT) is located at Dundigal, Hyderabad, Telangana, India. The institution was started in 2005 by the KMR Education Trust, headed by Mr. Marri Laxman Reddy.", style: nbSubHeading.copyWith(fontWeight: FontWeight.w400, fontSize: 14),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Departments", style: largeHeading2,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: size.height*0.55,
                      child: const DepartmentScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




class Department {
  final String name;
  final String url;

  Department(this.name, this.url);
}

List<Department> departments = [
  Department('Information Technology', 'https://mlrit.ac.in/it/'),
  Department('Freshman Engineering', 'https://mlrit.ac.in/freshman/'),
  Department('Computer Science', 'https://mlrit.ac.in/computer-science-engineering/'),
  Department('Electrical Engineering', 'https://www.example.com/eee'),
  Department('Mechanical Engineering', 'https://mlrit.ac.in/mechanical-engineering/'),
  Department('Artificial Intelligence And Machine Learning', 'https://mlrit.ac.in/ai-ml/'),
  Department('CSE – Data Science', 'https://mlrit.ac.in/cse-ds/'),
  Department('CSE-Cyber Security', 'https://mlrit.ac.in/cse-cs/'),
  

];

class DepartmentCard extends StatelessWidget {
  final Department department;

  const DepartmentCard(this.department, {super.key});

  void _launchURL() async {
    await launchUrl(Uri.parse(department.url));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(department.name),
        subtitle: Text(department.url),
        onTap: _launchURL,
      ),
    );
  }
}

class DepartmentScreen extends StatelessWidget {
  const DepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: departments.length,
        itemBuilder: (BuildContext context, int index) {
          return DepartmentCard(departments[index]);
        },
    );
  }
}

