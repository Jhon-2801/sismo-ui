import 'package:go_router/go_router.dart';
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
  ],
);
