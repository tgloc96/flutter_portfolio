import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_cv/src/common/common.dart';
import 'package:flutter_cv/src/models/home.dart';
import 'package:flutter_cv/src/widgets/screen_type_layout_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  final Home home;

  const HomePage({@required this.home, Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Home get _home => widget.home;

  bool get _isEmptyContributors => _home.contributors?.isEmpty ?? true;

  bool get _isEmptyContact => _home.contact == null;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayoutCustom(
      desktop: buildUIDesktop(),
      tablet: buildUIMobile(),
      mobile: buildUIMobile(),
    );
  }

  Widget buildUIDesktop() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildInformation()),
                const SizedBox(width: 50),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FractionallySizedBox(
                      heightFactor: 0.75,
                      widthFactor: 0.75,
                      child: _buildAvatar(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildFooter(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    final widgets = [
      Row(
        children: [
          _buildShowCase(),
          if (!_isEmptyContributors && !_isEmptyContact)
            Container(
              width: 3,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              color: Theme.of(context).primaryColor,
            ),
          _buildContact(),
        ],
      ),
      _buildDesProduct(),
    ];

    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth > 1300) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widgets,
          );
        }
        return Column(
          children: [
            const SizedBox(height: 20),
            _buildShowCase(),
            if (!_isEmptyContributors && !_isEmptyContact)
              const SizedBox(height: 20),
            _buildContact(),
            const SizedBox(height: 20),
            _buildDesProduct(),
          ],
        );
      },
    );
  }

  Widget buildUIMobile() {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return SingleChildScrollView(
        padding: sizingInformation.isMobile
            ? const EdgeInsets.all(16)
            : const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              child: _buildAvatar(),
            ),
            _buildSpacer(desktop: 50, mobile: 24, tablet: 24),
            _buildInformation(),
            _buildFooter(),
          ],
        ),
      );
    });
  }

  Widget _buildInformation() {
    return ResponsiveBuilder(builder: (context, sizingInfo) {
      var titleStyle = Theme.of(context).textTheme.headline1;
      var descriptionStyle = Theme.of(context).textTheme.headline5;

      if (!sizingInfo.isDesktop) {
        titleStyle = Theme.of(context).textTheme.headline2;
        descriptionStyle = Theme.of(context).textTheme.headline6;
      }

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: sizingInfo.isDesktop
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_home.title?.isNotEmpty ?? false)
              Text(
                _home.title,
                style: titleStyle,
              ),
            _buildSpacer(),
            if (_home.subtitle?.isNotEmpty ?? false)
              Text(
                _home.subtitle,
                style: titleStyle,
              ),
            _buildSpacer(),
            if (_home.description?.isNotEmpty ?? false)
              Text(
                _home.description,
                style: descriptionStyle.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _buildShowCase() {
    if (_isEmptyContributors) {
      return const SizedBox();
    }

    return Row(
      children: [
        Text(
          'CONTRIBUTORS',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        ..._home.contributors
            .expand((element) => [
                  _buildSpacer(),
                  _buildIconAppShowCase(
                    asset: element.urlIconApp,
                    url: element.url,
                  )
                ])
            .toList(),
      ],
    );
  }

  Widget _buildContact() {
    if (_isEmptyContact) {
      return const SizedBox();
    }

    return Wrap(
      runSpacing: 12,
      children: [
        Text(
          'CONTACT',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        const SizedBox(width: 20),
        if (_home.contact.phone?.isNotEmpty ?? false)
          _buildItemContact(
            icon: const Icon(Icons.phone_iphone),
            des: _home.contact.phone,
          ),
        if (_home.contact.email?.isNotEmpty ?? false)
          _buildItemContact(
            icon: const Icon(Icons.email),
            des: _home.contact.email,
          ),
      ],
    );
  }

  Widget _buildItemContact({
    @required Widget icon,
    @required String des,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            des,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Theme.of(context).primaryColorDark),
          ),
        ],
      ),
    );
  }

  Widget _buildIconAppShowCase({
    @required String asset,
    @required String url,
  }) {
    Widget mobile() {
      return Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipOval(
              child: Image.asset(asset),
            ),
          ),
        ),
      );
    }

    Widget desktop() {
      return Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 4,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipOval(
              child: Image.asset(asset),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => launchURL(url),
      child: ScreenTypeLayoutCustom(
        mobile: mobile(),
        tablet: mobile(),
        desktop: desktop(),
      ),
    );
  }

  Widget _buildAvatar() {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomPaint(
          painter: SemiCirclePainter(
            lineColor: Theme.of(context).primaryColor,
            width: 8.0,
          ),
          child: Container(
            padding: EdgeInsets.all(constraints.maxWidth / 22),
            child: Container(
              padding: EdgeInsets.all(constraints.maxWidth / 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).primaryColorLight,
                  width: 3,
                ),
              ),
              child: Material(
                elevation: 10,
                shape: CircleBorder(
                  side: BorderSide(
                    width: 3,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/avatar.jpeg',
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

  Widget _buildDesProduct() {
    if (_home.contact?.repo == null) {
      return const SizedBox();
    }

    final repo = _home.contact.repo;

    final des = Text(
      'This product is written in Flutter',
      style: Theme.of(context).textTheme.subtitle1.copyWith(
            fontStyle: FontStyle.italic,
          ),
    );

    Widget icon = const SizedBox(width: 4);
    if (repo.typeRepo?.isNotEmpty ?? false) {
      if (repo.typeRepo == 'github') {
        icon = const FaIcon(FontAwesomeIcons.github);
      } else if (repo.typeRepo == 'gitlab') {
        icon = const FaIcon(FontAwesomeIcons.gitlab);
      }
    }

    final repoName = Text.rich(TextSpan(
      text: repo.name,
      recognizer: TapGestureRecognizer()..onTap = () => launchURL(repo.urlRepo),
      style: Theme.of(context).textTheme.subtitle1.copyWith(
            color: Colors.blue,
            fontStyle: FontStyle.italic,
          ),
    ));

    Widget desktop() {
      return Row(
        children: [
          des,
          Container(
            width: 2,
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: Theme.of(context).primaryColor,
          ),
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: icon,
            ),
          repoName,
        ],
      );
    }

    Widget mobile() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          des,
          const SizedBox(height: 4),
          Row(
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: icon,
                ),
              repoName,
            ],
          ),
        ],
      );
    }

    return ScreenTypeLayoutCustom(
      desktop: desktop(),
      mobile: mobile(),
      tablet: desktop(),
    );
  }

  Widget _buildSpacer({
    double desktop = 30,
    double mobile = 12,
    double tablet = 12,
  }) {
    return ScreenTypeLayoutCustom(
      desktop: SizedBox(
        height: desktop,
        width: desktop,
      ),
      mobile: SizedBox(
        height: mobile,
        width: mobile,
      ),
      tablet: SizedBox(
        height: tablet,
        width: mobile,
      ),
    );
  }
}

class SemiCirclePainter extends CustomPainter {
  Color lineColor;
  double width;

  SemiCirclePainter({
    this.lineColor,
    this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final complete = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final arcAngle = 2 * pi * (25 / 100);
    canvas
      ..drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
        pi / 4,
        -arcAngle,
        false,
        complete,
      )
      ..drawArc(
        Rect.fromCircle(
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
