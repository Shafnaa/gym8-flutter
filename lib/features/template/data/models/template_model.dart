import 'package:gym8/features/template/domain/entities/template.dart';

class TemplateModel extends Template {
  TemplateModel({
    required super.id,
    required super.name,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory TemplateModel.fromJson(Map<String, dynamic> map) {
    return TemplateModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  TemplateModel copyWith({
    int? id,
    String? name,
  }) {
    return TemplateModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
