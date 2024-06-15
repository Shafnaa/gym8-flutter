import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/template/domain/entities/template.dart';
import 'package:gym8/features/template/domain/usecases/get_all_templates.dart';

part 'template_event.dart';
part 'template_state.dart';

class TemplateBloc extends Bloc<TemplateEvent, TemplateState> {
  final GetAllTemplates _getAllTemplates;

  TemplateBloc({
    required GetAllTemplates getAllTemplates,
  })  : _getAllTemplates = getAllTemplates,
        super(TemplateInitial()) {
    on<TemplateEvent>((event, emit) => emit(TemplateLoading()));
    on<TemplateFetchAllTemplates>(_onFetchAllTemplates);
  }

  void _onFetchAllTemplates(
    TemplateFetchAllTemplates event,
    Emitter<TemplateState> emit,
  ) async {
    final res = await _getAllTemplates(NoParams());

    res.fold(
      (l) => emit(TemplateFailure(l.message)),
      (r) => emit(TemplatesDisplaySuccess(r)),
    );
  }
}
