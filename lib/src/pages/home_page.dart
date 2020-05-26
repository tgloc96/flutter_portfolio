import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          children: [
            Expanded(child: buildInformation()),
            SizedBox(width: 50),
            Expanded(child: buildAvatar()),
          ],
        ),
      ),
      mobile: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            buildAvatar(),
            SizedBox(height: 50),
            buildInformation(),
          ],
        ),
      ),
    );
  }

  Widget buildInformation() {
    return ResponsiveBuilder(builder: (context, sizingInfo) {
      return Column(
        crossAxisAlignment: sizingInfo.isDesktop
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hi',
            style: GoogleFonts.aBeeZee().copyWith(
              fontSize: 75,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "I'm Loc",
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 24),
          Text(
            'Extremely motivated to constantly develop my skills and grow professionally. Software engineer with thorough hands-on experience in Mobile Application Development.',
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 24),
          ScreenTypeLayout(
            desktop: SizedBox(
              width: 500,
              child: buildButtonKnowMore(),
            ),
            mobile: buildButtonKnowMore(),
          )
        ],
      );
    });
  }

  Widget buildButtonKnowMore() {
    return RaisedButton(
      color: Colors.white,
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 4,
        ),
      ),
      child: Text(
        'KNOW MORE',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget buildAvatar() {
    return LayoutBuilder(builder: (context, constraints) {
      return AspectRatio(
        aspectRatio: 1.2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomPaint(
            painter: MyPainter(
              lineColor: Colors.teal,
              width: 8.0,
            ),
            child: Container(
              padding: EdgeInsets.all(constraints.maxWidth / 22),
              child: Container(
                padding: EdgeInsets.all(constraints.maxWidth / 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.tealAccent,
                    width: 3,
                  ),
                ),
                child: Material(
                  elevation: 20,
                  shape: CircleBorder(
                    side: BorderSide(
                      width: 10,
                      color: Colors.white,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/avatar.JPG',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  double width;

  MyPainter({
    this.lineColor,
    this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint complete = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    double arcAngle = 2 * pi * (25 / 100);
    canvas.drawArc(
      new Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      pi / 4,
      -arcAngle,
      false,
      complete,
    );

    canvas.drawArc(
      new Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      (3 * pi) / 4,
      arcAngle,
      false,
      complete,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
