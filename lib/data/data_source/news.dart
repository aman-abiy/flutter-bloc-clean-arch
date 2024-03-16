import 'package:flutter_bloc_clean_arch/common/api.dart';
import 'package:flutter_bloc_clean_arch/data/dtos/Custom_Http_Response.dart';
import 'package:flutter_bloc_clean_arch/data/enums/request_methods.dart';
import 'package:flutter_bloc_clean_arch/data/models/News_Dto.dart';
import 'package:flutter_bloc_clean_arch/data/network/network.dart';

class NewsDataSource {

  CustomHttpResponse customHttpResponse = CustomHttpResponse();

  Future<List<NewsDTO>> getNewsList() async {
    List<NewsDTO> news = [];
    
    customHttpResponse = await NetworkHandler().request(
      url: URLs.TOP_NEWS_URL,
      method: RequestMethod.GET,
      headers: null,
      queryParams: null,
      body: null,
      forceRefresh: true
    );

    if(customHttpResponse.status!) {
      CustomHttpResponse customHttpResponse2 = CustomHttpResponse();
      customHttpResponse.data.forEach((e) async {
        customHttpResponse2 = await NetworkHandler().request(
          url: '${URLs.NEWS_DETAIL_URL}/${e}.json',
          method: RequestMethod.GET,
          headers: null,
          queryParams: null,
          body: null,
          forceRefresh: true
        );

        news.add(NewsDTO.fromJson(customHttpResponse2.data));
      });
    }

    return news;
  }

}