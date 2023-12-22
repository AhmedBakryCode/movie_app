import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String success;
  final String statusMassage;

  ErrorMessageModel(
      {required this.statusCode,
      required this.success,
      required this.statusMassage});

  factory ErrorMessageModel.fromjson(Map<String,dynamic>json){
    return ErrorMessageModel(statusCode: json["status_code"], success: "success", statusMassage: "status_massage");

  }

  @override
  // TODO: implement props
  List<Object?> get props =>[statusCode,statusMassage,success];
}
