import 'package:flutter/material.dart';
import 'package:swimmast_movil/widgets/courses_p.dart';
import 'package:swimmast_movil/models/courseAvailable.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';

class ApprovedCourses extends StatefulWidget {
  const ApprovedCourses({super.key});

  @override
  State<ApprovedCourses> createState() => _ApprovedCoursesState();
}

class _ApprovedCoursesState extends State<ApprovedCourses> {

  List<CourseAvailable>? courses;
  
  @override
  void initState() {
    super.initState();
    getCourses();
  }

  Future<void> getCourses() async {
    try{
      var response = await Dio().get(urlBack + 'course/swimmer/2/purchased/'); 
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        courses = data.map((json) => CourseAvailable.fromJson(json)).toList();
        setState(() {}); 
      }
    }
    catch (e) {
      if (e is DioException) {
        print('Status Code: ${e.response?.statusCode}');
        print('Data: ${e.response?.data}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cursos Aprobados", 
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          if(courses != null && courses!.length >0)
            Expanded(
              child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: courses!.length,
              itemBuilder: (context, index) => CoursesP(
                name: courses![index].name.toString(),
                description: courses![index].description.toString(),
                price: courses![index].price.toString(),
                startDate: courses![index].startDate.year.toString() + "-" + courses![index].startDate.month.toString() + "-" + courses![index].startDate.day.toString(),
                endDate: courses![index].dueDate.year.toString() + "-" + courses![index].dueDate.month.toString() + "-" + courses![index].dueDate.day.toString(),
              )
              )
            ),
          Center(
            child: Text('No hay paquetes aprobados')
          )
        ],
      ),
    );
  }

}
