import 'package:gym8/features/history/domain/entities/history.dart';

class HistoryModel extends History {
  HistoryModel({required super.id, required super.createdAt});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'created_at': createdAt,
    };
  }

  factory HistoryModel.fromJson(Map<String, dynamic> map) {
    return HistoryModel(
      id: map['id'] as int,
      createdAt: map['created_at'] as DateTime,
    );
  }

  HistoryModel copyWith({
    int? id,
    DateTime? createdAt,
  }) {
    return HistoryModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
