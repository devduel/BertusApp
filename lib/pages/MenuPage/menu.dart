import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  bool _openingHoursVisible = false;
  bool _contactVisible = false;
  double _openingHoursHeight = 0;
  double _contactHeight = 0;

  AnimationController _controller;
  Animation _animation;
  CurvedAnimation _curve;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_curve);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleOpeningHoursToggle(Size deviceSize) {
    setState(() {
      if (_openingHoursVisible) {
        _openingHoursHeight = 0;
      } else {
        _openingHoursHeight = deviceSize.height * 0.7;
      }

      _openingHoursVisible = !_openingHoursVisible;
    });
  }

  void _handleContactToggle(Size deviceSize) {
    setState(() {
      if (_contactVisible) {
        _contactHeight = 0;
      } else {
        _contactHeight = deviceSize.height;
      }

      _contactVisible = !_contactVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(deviceSize.height * 0.06),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 5.0,
        ),
      ),
      body: Stack(
        children: <Widget>[
          FadeTransition(
            opacity: _animation,
            child: SvgPicture.asset(
              'assets/images/menu.svg',
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                width: deviceSize.width * 0.95,
                color: Colors.transparent,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        MaterialButton(
                          elevation: 5.0,
                          minWidth: deviceSize.width * 0.7,
                          color: Colors.blueAccent,
                          splashColor: Colors.white,
                          textColor: Colors.white,
                          shape: StadiumBorder(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.web, color: Colors.white),
                              SizedBox(
                                width: 5.0,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'strona www',
                                    style: TextStyle(
                                      color: Colors.grey[1000],
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Open Sans',
                                      fontSize: deviceSize.height * 0.03,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                        MaterialButton(
                          elevation: 5.0,
                          minWidth: deviceSize.width * 0.7,
                          color: Colors.blueAccent,
                          splashColor: Colors.white,
                          textColor: Colors.white,
                          shape: StadiumBorder(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.shopping_cart, color: Colors.white),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'sklep b2b',
                                    style: TextStyle(
                                      color: Colors.grey[1000],
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Open Sans',
                                      fontSize: deviceSize.height * 0.03,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                        MaterialButton(
                          elevation: 5.0,
                          minWidth: deviceSize.width * 0.7,
                          color: Colors.blueAccent,
                          splashColor: Colors.white,
                          textColor: Colors.white,
                          shape: StadiumBorder(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.av_timer, color: Colors.white),
                              Expanded(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'godziny otwarcia',
                                        style: TextStyle(
                                          color: Colors.grey[1000],
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Open Sans',
                                          fontSize: deviceSize.height * 0.03,
                                        ),
                                      ),
                                      Icon(_openingHoursVisible
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () =>
                              _handleOpeningHoursToggle(deviceSize),
                        ),
                        AnimatedContainer(
                          width: deviceSize.width,
                          height: _openingHoursHeight,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.fastOutSlowIn,
                          child: SingleChildScrollView(
                            child: buildInfoCard(deviceSize, {
                              'poniedziałek 09.00 - 17.00': Icons.av_timer,
                              'wtorek 09.00 - 17.00': Icons.av_timer,
                              'środa 09.00 - 17.00': Icons.av_timer,
                              'czwartek 09.00 - 17.00': Icons.av_timer,
                              'piątek 09.00 - 17.00': Icons.av_timer,
                              'sobota nieczynne': Icons.av_timer,
                              'niedziele nieczynne': Icons.av_timer,
                            }),
                          ),
                        ),
                        MaterialButton(
                          elevation: 5.0,
                          minWidth: deviceSize.width * 0.7,
                          color: Colors.blueAccent,
                          splashColor: Colors.white,
                          textColor: Colors.white,
                          shape: StadiumBorder(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.info, color: Colors.white),
                              Expanded(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'kontakt',
                                        style: TextStyle(
                                          color: Colors.grey[1000],
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Open Sans',
                                          fontSize: deviceSize.height * 0.03,
                                        ),
                                      ),
                                      Icon(_contactVisible
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () => _handleContactToggle(deviceSize),
                        ),
                        AnimatedContainer(
                          width: deviceSize.width,
                          height: _contactHeight,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.fastOutSlowIn,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                buildInfoCard(deviceSize, {
                                  '+48 61 651 70 32': Icons.phone,
                                  '+48 61 651 70 33': Icons.phone,
                                  '+48 61 651 70 34': Icons.phone,
                                  '+48 61 651 70 35': Icons.phone,
                                }),
                                buildInfoCard(deviceSize, {
                                  '+48 61 651 78 17': Icons.print,
                                }),
                                buildInfoCard(deviceSize, {
                                  'ul. Wołczyńska 37': Icons.streetview,
                                  '60-003 Poznań': Icons.location_city,
                                })
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildInfoCard(Size deviceSize, Map<String, IconData> infoData) {
  return Card(
    elevation: 3.0,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: infoData.entries
            .map((entry) => Row(
                  children: <Widget>[
                    Icon(
                      entry.value,
                      color: Color(0xFF5A6371),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Center(
                        child: Text(
                          entry.key,
                          style: TextStyle(
                            color: Color(0xFF5A6371),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Open Sans',
                            fontSize: deviceSize.height * 0.03,
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
            .toList(),
      ),
    ),
  );
}
