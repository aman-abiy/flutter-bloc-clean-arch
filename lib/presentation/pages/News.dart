import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch/common/custom_font_size.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_clean_arch/common/routes.dart';
import 'package:flutter_bloc_clean_arch/domain/entities/News.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/app/app_state.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/error/error_states.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/news/news_bloc.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/news/news_events.dart';
import 'package:flutter_bloc_clean_arch/presentation/bloc/news/news_state.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsBloc>().add(TopNewsRequested());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        backgroundColor: Colors.amber.shade700,
      ),
      body: BlocBuilder<NewsBloc, AppState>(
      builder: (context, state) {
        if (state is NewsInitial) {
          return Text('Initial State');
        } else if (state is NewsIsLoading) {
          return CircularProgressIndicator();
        } else if (state is NewsSuccess) {
          return newsListBuilder(state.newsList);
        } else if (state is NewsEmpty) {
          return Text('Error: EMPTY');
        }else if (state is GeneralErrorState) {
          return Text('Error: ');
        } else {
          return Container(); // For states not handled above
        }
      },
    ),
    );
  }

  Widget newsListBuilder(List<News> newsList) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed(AppRoutes.NEWS_DETAILS_ROUTE_NAME, extra: newsList[index].url),
          child: ListTile(
            title: Text(newsList[index].title,
              style: TextStyle(
                fontSize: CustomFontSize.s16
              ),
            ),
            subtitle: Text(newsList[index].by),
          ),
        );
      }
    );
  }
}