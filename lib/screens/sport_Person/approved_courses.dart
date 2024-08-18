
import 'package:swimmast_movil/widgets/courses_p.dart';
import 'package:swimmast_movil/models/courseAvailable.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/widgets/courses_info_cards.dart';

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
      var response = await Dio().get(urlBack + 'course/swimmer/${idUser.toString()}/purchased/'); 
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
        back: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CoursesInfoCards(),
        ],
      ),
    );
  }

}


