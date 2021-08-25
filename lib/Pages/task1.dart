import 'package:flutter/material.dart';
import 'package:shubhro_project/Const/constants.dart';
import 'package:shubhro_project/GQL/client.dart';
import 'package:shubhro_project/misc/widgets.dart';
import 'package:shubhro_project/model/datamodel.dart';

class Task1 extends StatelessWidget {
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
            future: readRepositories(0, 10),
            builder: (context, AsyncSnapshot<Datamodel> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
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
