import 'package:flutter/material.dart';
import 'package:huntsa_ecommerce_intro_page/constant/data_json.dart';
import 'package:huntsa_ecommerce_intro_page/pages/product_detail.dart';
import 'package:huntsa_ecommerce_intro_page/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("فروشگاه آنلاین مَمّد محسنی",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'sansMobile',
                    )),
                Row(
                  children: <Widget>[
                    InkWell(
                      enableFeedback: true,
                      onTap: () {},
                      child: Icon(LineIcons.search),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {},
                      enableFeedback: true,
                      child: Icon(LineIcons.shopping_cart),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 1, left: 20),
              child: Row(
                children: List.generate(dataItems.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          activMenu = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: activMenu == index
                                        ? primary
                                        : Colors.transparent,
                                    width: 2))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            menuItems[index],
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'sansMobile',
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
              children: List.generate(dataItems.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProcductDetailPage(
                              id: dataItems[index]['id'].toString(),
                              code: dataItems[index]['code'],
                              name: dataItems[index]['name'],
                              img: dataItems[index]['img'],
                              price: dataItems[index]['price'].toString(),
                              size: dataItems[index]['size'],
                              color: dataItems[index]['color'],
                            )));
              },
              child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: dataItems[index]['id'].toString(),
                      child: Container(
                        width: (size.width - 16) / 2,
                        height: (size.width - 16) / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              dataItems[index]['img'],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        dataItems[index]['name'],
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'sansMobile',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Text(
                        dataItems[0]['price'].toString() + " ریال",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'sansMobile',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          })),
        ],
      ),
    );
  }
}
