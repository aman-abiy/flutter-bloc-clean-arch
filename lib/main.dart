import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_arch/injection.dart' as di;
import 'package:flutter_bloc_clean_arch/presentation/bloc/news/news_bloc.dart';
import 'package:flutter_bloc_clean_arch/presentation/pages/News.dart';
import 'package:flutter_bloc_clean_arch/presentation/router/router.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (BuildContext context) => di.locator<NewsBloc>()
        ),
      ],
      child: MaterialApp.router(
        title: 'Tech News',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router
      ),
    );
  }
}