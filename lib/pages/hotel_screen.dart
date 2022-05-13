import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:task_for_4_may/pages/hotels.dart';

class HotelScreen extends StatefulWidget {
  static const String id = 'hotelscreen';

  const HotelScreen({Key? key}) : super(key: key);

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  bool forLike = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(
              'assets/images/back.jpg',
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Hotels.id);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black54,
                    )),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        forLike = !forLike;
                      });
                    },
                    icon: forLike
                        ? Icon(
                            Icons.favorite_outline,
                            color: Color(0xff23A790),
                          )
                        : Icon(
                            Icons.favorite,
                            color: Color(0xff23A790),
                          ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GlassmorphicContainer(
                  width: 350,
                  height: 250,
                  borderRadius: 20,
                  blur: 20,
                  alignment: Alignment.bottomCenter,
                  linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.1),
                      Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                    stops: [
                      0.1,
                      1,
                    ],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.5),
                      Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  border: 0.01,
                  child: null,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'More details',
                      style: TextStyle(
                          color: Colors.white60, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white60,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
