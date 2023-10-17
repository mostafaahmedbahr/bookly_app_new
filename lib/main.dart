import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
 import 'package:bookly_app/features/home/presentation/manager/fetch_all_books_cubit/fetch_all_books_cubit.dart';
  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';
import 'core/utils/bloc_observer.dart';
import 'features/home/data/models/book_model.dart';
import 'features/home/domain/entites/book_entity.dart';
import 'features/home/domain/use_cases/fetch_all_books_use_case.dart';
import 'features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>('books');
  await Hive.openBox<BookEntity>('newestBooks');
  getIt.registerSingleton<HomeRepoImplementation>( HomeRepoImplementation(
    homeRemoteDataSource: HomeRemoteDataSource(
      ApiServices(),
      BookModel(),
    ) ,
    homeLocalDataSource:  HomeLocalDataSourceImplement(),
  ),);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}


final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> FetchAllBooksCubit(FetchAllBooksUseCase(
            getIt.get<HomeRepoImplementation>(),
        ),
        ),
        ),
        BlocProvider(create: (context)=> FetchNewestBooksCubit(FetchNewestBooksUseCase(
          getIt.get<HomeRepoImplementation>(),
        ))),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: primaryColor,
          // textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          textTheme:  ThemeData.dark().textTheme,
        ),

      ),
    );
  }
}

