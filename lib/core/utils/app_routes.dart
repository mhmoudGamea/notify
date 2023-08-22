import 'package:go_router/go_router.dart';
import 'package:notify/features/new_note/presentation/views/add_note_view.dart';
import 'package:notify/features/notify/presentation/views/notify_view.dart';
import 'package:notify/features/profile/presentation/views/complete_view.dart';
import 'package:notify/features/profile/presentation/views/delayed_view.dart';
import 'package:notify/features/profile/presentation/views/profile_view.dart';
import 'package:notify/features/profile/presentation/views/todo_view.dart';

import '../../features/notify/data/models/my_notes_model.dart';

abstract class AppRoutes {
  static GoRouter get getRouter {
    return _router;
  }

  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: NotifyView.rn,
        builder: (context, state) => const NotifyView(),
      ),
      GoRoute(
        path: AddNoteView.rn,
        builder: (context, state) => const AddNoteView(),
      ),
      GoRoute(
        path: ProfileView.rn,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: TodoView.rn,
        builder: (context, state) =>
            TodoView(todoList: state.extra as List<MyNotesModel>),
      ),
      GoRoute(
        path: CompleteView.rn,
        builder: (context, state) =>
            CompleteView(completeList: state.extra as List<MyNotesModel>),
      ),
      GoRoute(
        path: DelayedView.rn,
        builder: (context, state) =>
            DelayedView(delayedList: state.extra as List<MyNotesModel>),
      ),
    ],
  );
}
