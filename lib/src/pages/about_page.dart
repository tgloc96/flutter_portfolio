import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: buildUIDesktop(),
    );
  }

  Widget buildUIDesktop() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildCollection(
                  title: 'Education',
                  children: [
                    buildItemEducation(
                      title: 'CTUT - CAN THO UNIVERSITY OF TECHNOLOGY',
                      time: '(2014 - 2018)',
                      subtitle: 'Major: Information System',
                    ),
                    buildItemEducation(
                      title: 'Son Handsome CO.LTD',
                      time: '(2015 - 2016)',
                      subtitle: 'Knowledge of C/C++/C#',
                    ),
                  ],
                ),
                Divider(),
                SizedBox(height: 30),
                buildCollection(
                  title: 'Experience',
                  children: [
                    buildItemExp(
                      position: 'Mobile Application Developer',
                      company: '200Lab',
                      time: 'August. 2019 to present',
                      descriptions: [
                        '- Application development with Flutter',
                        '- Development social application',
                        "- Research behavior's user"
                      ],
                    ),
                    buildItemExp(
                      position: 'Technical Support',
                      company: 'Son Handsome',
                      time: 'May. 2016 to 2019',
                      descriptions: [
                        '- Support about technical',
                        '- Planing to sell product & proposed marketing strategy'
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: buildCollection(
                title: 'Skills',
                children: [
                  buildItemSkills(
                    title: 'GIT',
                    value: 65.0,
                  ),
                  buildItemSkills(
                    title: 'UNIT TESTING',
                    value: 60.0,
                  ),
                  buildItemSkills(
                    title: 'OOP',
                    value: 80.0,
                  ),
                  buildItemSkills(
                    title: 'MYSQL',
                    value: 65.0,
                  ),
                  buildItemSkills(
                    title: 'DART/FLUTTER',
                    value: 75.0,
                  ),
                  buildItemSkills(
                    title: 'PHP/LARAVEL',
                    value: 60.0,
                  ),
                  buildItemSkills(
                    title: 'C/C++/C#',
                    value: 65.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItemEducation({
    String title,
    String subtitle,
    String time,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              if (time != null) ...[
                SizedBox(
                  width: 12,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                )
              ]
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
          )
        ],
      ),
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
    String company,
    String time,
    List<String> descriptions,
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
            '$company | $time',
            style: Theme.of(context).textTheme.headline6.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
          ),
          SizedBox(height: 12),
          ...descriptions
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
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline3.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        if (children != null) ...[
          SizedBox(height: 30),
          ...children,
        ]
      ],
    );
  }
}
