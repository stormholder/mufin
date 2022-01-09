import 'dart:async';

import 'package:mufin/data/local/datasources/asset/asset_datasource.dart';
import 'package:mufin/models/asset/asset.dart';
import 'package:mufin/models/asset/asset_list.dart';
import 'package:sembast/sembast.dart';

import 'local/constants/db_constants.dart';

class AssetRepository {
  final AssetDataSource _assetDataSource;

  // constructor
  AssetRepository(this._assetDataSource);

  Future<AssetList> getAssets() async {
    return await _assetDataSource.getAssetsFromDb().then((assetList) {
      return assetList;
    }).catchError((error) => throw error);
  }

  Future<List<Asset>> findAssetById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _assetDataSource
        .getAllSortedByFilter(filters: filters)
        .then((assets) => assets)
        .catchError((error) => throw error);
  }

  Future<int> insert(Asset asset) => _assetDataSource
      .insert(asset)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> update(Asset asset) => _assetDataSource
      .update(asset)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> delete(Asset asset) => _assetDataSource
      .update(asset)
      .then((id) => id)
      .catchError((error) => throw error);
}