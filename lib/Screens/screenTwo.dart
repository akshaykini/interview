import 'package:flutter/material.dart';
import 'package:interview/MODEL/dataModel.dart';
import 'package:url_launcher/url_launcher.dart';

class Screentwo extends StatefulWidget {
  DataModel? dataModel;
  int? index;
  Screentwo({super.key, this.dataModel, this.index});

  @override
  State<Screentwo> createState() => _ScreentwoState();
}

class _ScreentwoState extends State<Screentwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.4),
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text("Detailed Info"),
          backgroundColor: Colors.grey.withOpacity(0.4),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "${widget.dataModel?.articles?[widget.index!].urlToImage} ",
                      fit: BoxFit.cover,
                      height: 100,
                      width: 300,
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
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Title :",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              "${widget.dataModel?.articles?[widget.index!].title == null ? "Please Wait" : widget.dataModel?.articles?[widget.index!].title}",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Description At :",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                              "${widget.dataModel?.articles?[widget.index!].description == null ? "Please Wait" : widget.dataModel?.articles?[widget.index!].description}",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Uri url = Uri.parse(
                                    "${widget.dataModel?.articles?[widget.index!].url.toString()}");

                                launchUrl(url);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.4)),
                                child: Text(
                                  "Open URL",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
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
      )),
    );
  }
}
