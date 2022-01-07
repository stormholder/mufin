import 'package:get_it/get_it.dart';
import 'package:mufin/data/repository.dart';
import 'package:mufin/di/module/local_module.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mufin/data/sharedpref/shared_preference_helper.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<SharedPreferences>(() => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));

  // api's:---------------------------------------------------------------------

  // data sources:--------------------------------------------------------------

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(
      getIt<SharedPreferenceHelper>()
  ));

  // stores:--------------------------------------------------------------------
}