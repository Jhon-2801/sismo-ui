import 'package:go_router/go_router.dart';
import 'package:sismo/presentation/views/feature_view.dart';
import 'package:sismo/presentation/views/home_view.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: HomeView.name,
      builder: (context, state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: '/feature/:id',
      builder: (context, state) {
        if (state.pathParameters['id'] == null) {
          return const HomeView();
        }
        return FeatureView(id: state.pathParameters['id']!);
      },
    ),
  ],
);
