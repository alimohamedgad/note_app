import 'package:flutter_bloc/flutter_bloc.dart';

import 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());
}
