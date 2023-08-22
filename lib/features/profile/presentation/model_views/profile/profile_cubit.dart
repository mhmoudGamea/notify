import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notify/features/notify/data/models/my_notes_model.dart';
import 'package:notify/features/profile/data/repos/profile_repo.dart';

import '../../../../../core/utils/helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  List<MyNotesModel> _notes = [];

  List<MyNotesModel> get getNotes {
    return _notes;
  }

  Future<void> getAllNotes(BuildContext context) async {
    emit(NotesLoading());
    final result = await _profileRepo.queryAll();
    result.fold((failure) {
      Helper.showCustomToast(
          context: context,
          bgColor: Colors.red,
          icon: Icons.dangerous,
          msg: failure.errMessage);
      emit(NotesFailure());
    }, (success) {
      _notes = success;
      getCompleted();
      getTodo();
      getDelayed();
      getTodays();
      emit(NotesSuccess());
    });
  }

  // search section
  final TextEditingController _searchController = TextEditingController();
  TextEditingController get getSearchController {
    return _searchController;
  }

  // completed notes section
  final List<MyNotesModel> _completedList = [];
  List<MyNotesModel> get getCompletedList {
    return _completedList;
  }

  void getCompleted() {
    for (var element in getNotes) {
      if (element.isCompleted == 1) {
        _completedList.add(element);
      }
    }
  }

  // todo notes section
  final List<MyNotesModel> _todoList = [];
  List<MyNotesModel> get getTodoList {
    return _todoList;
  }

  void getTodo() {
    for (var element in getNotes) {
      if (element.isCompleted == 0) {
        _todoList.add(element);
      }
    }
  }

  // delayed notes section
  final List<MyNotesModel> _delayedList = [];
  List<MyNotesModel> get getDelayedList {
    return _delayedList;
  }

  void getDelayed() {
    final String currentFormatedDate = DateFormat.yMd().format(DateTime.now());
    final DateTime todayDateTime = DateFormat.yMd().parse(currentFormatedDate);

    for (var element in getNotes) {
      final DateTime databaseDateTime = DateFormat.yMd().parse(element.date);
      if (databaseDateTime.isBefore(todayDateTime)) {
        _delayedList.add(element);
      }
    }
  }

  // delayed notes section
  final List<MyNotesModel> _todayList = [];
  List<MyNotesModel> get getTodaysList {
    return _todayList;
  }

  void getTodays() {
    final String currentFormatedDate = DateFormat.yMd().format(DateTime.now());

    for (var element in getNotes) {
      if (currentFormatedDate == element.date) {
        _todayList.add(element);
      }
    }
  }
}
