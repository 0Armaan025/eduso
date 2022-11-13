class Student {
  String name;
  String studentClass;
  String section;
  String emailAddress;
  String password;
  String phoneNumber;
  String classTeacherName;
  String uid;
  List<String> classmates;
  String profilePicture;

//<editor-fold desc="Data Methods">

  Student({
    required this.name,
    required this.studentClass,
    required this.section,
    required this.emailAddress,
    required this.password,
    required this.phoneNumber,
    required this.classTeacherName,
    required this.uid,
    required this.classmates,
    required this.profilePicture,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          studentClass == other.studentClass &&
          section == other.section &&
          emailAddress == other.emailAddress &&
          password == other.password &&
          phoneNumber == other.phoneNumber &&
          classTeacherName == other.classTeacherName &&
          uid == other.uid &&
          classmates == other.classmates &&
          profilePicture == other.profilePicture);

  @override
  int get hashCode =>
      name.hashCode ^
      studentClass.hashCode ^
      section.hashCode ^
      emailAddress.hashCode ^
      password.hashCode ^
      phoneNumber.hashCode ^
      classTeacherName.hashCode ^
      uid.hashCode ^
      classmates.hashCode ^
      profilePicture.hashCode;

  @override
  String toString() {
    return 'Student{' +
        ' name: $name,' +
        ' studentClass: $studentClass,' +
        ' section: $section,' +
        ' emailAddress: $emailAddress,' +
        ' password: $password,' +
        ' phoneNumber: $phoneNumber,' +
        ' classTeacherName: $classTeacherName,' +
        ' uid: $uid,' +
        ' classmates: $classmates,' +
        ' profilePicture: $profilePicture,' +
        '}';
  }

  Student copyWith({
    String? name,
    String? studentClass,
    String? section,
    String? emailAddress,
    String? password,
    int? phoneNumber,
    String? classTeacherName,
    String? uid,
    List<String>? classmates,
    String? profilePicture,
  }) {
    return Student(
      name: name ?? this.name,
      studentClass: studentClass ?? this.studentClass,
      section: section ?? this.section,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      phoneNumber: phoneNumber.toString() ?? this.phoneNumber,
      classTeacherName: classTeacherName ?? this.classTeacherName,
      uid: uid ?? this.uid,
      classmates: classmates ?? this.classmates,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'studentClass': this.studentClass,
      'section': this.section,
      'emailAddress': this.emailAddress,
      'password': this.password,
      'phoneNumber': this.phoneNumber,
      'classTeacherName': this.classTeacherName,
      'uid': this.uid,
      'classmates': this.classmates,
      'profilePicture': this.profilePicture,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] as String,
      studentClass: map['studentClass'] as String,
      section: map['section'] as String,
      emailAddress: map['emailAddress'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      classTeacherName: map['classTeacherName'] as String,
      uid: map['uid'] as String,
      classmates: map['classmates'] as List<String>,
      profilePicture: map['profilePicture'] as String,
    );
  }

//</editor-fold>
}
