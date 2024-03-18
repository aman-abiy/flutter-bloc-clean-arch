import 'dart:async';

import 'package:flutter_bloc_clean_arch/common/api.dart';
import 'package:flutter_bloc_clean_arch/data/dtos/Custom_Http_Response.dart';
import 'package:flutter_bloc_clean_arch/data/enums/request_methods.dart';
import 'package:flutter_bloc_clean_arch/data/models/News_Dto.dart';
import 'package:flutter_bloc_clean_arch/data/network/network.dart';

abstract class NewsDataSource {
  FutureOr<List<NewsDTO>> getNewsList();
}

class NewsDataSourceImpl extends NewsDataSource{

  CustomHttpResponse customHttpResponse = CustomHttpResponse();

  @override
  Future<List<NewsDTO>> getNewsList() async {
    List<NewsDTO> news = [];
    
    customHttpResponse = await NetworkHandler().request(
          url: '${URLs.NEWS_DETAIL_URL}/39727280.json',
          method: RequestMethod.GET,
          headers: null,
          queryParams: null,
          body: null,
          forceRefresh: true
        );

    if(customHttpResponse.status!) {
      // CustomHttpResponse customHttpResponse2 = CustomHttpResponse();
      // customHttpResponse.data.take(10).toList().forEach((e) async {
      //   customHttpResponse2 = await NetworkHandler().request(
      //     url: '${URLs.NEWS_DETAIL_URL}/39727280.json',
      //     method: RequestMethod.GET,
      //     headers: null,
      //     queryParams: null,
      //     body: null,
      //     forceRefresh: true
      //   );
      //   print('customHttpResponse2 ${customHttpResponse2.data}');

        news.add(NewsDTO.fromMap(customHttpResponse.data));
      // });
    }

    return news;
  }

}