import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsInitial) {
          return Text('Initial State');
        } else if (state is NewsIsLoading) {
          return CircularProgressIndicator();
        } else if (state is NewsSuccess) {
          return Text('Loaded: ');
        } else if (state is NewsEmpty) {
          return Text('Error: ');
        }else if (state is GeneralErrorState) {
          return Text('Error: ');
        } else {
          return Container(); // For states not handled above
        }
      },
    ),
    );
  }

  // Widget newsListBuilder() {
  //   return
  // }
}