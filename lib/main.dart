import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell_app/bloc_observer.dart';
import 'package:red_cell_app/home.dart';
import 'package:red_cell_app/provider/list_provider.dart';
import 'package:red_cell_app/screens/chats/cubit/social_cubit.dart';
import 'package:red_cell_app/screens/page_view/page%20view.dart';
import 'package:provider/provider.dart';

import 'models/snackbar.dart';

void main() async {
  // SocialCubit.get(context).getUserData();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  // String uId = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore.instance.settings =
      const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(ChangeNotifierProvider(
    create: (context) => ListProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SocialCubit(),
        child: MaterialApp(
          title: 'Red Cell',
         
          theme: ThemeData(
           
            textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.red,
              selectionHandleColor: Colors.red,
            ),
           
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return showSnackBar(context, "SomeThing went wrong");
              } else if (snapshot.hasData) {
                SocialCubit.get(context).getUserData();
                SocialCubit.get(context).getUsers();
                //return VerifyEmailPage();
                return home_screen();
              } else {
                return page_view();
              }
            },
          ),
          debugShowCheckedModeBanner: false,
        ));
  }
}
