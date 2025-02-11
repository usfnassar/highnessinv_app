part of 'app_layout_cubit.dart';

@immutable
sealed class AppLayoutState {}

final class AppLayoutInitial extends AppLayoutState {}
final class AppLayoutChangeTapBarState extends AppLayoutState {}
