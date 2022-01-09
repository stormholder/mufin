import 'package:mobx/mobx.dart';
import 'package:mufin/data/asset_repository.dart';
import 'package:mufin/models/asset/asset.dart';
import 'package:mufin/models/asset/asset_list.dart';
import 'package:mufin/stores/error/error_store.dart';

part 'asset_store.g.dart';

class AssetStore = _AssetStore with _$AssetStore;

abstract class _AssetStore with Store {
  // repository instance
  late AssetRepository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _AssetStore(AssetRepository repository) : this._repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<AssetList?> emptyPostResponse =
    ObservableFuture.value(null);

  @observable
  ObservableFuture<AssetList?> fetchPostsFuture =
    ObservableFuture<AssetList?>(emptyPostResponse);

  @observable
  AssetList? postList;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getAssets() async {
    final future = _repository.getAssets();
    fetchPostsFuture = ObservableFuture(future);

    future.then((postList) {
      this.postList = postList;
    }).catchError((error) {
      errorStore.errorMessage = error.toString();//DioErrorUtil.handleError(error);
    });
  }

  @action
  Future insert(Asset asset) async {
    final future = _repository.insert(asset);

    future.then((value) {
      if (postList == null) {
        postList = AssetList(assets: List.filled(1, asset, growable: true));
      } else {
        postList!.assets!.add(asset);
      }
    }).catchError((error) {
      errorStore.errorMessage = error.toString();
    });
  }
}