import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shubhro_project/Const/constants.dart';
import 'package:shubhro_project/model/datamodel.dart';

class PackageCard extends StatelessWidget {
  final Package package;
  const PackageCard({Key? key, required this.package}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: double.infinity,
            height: 200,
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.network(
                              package.thumbnail,
                              fit: BoxFit.fill,
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  package.title,
                                  style: kbasetxt.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  package.description,
                                  maxLines: 3,
                                  style: kbasetxt.copyWith(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12),
                                ),
                                Text(
                                  package.durationText,
                                  style: kbasetxt.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                                Text(
                                  package.loyaltyPointText,
                                  style: kbasetxt.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: kMainColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Includes:',
                                    style: kbasetxt.copyWith(
                                        color: kHighlightColor,
                                        fontWeight: FontWeight.w100,
                                        fontSize: 10),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: package.amenities.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: SvgPicture.network(
                                          package.amenities[index].icon,
                                          color: kHighlightColor,
                                          height: 12,
                                          placeholderBuilder: (BuildContext
                                                  context) =>
                                              Container(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child:
                                                      const CircularProgressIndicator()),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Starts From",
                                style: kbasetxt.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 10),
                              ),
                              Text(
                                '‎৳ ${package.startingPrice}',
                                style: kbasetxt.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
