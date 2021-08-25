import 'package:flutter/material.dart';
import 'package:shubhro_project/Const/constants.dart';
import 'package:shubhro_project/GQL/client.dart';
import 'package:shubhro_project/misc/widgets.dart';
import 'package:shubhro_project/model/datamodel.dart';

class Task2 extends StatefulWidget {
  @override
  _Task2State createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  ScrollController? _scrollController;
  int skip = 0;
  int maxcount = 1000;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController!.position.atEdge) {
          if (_scrollController!.position.pixels != 0) {
            Future.delayed(Duration(seconds: 2));
            if (skip < maxcount - 4) {
              setState(() {
                skip += 4;
                print(skip);
              });
              _scrollController!.animateTo(0,
                  duration: Duration(seconds: 3), curve: Curves.linear);
            }

            // You're at the top.
            print("at bottom");
          } else {
            print("at top");
          }
        }
      });
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'FLIGHTLOCAL',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          child: FutureBuilder(
            future: readRepositories(skip, 4),
            builder: (context, AsyncSnapshot<Datamodel> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                maxcount = snapshot.data!.result.count;
                return ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.result.packages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '${snapshot.data!.result.count} Avaiable holidays',
                            style: kbasetxt.copyWith(
                                color: kMainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        );
                      }
                      return PackageCard(
                          package: snapshot.data!.result.packages[index - 1]);
                    });
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
