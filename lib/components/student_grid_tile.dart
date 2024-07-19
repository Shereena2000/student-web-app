import 'package:flutter/material.dart';
import 'package:student_record/components/add_detailes.dart';
import 'package:student_record/components/view_details.dart';
import 'package:student_record/constants/const.dart';
import 'package:student_record/db/functions/add_to_hive.dart';
import 'package:student_record/db/model/data.dart';

class StudentGridTile extends StatelessWidget {
  final StudentData student;
  const StudentGridTile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        viewDialoge(context, student);
      },
      child: Container(
        decoration: BoxDecoration(
            color: tealColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: student.imagePath != null
                    ? Image.memory(
                        student.imagePath!,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/avathara.jpeg',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
              ),
              Text(
                student.name,
                style: normalText,
              ),
              Text(
                student.admisstionNo,
                style: subText,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        showAddStudentDialog(context, student: student);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: whiteColor,
                      )),
                  IconButton(
                      onPressed: () {
                        if (student.id != null) {
                          AddStudentData.deletData(student.id!);
                        } 
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: whiteColor,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
