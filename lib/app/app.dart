import 'package:api_mock/features/creating_page/cubit/creating_cubit.dart';
import 'package:api_mock/features/home_page/cubit/home_cubit.dart';
import 'package:api_mock/features/home_page/home_page.dart';
import 'package:api_mock/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.postRepository,
    // required this.notificationService,
  });

  final ApiRepository postRepository;
  // final NotificationService notificationService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (_) => HomeCubit(postRepository)),
        BlocProvider<CreatingCubit>(
            create: (_) => CreatingCubit(postRepository)),
      ],
      child: MaterialApp(
        title: 'Posts',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        // localizationsDelegates: const [
        //   AppLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        // supportedLocales: AppLocalizations.delegate.supportedLocales,
        home: const HomePage(),
      ),
    );
  }
}
