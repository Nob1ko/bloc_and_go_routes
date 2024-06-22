import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app_bloc/routes/routes.dart';
import 'package:template_app_bloc/views/auth/login/login_view.dart';
import 'package:template_app_bloc/views/auth/password/update_password_view.dart';
import 'package:template_app_bloc/views/auth/register/register_view.dart';
import 'package:template_app_bloc/views/create/creat_view.dart';
import 'package:template_app_bloc/views/discover/detail_discover_view.dart';
import 'package:template_app_bloc/views/discover/discover_view.dart';
import 'package:template_app_bloc/views/home/home_view.dart';
import 'package:template_app_bloc/views/inbox/inbox_view.dart';
import 'package:template_app_bloc/views/navigation/navigation_view.dart';
import 'package:template_app_bloc/views/profile/profile_view.dart';
import 'package:template_app_bloc/views/receipes/receipes_view.dart';
import 'package:template_app_bloc/views/search/search_view.dart';
import 'package:template_app_bloc/views/splash/splash_view.dart';
import 'package:template_app_bloc/widgets/scaffold_with_nested_navigation.dart';

class AppRoutes {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _discoverShellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Discover Tab');
  static final _searchShellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Search Tab');
  static final _createShellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Create Tab');
  static final _inboxShellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Inbox Tab');
  static final _recipesShellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Recipes Tab');
  static final GoRouter _router = GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/c',
      routes: [
        // SHELL ROUTESß
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _discoverShellNavigatorKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/a',
                  pageBuilder: (context, state) =>
                      MaterialPage(child: DiscoverView()),
                  routes: [
                    GoRoute(
                      path: 'detail',
                      builder: (context, state) => const DetailDiscoverView(),
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _searchShellNavigatorKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/b',
                  pageBuilder: (context, state) =>
                      MaterialPage(child: SearchView()),
                  routes: [
                    // child route
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _createShellNavigatorKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/c',
                  pageBuilder: (context, state) =>
                      MaterialPage(child: CreateView()),
                  routes: [
                    // child route for create
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _inboxShellNavigatorKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/d',
                  pageBuilder: (context, state) =>
                      MaterialPage(child: InboxView()),
                  routes: [
                    // child route
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _recipesShellNavigatorKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/e',
                  pageBuilder: (context, state) =>
                      MaterialPage(child: ReceipesView()),
                  routes: [
                    // child route
                  ],
                ),
              ],
            ),
          ],
        ),

        GoRoute(
          path: Routes.ROOT,
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          path: Routes.HOME_PAGE,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: Routes.AUTH,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: Routes.REGISTER,
          builder: (context, state) => const RegisterView(),
        ),
        GoRoute(
            path: Routes.NAVIGATION,
            builder: (context, state) => const NavigationView()),
        GoRoute(
            path: Routes.PROFILE,
            builder: (context, state) => const ProfileView()),
        GoRoute(
            path: Routes.UPDATE_PASSWORD,
            builder: (context, state) => const UpdatePasswordView()),
      ]);

  static GoRouter get router => _router;
}
