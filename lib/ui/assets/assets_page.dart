import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mufin/models/asset/asset.dart';
import 'package:mufin/stores/asset/asset_store.dart';
import 'package:mufin/ui/widgets/custom_progress_indicator.dart';
import 'package:provider/provider.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  late AssetStore _assetStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _assetStore = Provider.of<AssetStore>(context);

    // check to see if already called api
    if (!_assetStore.loading) {
      _assetStore.getAssets();
    }
  }

  void _addAsset() {
    setState(() {
      Asset a = Asset(id: 1, name: "Bank account", cost: 1000.0, income: 0.0);
      _assetStore.insert(a);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
            children: <Widget>[
              _buildMainContent()
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addAsset,
        tooltip: 'Add',
        child: const Icon(Icons.add),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return _assetStore.loading
            ? const CustomProgressIndicatorWidget()
            : Material(child: _buildListView());
      },
    );
  }

  Widget _buildListView() {
    return _assetStore.postList != null
        ? ListView.separated(
            itemCount: _assetStore.postList!.assets!.length,
            separatorBuilder: (context, position) {
              return const Divider();
            },
            itemBuilder: (context, position) {
              return _buildListItem(position);
            },
          )
        : const Center(
            child: Text("No assets found"),
          );
  }

  Widget _buildListItem(int position) {
    return ListTile(
      dense: true,
      leading: const Icon(Icons.cloud_circle),
      title: Text(
        '${_assetStore.postList?.assets?[position].name}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        style: Theme.of(context).textTheme.headline3,
      ),
      subtitle: Text(
        '${_assetStore.postList?.assets?[position].cost}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }

}