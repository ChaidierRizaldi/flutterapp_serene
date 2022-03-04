// @dart=2.7
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_equal_for_default_values, missing_return, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutterapp_serene/Models/space.dart';
import 'package:flutterapp_serene/Models/tips.dart';
import 'package:flutterapp_serene/Providers/space_provider.dart';
import 'package:flutterapp_serene/Widgets/bottom_navbar_item.dart';
import 'package:flutterapp_serene/Widgets/city_card.dart';
import 'package:flutterapp_serene/Widgets/space_card.dart';
import 'package:flutterapp_serene/Widgets/tips_card.dart';
import 'package:flutterapp_serene/theme.dart';
import 'package:provider/provider.dart';
import '../Widgets/city_card.dart';
import '../Models/city.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            // NOTE: TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: secondaryTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 24),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/city1.png',
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/city2.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/city3.png',
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      id: 4,
                      name: 'Palembang',
                      imageUrl: 'assets/city4.png',
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/city5.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      id: 6,
                      name: 'Bogor',
                      imageUrl: 'assets/city6.png',
                    ),
                  ),
                  SizedBox(width: 24),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      imageUrl: 'assets/tips1.png',
                      title: 'City Guidelines',
                      updateAt: '20 Apr',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      imageUrl: 'assets/tips2.png',
                      title: 'Jakarta Fairship',
                      updateAt: '11 Dec',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: creamColor,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomnavbarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomnavbarItem(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomnavbarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomnavbarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
