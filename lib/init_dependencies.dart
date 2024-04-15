import 'package:get_it/get_it.dart';
import 'package:gym8/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:gym8/core/network/connection_checker.dart';
import 'package:gym8/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:gym8/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:gym8/features/auth/domain/repositories/auth_repository.dart';
import 'package:gym8/features/auth/domain/usecases/user_sign_in.dart';
import 'package:gym8/features/auth/domain/usecases/user_sign_in_google.dart';
import 'package:gym8/features/auth/domain/usecases/user_sign_out.dart';
import 'package:gym8/features/auth/domain/usecases/user_sign_up.dart';
import 'package:gym8/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym8/features/auth/domain/usecases/current_user.dart';
import 'package:gym8/main_config.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'init_dependencies.main.dart';