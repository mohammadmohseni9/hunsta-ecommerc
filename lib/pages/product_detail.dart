import 'package:flutter/material.dart';
import 'package:huntsa_ecommerce_intro_page/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class ProcductDetailPage extends StatefulWidget {
  final String id;
  final String name;
  final String code;
  final String price;
  final String img;
  final List size;
  final List color;

  const ProcductDetailPage(
      {Key key,
      this.id,
      this.name,
      this.code,
      this.price,
      this.img,
      this.size,
      this.color})
      : super(key: key);
  @override
  _ProcductDetailPageState createState() => _ProcductDetailPageState();
}

class _ProcductDetailPageState extends State<ProcductDetailPage> {
  int activeSize = 0;
  int activeColor = 0;
  String activeImg = '';
  int qty = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activeImg = widget.img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      child: FlatButton(
        color: primary,
        onPressed: () {},
        child: Text(
          "افزودن به سبد خرید",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontFamily: 'sansMobile',
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_forward_ios)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 2,
              child: Hero(
                tag: widget.id.toString(),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                    (activeImg),
                  ))),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "نام محصول : ",
                    style: TextStyle(
                        fontFamily: 'sansMobile', height: 1.5, fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          fontFamily: 'sansMobile', height: 1.5, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "کد : ",
                    style: TextStyle(
                        fontFamily: 'sansMobile', height: 1.5, fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      widget.code,
                      style: TextStyle(
                          fontFamily: 'sansMobile', height: 1.5, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "قیمت : ",
                    style: TextStyle(
                        fontFamily: 'sansMobile', height: 1.5, fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      widget.price + " تومان ",
                      style: TextStyle(
                          fontFamily: 'sansMobile', height: 1.5, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "سایز : ",
                    style: TextStyle(
                        fontFamily: 'sansMobile', height: 1.5, fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Wrap(
                      children: List.generate(widget.size.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            enableFeedback: false,
                            onTap: () {
                              setState(() {
                                activeSize = widget.size[index]['id'];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: activeSize == widget.size[index]['id']
                                      ? Colors.green
                                      : Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  widget.size[index]['value'],
                                  style: TextStyle(fontSize: 16, height: 1.5),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "رنگ : ",
                    style: TextStyle(
                        fontFamily: 'sansMobile', height: 1.5, fontSize: 17),
                  ),
                  Flexible(
                    child: Wrap(
                      children: List.generate(widget.color.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            enableFeedback: false,
                            onTap: () {
                              setState(() {
                                activeColor = widget.color[index]['id'];
                                activeImg = widget.color[index]['value'];
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      widget.color[index]['value'],
                                    ),
                                    fit: BoxFit.cover),
                                border: Border.all(
                                  width: 2,
                                  color:
                                      activeColor == widget.color[index]['id']
                                          ? Colors.green
                                          : Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "تعداد : ",
                    style: TextStyle(
                        fontFamily: 'sansMobile', height: 1.5, fontSize: 17),
                  ),
                  Flexible(
                      child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          if (qty > 1) {
                            setState(() {
                              qty--;
                            });
                          }
                        },
                        child: Container(
                          width: 30,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: black.withOpacity(0.5),
                          )),
                          child: Icon(
                            LineIcons.minus,
                            color: black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        qty.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            qty++;
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: black.withOpacity(0.5),
                          )),
                          child: Icon(
                            LineIcons.plus,
                            color: black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
