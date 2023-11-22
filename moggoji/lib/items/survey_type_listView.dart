import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/survey.dart';
import '../service/globals.dart';

class SurveyTypeListView extends StatefulWidget {
  final int surveyType;

  const SurveyTypeListView({Key? key, required this.surveyType})
      : super(key: key);

  @override
  State<SurveyTypeListView> createState() => _SurveyTypeListViewState();
}

class _SurveyTypeListViewState extends State<SurveyTypeListView> {
  List<Survey> surveysByType = [];

  @override
  void initState() {
    super.initState();
    fetchSurveys();
  }

  Future<void> fetchSurveys() async {
    String resultSurveyByTypeURL = '$findSurveyByTypeURL/${widget.surveyType}';

    final response = await http.get(Uri.parse(resultSurveyByTypeURL));

    if (response.statusCode == 200) {

      final String responseBody = utf8.decode(response.bodyBytes);
      final List<dynamic> data = jsonDecode(responseBody);

      print(response.body);
      setState(() {
        surveysByType = data.map((json) => Survey.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load surveys');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        child: ListView.builder(
          physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          shrinkWrap: true,
          itemCount: surveysByType.length,
          itemBuilder: (BuildContext context, int index) {
            final survey = surveysByType[index];

            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => DetailNoticePage(
                //       title: notice.title,
                //       category: notice.category,
                //       content: notice.content,
                //       date: notice.date,
                //       writer: notice.writer,
                //     ))
                // );
              },
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        color: Colors.blueAccent.shade100,
                        offset: Offset(3, 5),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://avatars.githubusercontent.com/u/39268032?s=200&v=4',
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                survey.surveyTitle,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 30),
                              Text(survey.surveyCreator)
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                survey.surveyType == 1? "OX 설문조사" : "만족도 설문조사",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
