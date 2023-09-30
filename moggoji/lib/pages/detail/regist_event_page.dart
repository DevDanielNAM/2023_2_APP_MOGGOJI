import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moggoji/models/schedule.dart';
import 'package:moggoji/pages/main_screen.dart';
import 'package:moggoji/service/globals.dart';

import 'package:http/http.dart' as http;

class RegistEventPage extends StatefulWidget {
  const RegistEventPage({super.key});

  @override
  State<RegistEventPage> createState() => _RegistEventPageState();
}

class _RegistEventPageState extends State<RegistEventPage> {

  final _registKey = GlobalKey<FormState>();
  Schedule schedule = Schedule(
      number: 0,
      title: '',
      writer: 'sonny',
      location: '',
      date: '',
      content: '',
      fee: 0);

  Future save() async {
    var res = await http.post(Uri.parse(addTask),
        headers: headers,
        body: json.encode({
          'title': schedule.title,
          'writer': schedule.writer,
          'location': schedule.location,
          'date': schedule.date,
          'content': schedule.content,
          'fee': schedule.fee
        }));

    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "제목",
                          hintText: "ex) 개강총회",
                          hintStyle: TextStyle(color: Colors.grey),
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                          //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      /* 추후 날짜 선택으로 변경 */
                      child: TextFormField(
                        // inputFormatters: [I],
                        keyboardType: TextInputType.datetime,
                        // onTap: (){
                        //   showDatePicker(context: context,
                        //       initialDate: DateTime.now(),
                        //       firstDate: DateTime(2000),
                        //       lastDate: DateTime.now(),
                        //   ).then((selectedDate){
                        //     setState(() {
                        //       _selectedDate = selectedDate;
                        //     });
                        //   });
                        // },
                        decoration: InputDecoration(
                            labelText: "날짜",
                            hintText: "ex) 2023-09-08",
                            hintStyle: TextStyle(color: Colors.grey),
                          //   enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          //   ),
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "장소",
                            hintText: "ex) 누리관",
                            hintStyle: TextStyle(color: Colors.grey),
                          //   enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          //   ),
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "내용",
                            hintText: "ex) 개강총회 및 팀빌딩",
                            hintStyle: TextStyle(color: Colors.grey),
                          //   enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          //   ),
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "금액",
                            hintText: "ex) 0 or 5000 or 열정",
                            hintStyle: TextStyle(color: Colors.grey),
                          //   enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          //   ),
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 78.0),
                child: Text("행사 등록"),
              ),
              TextButton(
                onPressed: () {
                  save();

                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("행사 등록이 완료 되었습니다."),
                            content: Text("메인 페이지로 이동합니다."),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MainScreen()));
                                  },
                                  child: Text("확인"))
                            ],
                          ));
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => MainScreen()));
                },
                child: Text(
                  "등록",
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // decoration: BoxDecoration(
            //     color: Color(0xFFFFFFFF),
            //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //     boxShadow: [
            //       BoxShadow(
            //           color: Colors.deepPurpleAccent.shade100,
            //           blurRadius: 10,
            //           offset: Offset(2.0,2.0)
            //       )
            //     ]
            // ),
            margin: EdgeInsetsDirectional.symmetric(
                horizontal: 20.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _registKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextFormField(
                          controller:
                              TextEditingController(text: schedule.title),
                          onChanged: (val) {
                            schedule.title = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Title is Empty!";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            labelText: "제목",
                            hintText: "ex) 개강총회",
                            hintStyle: TextStyle(color: Colors.grey),
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                            //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // ),
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        /* 추후 날짜 선택으로 변경 */
                        child: TextFormField(
                          controller:
                              TextEditingController(text: schedule.date),
                          onChanged: (val) {
                            schedule.date = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Date is Empty!";
                            }
                            return "";
                          },
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            labelText: "날짜",
                            hintText: "ex) 2023-09-08",
                            hintStyle: TextStyle(color: Colors.grey),
                            //   enabledBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                            //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            //   ),
                            //   border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextFormField(
                          controller:
                              TextEditingController(text: schedule.location),
                          onChanged: (val) {
                            schedule.location = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "location is Empty!";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            labelText: "장소",
                            hintText: "ex) 누리관",
                            hintStyle: TextStyle(color: Colors.grey),
                            //   enabledBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                            //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            //   ),
                            //   border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextFormField(
                          controller:
                              TextEditingController(text: schedule.content),
                          onChanged: (val) {
                            schedule.content = val;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Content is Empty!";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            labelText: "내용",
                            hintText: "ex) 개강총회 및 팀빌딩",
                            hintStyle: TextStyle(color: Colors.grey),
                            //   enabledBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                            //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            //   ),
                            //   border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: TextFormField(
                          controller: TextEditingController(
                              text: schedule.fee.toString()),
                          onChanged: (val) {
                            schedule.fee = int.tryParse(val) ??
                                0; // 문자열을 int로 변환한 후 실패하면 기본값을 0으로 설정
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "fee is Empty!";
                            }
                            return "";
                          },
                          decoration: InputDecoration(
                            labelText: "금액",
                            hintText: "ex) 0 or 5000 or 열정",
                            hintStyle: TextStyle(color: Colors.grey),
                            //   enabledBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(color: Colors.deepPurpleAccent.shade700),
                            //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            //   ),
                            //   border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //     alignment: Alignment.center,
                //     margin: EdgeInsetsDirectional.symmetric(vertical: 20.0),
                //     child: SizedBox(
                //       width: 200,
                //       height: 50,
                //       child: ElevatedButton(
                //           onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));},
                //           style: ButtonStyle(
                //               shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(10)
                //               )
                //               )
                //           ),
                //           child: Text("등록하기", style: TextStyle(
                //               fontSize: 18
                //               ),
                //           )
                //       ),
                //     )
                // )
              ],
            ),
          ),
        ));
  }
}
