import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(-0.5, -0.9),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    ));
    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //

    // print(size.width);
    // print(size.height);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SlideTransition(
              position: _animation,
              child: Column(
                children: [
                  Expanded(
                    child: ClipPath(
                      clipper: MyUpperClipper(),
                      child: Container(
                        // width: size.width,
                        // height: size.height * 0.2,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: size.width >= 360 ? 600 : 300,
                    height: size.height >= 800 ? 500 : 270,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Expanded(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              // helperMaxLines: 8,
                              hintText: 'User Name',
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.blue,
                              ),
                              hintText: 'Password',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        //      minimumSize: const Size(45, 45),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0))),
                                    onPressed: () {},
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.12,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        // minimumSize: const Size(20, 45),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0))),
                                    onPressed: () {},
                                    child: const Text(
                                      'SignUp',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: InkWell(
                            splashColor: Colors.red,
                            //   splashFactory:InteractiveInkFeatureFactory() ,
                            onTap: () {},
                            child: Card(
                              // color: Colors.white,
                              margin: const EdgeInsets.only(
                                  left: 50, right: 50, top: 10, bottom: 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side:
                                      BorderSide(color: Colors.blue.shade400)),
                              child: Row(
                                //    mainAxisAlignment:
                                //MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.facebook,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                  Text(
                                    'login with facebook',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipPath(
                      child: Container(
                        // width: size.width,
                        // height: size.height * 0.2,
                        color: Colors.blue,
                      ),
                      clipper: MyLowerClipper(),
                    ),
                  )
                ],
              ),
            )));
  }
}

class MyLowerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width, 0)
      ..cubicTo(size.width * 0.85, size.height * 0.5, size.width * 0.4,
          size.height * 0.4, size.width * 0.3, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

class MyUpperClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..cubicTo(size.width * 0.08, size.height * 0.5, size.width * 0.6,
          size.height * 0.6, size.width * 0.8, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
