import 'package:flutter/material.dart';
import 'package:flutter_cv/src/models/about.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutPage extends StatefulWidget {
  final About about;

  const AboutPage({@required this.about});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  About get about => widget.about;

  @override
  Widget build(BuildContext context) {
    if (about == null) {
      return const SizedBox();
    }

    return ScreenTypeLayout(
      desktop: buildUIDesktop(),
      mobile: buildUIMobile(),
      tablet: buildUIMobile(),
    );
  }

  Widget buildUIDesktop() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildExperience(),
                const Divider(),
                const SizedBox(height: 30),
                buildEducation(),
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: buildSkills()),
          )
        ],
      ),
    );
  }

  Widget buildUIMobile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          buildExperience(),
          buildEducation(),
          buildSkills(),
        ],
      ),
    );
  }

  Widget buildEducation() {
    if (about.educations?.isEmpty ?? true) {
      return const SizedBox();
    }

    return buildCollection(
      title: 'Education',
      children: about.educations
          .map((e) => buildItemEducation(
                title: e.organization,
                subtitle: e.knowledge,
                time: e.time,
              ))
          .toList(),
    );
  }

  Widget buildItemEducation({
    String title,
    String subtitle,
    String time,
  }) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var styleTitle = Theme.of(context).textTheme.headline5;
      var styleSubtitle = Theme.of(context).textTheme.headline6;

      if (sizingInformation.isMobile) {
        styleTitle = Theme.of(context).textTheme.headline6;
        styleSubtitle = Theme.of(context).textTheme.subtitle1;
      }

      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              children: [
                Text(
                  title,
                  style: styleTitle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                if (time != null) ...[
                  const SizedBox(
                    width: 12
                  ),
                  Text(
                    time,
                    style: styleSubtitle.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ]
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: styleSubtitle.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorDark,
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildExperience() {
    if (about.experiences?.isEmpty ?? true) {
      return const SizedBox();
    }

    return buildCollection(
      title: 'Experience',
      children: about.experiences
          .map((e) => buildItemExp(
                position: e.position,
                organization: e.organization,
                time: e.time,
                skills: e.skills,
              ))
          .toList(),
    );
  }

  Widget buildSkills() {
    if (about.skills?.isEmpty ?? true) {
      return const SizedBox();
    }

    return buildCollection(
      title: 'Skills',
      children: about.skills
          .map((e) => buildItemSkills(
                title: e.title,
                value: e.value.toDouble(),
              ))
          .toList(),
    );
  }

  Widget buildItemSkills({
    String title,
    double value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          const SizedBox(height: 8),
          Slider(
            onChanged: (_) {},
            min: 0,
            max: 100,
            value: value,
            activeColor: Theme.of(context).primaryColorDark,
            inactiveColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  Widget buildItemExp({
    String position,
    String organization,
    String time,
    List<String> skills,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            position,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '$organization | $time',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
          ),
          const SizedBox(height: 12),
          ...skills
              .map((des) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      des,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }

  Widget buildCollection({
    @required String title,
    @required List<Widget> children,
  }) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var styleTitle = Theme.of(context).textTheme.headline3;
      if (!sizingInformation.isDesktop) {
        styleTitle = Theme.of(context).textTheme.headline4;
      }
      return Column(
        children: [
          Text(
            title,
            style: styleTitle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (children != null) ...[
            const SizedBox(height: 30),
            ...children,
          ]
        ],
      );
    });
  }
}
