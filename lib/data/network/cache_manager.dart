import 'package:flutter/material.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean_arch/common/api.dart';

class CacheManagerService extends ChangeNotifier {
  bool hasConnection = true;

  late DioCacheManager dioCacheManager;
  late Options cacheOptions;

  //////////////// Singleton Constructor ///////////////////
  static final CacheManagerService _singleton = CacheManagerService._internal();

  factory CacheManagerService() {
    return _singleton;
  }

  CacheManagerService._internal();

  //////////////// Singleton Constructor ///////////////////
  
  void init() {
    dioCacheManager = DioCacheManager(
      CacheConfig(
        baseUrl: URLs.BASE_URL,
      ),
    );
  }

  void buildCacheOpts(bool forceRefresh) {
    cacheOptions = buildCacheOptions(const Duration(days: DIO_CACHE_DURATION_IN_DAYS), maxStale: const Duration(days: DIO_CACHE_DURATION_IN_DAYS), forceRefresh: forceRefresh);
  }
}
