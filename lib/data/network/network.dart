import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean_arch/data/network/cache_manager.dart';
import 'package:flutter_bloc_clean_arch/data/dtos/Custom_Http_Response.dart';
import 'package:flutter_bloc_clean_arch/data/enums/request_methods.dart';

class NetworkHandler {

  Dio dio = Dio(BaseOptions(
    headers: {"Accept": "application/json"},
    responseType: ResponseType.json,
    receiveTimeout: 30000,
    connectTimeout: 30000,
    followRedirects: false,
    receiveDataWhenStatusError: true,
  ));
  
  late Response response;
  
  late CustomHttpResponse customHttpResponse;
  
  Future<CustomHttpResponse> request({
    bool forceRefresh = false,
    required String url, 
    required RequestMethod method, 
    Map<String, dynamic>? headers, 
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body}) async { 

    CacheManagerService().init();

    // connect cache service with dio object
    dio.interceptors.add(CacheManagerService().dioCacheManager.interceptor);
    print('forceRefreshforceRefresh $forceRefresh');

    CacheManagerService().buildCacheOpts(forceRefresh);

    // combine cath options and header options
    Options options = CacheManagerService().cacheOptions;
    options.headers = headers;

    // check connectivity before making request
    // bool status = await ConnectivityService().checkConnectivity();
    // if(!status) {
    //   ErrorProvider().setError(CONNECTION_ERROR_MSG);
    //   return CustomHttpResponse.fromJson({
    //     'status': false
    //   });
    // }

    try {
      // ErrorProvider().setError(null);
      if (forceRefresh) {
        await CacheManagerService().dioCacheManager.deleteByPrimaryKey(url, requestMethod: method.name.toString());
      }
      dio.interceptors.add(CacheManagerService().dioCacheManager.interceptor);

      if (method == RequestMethod.POST) {
        response = await dio.post(url,
          options: options,
          queryParameters: queryParams,
          data: body
        ); 
      }

      if (method == RequestMethod.GET) {
        response = await dio.get(url,
          options: options,
          queryParameters: queryParams
        );
      }

      if (method == RequestMethod.PUT) {
        response = await dio.put(url,
          options: options,
          queryParameters: queryParams,
          data: body
        );

      }

      Map<String, dynamic> data = {
        'statusCode': response.statusCode,
        'status': true,
        'data': response.data,
      };


      customHttpResponse = CustomHttpResponse.fromJson(data);
  
    } on DioError catch(e) {
      // ErrorHandler().handleDioError(e);
      return CustomHttpResponse.fromJson({
        'status': false
      });
    }

    return customHttpResponse;
  }
  

}