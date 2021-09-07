import 'dart:async';

class Cache {
  Cache._();
  factory Cache() => _instace;
  static final Cache _instace = Cache._();
  CacheSettings _cacheSettings = CacheSettings();
  Cache.databaseInit(this._cacheSettings, List<String> databaseTables) {
    for (var databaseName in databaseTables) {
      //从这里获取数据库数据到缓存
    }
  }
  //需要缓存的数据
  Map<String, dynamic> _caches = {};

  Map<String, dynamic> get cache => _caches;

  //当前缓存的数量
  int _cruuent = 0;

  //添加数据到缓冲
  Future<bool> addData(String key, dynamic data) async {
    if (_cruuent > _cacheSettings.maxCacheNumber) {
      return false;
    }
    if (_caches[key] == null) {
      _caches[key] = [];
    }
    if (data is List) {
      _caches[key]!.addAll([..._caches[key]!, ...data]);
    }
    _caches[key]!.add(data);
    if (_cacheSettings.isSaveToDatabase) {}
    return true;
    //这里需要根据对应的键存入数据库
  }

  Stream<dynamic> readData(String key) async* {
    if (_caches[key] == null) {
      yield null;
    } else {
      var datas = _caches[key]!;
      for (int i = 0; i < datas.length; i++) {
        yield datas[i];
      }
    }
  }

  //移除所有缓存数据
  void clearCache() {
    _caches.keys.forEach((key) {
      _caches.remove(key);
    });
  }
}

///缓存的配置类
class CacheSettings {
  //是否缓冲启动之后读取数据
  final bool readDatabase;

  ///
  /// 是否将数据保存数据库
  final bool isSaveToDatabase;

  ///
  /// 最大缓存数量
  final int maxCacheNumber;
  CacheSettings(
      {this.isSaveToDatabase = false,
      this.maxCacheNumber = 1000,
      this.readDatabase = false});
}
