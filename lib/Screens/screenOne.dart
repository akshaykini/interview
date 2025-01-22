import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:interview/MODEL/dataModel.dart';
import 'package:interview/Network/apiCall.dart';
import 'package:interview/Screens/screenTwo.dart';

class Screenone extends StatefulWidget {
  const Screenone({super.key});

  @override
  State<Screenone> createState() => _ScreenoneState();
}

class _ScreenoneState extends State<Screenone> {
  DataModel model = DataModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();

    // model = Apicall().model;
  }

  getdata() async {
    model = await Apicall().api();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.4),
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text("Article List"),
          backgroundColor: Colors.grey.withOpacity(0.4),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: model.articles?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Screentwo(
                        dataModel: model,
                        index: index,
                      );
                    },
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "${model.articles?[index].urlToImage}",
                                fit: BoxFit.fill,
                                height: 100,
                                width: 100,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.redAccent,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Title :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    "${model.articles?[index].title == null ? "Please Wait" : model.articles?[index].title}",
                                  ),
                                  Text("Published At :",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    "${model.articles?[index].publishedAt == null ? "Please Wait" : model.articles?[index].publishedAt}",
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
