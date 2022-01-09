import 'package:mufin/models/asset/asset.dart';

class AssetList {
  final List<Asset>? assets;

  AssetList({
    this.assets,
  });

  factory AssetList.fromJson(List<dynamic> json) {
    List<Asset> assets = <Asset>[];
    assets = json.map((asset) => Asset.fromMap(asset)).toList();

    return AssetList(assets: assets);
  }
}
