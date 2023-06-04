import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tutor_app/Root/home_page.dart';
import 'package:tutor_app/Root/sessions_page.dart';
import 'package:tutor_app/pages/book_session_page.dart';
import 'package:tutor_app/pages/details.dart';
import 'package:tutor_app/pages/find_tutor_page.dart';
import 'package:tutor_app/pages/instruction.dart';
import 'package:tutor_app/pages/loginorsignin.dart';
import 'package:tutor_app/pages/resources_page.dart';
import 'package:tutor_app/routes/ScafoldWithBottomNavBar.dart';
import 'profile/profile.dart';
import 'package:tutor_app/pages/upcoming_sessions.dart';
import 'package:tutor_app/pages/signin.dart';
import 'Root/resources.dart';
import 'Screen/Resources/categories.dart';
import 'Screen/Resources/detailed_posting.dart';
import 'Screen/Resources/forum.dart';
import 'Screen/Resources/notes.dart';
import 'Screen/Resources/pages.dart';
import 'Screen/Resources/post_question.dart';
import 'Screen/Resources/post_resources.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/home',
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/sessions',
        icon: Icon(Icons.calendar_month_outlined),
        label: 'Session',
      ),
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/resources',
        icon: Icon(Icons.sticky_note_2_outlined),
        label: 'Resources',
      ),
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/profile',
        icon: Icon(Icons.person_2_outlined),
        label: 'Profile',
      ),
    ];

    final goRouter = GoRouter(
        initialLocation: '/',
        navigatorKey: _rootNavigatorKey,
        debugLogDiagnostics: true,
        routes: [
          ShellRoute(
              // navigatorKey: _shellNavigatorKey,
              builder: (context, state, child) {
                return ScaffoldWithBottomNavBar(tabs: tabs, child: child);
              },
              routes: [
                GoRoute(
                    path: '/',
                    pageBuilder: (context, state) => NoTransitionPage(
                          key: state.pageKey,
                          child: const Firstp(),
                        ),
                    routes: [
                      GoRoute(
                          path: 'ins1',
                          builder: (context, state) => const Ins1(),
                          routes: [
                            GoRoute(
                                path: 'ins2',
                                builder: (context, state) => const Ins2(),
                                routes: [
                                  GoRoute(
                                      path: 'ins3',
                                      builder: (context, state) => const Ins3(),
                                      routes: [
                                        GoRoute(
                                            path: 'options',
                                            builder: (context, state) =>
                                                const LoginorSignin(),
                                            routes: [
                                              GoRoute(
                                                path: 'login',
                                                builder: (context, state) =>
                                                    const LoginPage(),
                                              ),
                                              GoRoute(
                                                  path: 'signup',
                                                  builder: (context, state) =>
                                                      const SignUpPage(),
                                                  routes: [
                                                    GoRoute(
                                                        path: 'roles',
                                                        builder:
                                                            (context, state) =>
                                                                Roles(),
                                                        routes: [
                                                          GoRoute(
                                                              path:
                                                                  'detailStudent',
                                                              builder: (context,
                                                                      state) =>
                                                                  const DetailStudent(),
                                                              routes: [
                                                                GoRoute(
                                                                  path:
                                                                      'welcome',
                                                                  builder: (context,
                                                                          state) =>
                                                                      const Welcome(),
                                                                )
                                                              ]),
                                                          GoRoute(
                                                              path:
                                                                  'detailsTutor',
                                                              builder: (context,
                                                                      state) =>
                                                                  const DetailTutor(),
                                                              routes: [
                                                                GoRoute(
                                                                  path:
                                                                      'detailsTutor2',
                                                                  builder: (context,
                                                                          state) =>
                                                                      const DetailTutor2(),
                                                                )
                                                              ])
                                                        ])
                                                  ])
                                            ])
                                      ])
                                ])
                          ])
                    ]),
                //Home page
                GoRoute(
                  path: '/home',
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const HomePage(),
                  ),
                ),
                //Sessions page
                GoRoute(
                    path: '/sessions',
                    pageBuilder: (context, state) => NoTransitionPage(
                          key: state.pageKey,
                          child: const SessionsPage(),
                        ),
                    routes: [
                      GoRoute(
                          path: 'findTutor',
                          builder: (context, state) => const FindTutorPage(),
                          routes: [
                            GoRoute(
                              path: 'book_session',
                              pageBuilder: (context, state) => NoTransitionPage(
                                key: state.pageKey,
                                child: BookSessionPage(arguments: state.extra),
                              ),
                            )
                          ]),
                      GoRoute(
                        path: 'upcoming_sessions',
                        builder: (context, state) => const UpcomingPage(),
                      ),
                    ]),
                //Resources page
                GoRoute(
                    path: '/resources',
                    pageBuilder: (context, state) => NoTransitionPage(
                          key: state.pageKey,
                          child: const ResourcesPage(),
                        ),
                    routes: [
                      GoRoute(
                          path: 'categories',
                          builder: (context, state) => const Categories(),
                          routes: [
                            GoRoute(
                                path: 'notes/:subjects',
                                builder: (context, state) =>
                                    Notes(subjects: state.params["subjects"]!),
                                routes: [
                                  GoRoute(
                                    path: 'pages',
                                    builder: (context, state) => const Pages(),
                                  ),
                                  GoRoute(
                                    path: 'add',
                                    builder: (context, state) =>
                                        const PostResources(),
                                  )
                                ])
                          ]),
                      GoRoute(
                          path: 'forum',
                          builder: (context, state) => const Forum(),
                          routes: [
                            GoRoute(
                              path: 'post',
                              builder: (context, state) => const PostQuestion(),
                            ),
                            GoRoute(
                              path: 'comment/:id/:title/:description',
                              builder: (context, state) => DetailedPost(
                                questionId: state.params['id']!,
                                questionTitle: state.params['title']!,
                                questionDescription:
                                    state.params['description']!,
                              ),
                            )
                          ])
                    ]),
                //Profile page
                GoRoute(
                  path: '/profile',
                  pageBuilder: (context, state) => NoTransitionPage(
                    key: state.pageKey,
                    child: const Profile(),
                  ),
                ),
              ])
        ]);

    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  /// Constructs an [ScaffoldWithNavBarTabItem].
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;
}
