
abstract class DatabaseState {}

class DatabaseInitial extends DatabaseState {}

class ReadDataState  extends DatabaseState {}
class DeletNoteState extends DatabaseState {}
class AddNoteState extends DatabaseState {}
class EditNoteState extends DatabaseState {}



