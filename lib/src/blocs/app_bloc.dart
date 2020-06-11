
import 'package:flutter_cv/src/blocs/bloc_provider.dart';
import 'package:flutter_cv/src/common/common.dart';
import 'package:flutter_cv/src/models/app_data.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc with BlocBase {

  final _appDataSubject = BehaviorSubject<AppData>();

  Stream<AppData> get appDataStream => _appDataSubject.stream;

  AppData get appDataValue => _appDataSubject.stream.value;

  Future<void> loadData() async {
    final appDataJson = await parseJsonFromAssets('lib/data/info.json');
    final appData = AppData.fromJson(appDataJson);
    _appDataSubject.sink.add(appData);
  }


  @override
  void dispose() {
    _appDataSubject?.close();
  }
}