import 'package:mufin/data/local/constants/db_constants.dart';
import 'package:mufin/models/asset/asset.dart';
import 'package:mufin/models/asset/asset_list.dart';
import 'package:sembast/sembast.dart';

class AssetDataSource {
  final _assetsStore = intMapStoreFactory.store(DBConstants.STORE_NAME);
  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  // Future<Database> get _db async => await AppDatabase.instance.database;

  // database instance
  final Database _db;

  AssetDataSource(this._db);

  // DB functions:--------------------------------------------------------------
  Future<int> insert(Asset post) async {
    return await _assetsStore.add(_db, post.toMap());
  }

  Future<int> count() async {
    return await _assetsStore.count(_db);
  }

  Future<List<Asset>> getAllSortedByFilter({List<Filter>? filters}) async {
    //creating finder
    final finder = Finder(
        filter: filters != null ? Filter.and(filters) : null,
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _assetsStore.find(
      _db,
      finder: finder,
    );

    // Making a List<Post> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final post = Asset.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      post.id = snapshot.key;
      return post;
    }).toList();
  }

  Future<AssetList> getAssetsFromDb() async {

    print('Loading from database');

    // post list
    var assetList;

    // fetching data
    final recordSnapshots = await _assetsStore.find(
      _db,
    );

    // Making a List<Post> out of List<RecordSnapshot>
    if(recordSnapshots.length > 0) {
      assetList = AssetList(
          assets: recordSnapshots.map((snapshot) {
            final post = Asset.fromMap(snapshot.value);
            // An ID is a key of a record from the database.
            post.id = snapshot.key;
            return post;
          }).toList());
    }

    return assetList;
  }

  Future<int> update(Asset post) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(post.id));
    return await _assetsStore.update(
      _db,
      post.toMap(),
      finder: finder,
    );
  }

  Future<int> delete(Asset post) async {
    final finder = Finder(filter: Filter.byKey(post.id));
    return await _assetsStore.delete(
      _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _assetsStore.drop(
      _db,
    );
  }
}