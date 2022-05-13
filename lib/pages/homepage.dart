import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:task_for_4_may/pages/hotels.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
          color: isActive ? Color(0xff23A790) : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Colors.grey.shade400, width: 0.5)),
    );
  }

  late PageController _pageController1;

  int _Page = 0;

  @override
  void initState() {
    super.initState();
    _pageController1 = PageController();
  }

  int _page = 0;
  late String search;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60,
        items: <Widget>[
          Icon(
            Icons.search,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite_outline,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 35,
            color: Colors.white,
          ),
        ],
        color: Color(0xff53D3C4),
        buttonBackgroundColor: Color(0xff53D3C4),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int index) {
          setState(() {
            _pageController1.jumpToPage(index);
          });
        },
        letIndexChange: (index) => true,
      ),
      body: PageView(
        controller: _pageController1,
        children: <Widget>[
          SingleChildScrollView(
            child:Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.62,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        PageView(
                          physics: ClampingScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: <Widget>[
                            Container(
                              child: Stack(
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/shar.jpg'),
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Stack(
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/img.png'),
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Stack(
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/img_1.png'),
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 45, right: 45, top: 45),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(171, 171, 171, 0.5),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 15, right: 15),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.search,
                                      size: 30,
                                      color: Color(0xff23A790),
                                    ),
                                    labelText: 'Where are you going?',
                                    labelStyle:
                                    TextStyle(color: Colors.grey.shade500),
                                    border: InputBorder.none,
                                  ),
                                  validator: (input) => input!.length == 0
                                      ? "Please, enter hotel name"
                                      : null,
                                  onSaved: (input) => search = input!,
                                ),
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20, bottom: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: _buildPageIndicator(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 20,
                        ),
                        child: Text(
                          'Popular Destinations',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hotels()),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 150,
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/img_2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ) ,
          ),
          Container(
            child: Center(child: Lottie.asset('assets/not.json')),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 80, bottom: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amanda',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tdch ckndspw sxjwsx',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        'assets/images/img_6.png',
                        fit: BoxFit.cover,
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                _item("Change Password", Icons.lock),
                _item('Invite Friends', Icons.people_alt_rounded),
                _item("Credes & Coupones", Icons.card_giftcard),
                _item("Help Center", Icons.info),
                _item("Payments", Icons.payment_sharp),
                _item("Settings", Icons.settings)
              ],
            ),
          ),
        ],
        onPageChanged: (int index) {
          setState(
            () {
              _pageController1.jumpToPage(index);
            },
          );
        },
      ),
    );
  }

  _item(title, icon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              icon,
              size: 26,
              color: Colors.grey.shade600,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1,
          color: Colors.grey.shade300,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
