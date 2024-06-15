part of 'template_bloc.dart';

@immutable
sealed class TemplateEvent {}

final class TemplateFetchAllTemplates extends TemplateEvent {}

final class TemplateFetchTemplate extends TemplateEvent {
  final int id;

  TemplateFetchTemplate({
    required this.id,
  });
}
