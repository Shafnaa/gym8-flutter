part of 'template_bloc.dart';

@immutable
sealed class TemplateState {}

final class TemplateInitial extends TemplateState {}

final class TemplateLoading extends TemplateState {}

final class TemplateFailure extends TemplateState {
  final String error;
  TemplateFailure(this.error);
}

final class TemplatesDisplaySuccess extends TemplateState {
  final List<Template> templates;
  TemplatesDisplaySuccess(this.templates);
}
