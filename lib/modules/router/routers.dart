import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/router/router_meta.dart';
import 'package:quiz/modules/store/user/user_provider.dart';
import 'package:quiz/pages/advance/advance_page.dart';
import 'package:quiz/pages/error/error_page.dart';
import 'package:quiz/pages/intro/intro_page.dart';
import 'package:quiz/pages/login/login_page.dart';
import 'package:quiz/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:quiz/pages/main/main_state.dart';
import 'package:quiz/pages/reisger/register_page.dart';
import 'package:quiz/pages/search/search_page.dart';
import 'package:quiz/pages/verify/verify_page.dart';
import 'package:quiz/utils/log/logger.dart';

part 'routers.config.dart';

class Routes {
  // Main
  static String main = "/";
  // Tab - Quizzes
  static String mainTabQuizzes = "/quizzes";
  // Tab - Discover
  static String mainTabDiscover = "/discover";
  // Tab - Profile
  static String mainTabProfile = "/profile";
  // register
  static String register = "/login/register";
  static String registerSubPath = "register";
  // login
  static String login = "/login";
  // verify code
  static String verfiyCode = "/verify";
  // quizzes intro
  static String quizIntro = "intro";
  // quizzes advance
  static String quizAdvance = "advance";
  // search
  static String quizSearch = "search";
}
