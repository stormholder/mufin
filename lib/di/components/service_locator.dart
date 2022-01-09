import 'package:get_it/get_it.dart';
import 'package:mufin/data/asset_repository.dart';
import 'package:mufin/data/local/datasources/asset/asset_datasource.dart';
import 'package:mufin/data/repository.dart';
import 'package:mufin/di/module/local_module.dart';
import 'package:mufin/stores/asset/asset_store.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mufin/data/sharedpref/shared_preference_helper.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(() => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));

  // api's:---------------------------------------------------------------------

  // data sources:--------------------------------------------------------------
  getIt.registerSingleton(AssetDataSource(await getIt.getAsync<Database>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(
      getIt<SharedPreferenceHelper>()
  ));
  getIt.registerSingleton(AssetRepository(
      getIt<AssetDataSource>()
  ));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(AssetStore(getIt<AssetRepository>()));
}