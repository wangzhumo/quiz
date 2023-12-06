import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz/modules/store/user/user_provider.dart';
import 'package:quiz/pages/discover/discover_page.dart';
import 'package:quiz/pages/error/error_page.dart';
import 'package:quiz/pages/intro/intro_page.dart';
import 'package:quiz/pages/login/login_page.dart';
import 'package:quiz/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:quiz/pages/profile/profile_page.dart';
import 'package:quiz/pages/quiz/quiz_page.dart';
import 'package:quiz/pages/reisger/register_page.dart';
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
  static String quizIntroSubPath = "intro";

  // 个人资料
  static String loginProfileEditor = "/login/ProfileEditor";

  /// 首页模块的页面
  static String home = "/home";

  // 首页
  static String homeMain = "/home/main";

  // 欢迎页面
  static String mainSplash = "/home/splash";

  /// -----------------发现--------------------
  static String discover = "/discover";

  // 发现 - 推荐tab
  static String discoverRecommend = "/discover/recommend";

  // 发现 - 关注tab
  static String discoverFollow = "/discover/follow";

  // 发现 - post详情
  static String discoverFeedDetails = "/discover/details";

  // 发现 - 话题详情
  static String discoverFeedTopic = "/discover/topic";

  // 发现 - 发布
  static String discoverPublish = "/discover/publish";

  // 发现 - 发布 - 话题列表
  static String discoverTopicList = "/discover/topic/list";

  // 发现 - 录制音频
  static String discoverRecord = "/discover/record";

  /// -----------------发现--------------------

  /// -----------------词典--------------------
  // 单词搜索
  static String search = "/search";

  // 情景
  static String scene = "/scene";

  // 情景 - 生活场景
  static String sceneClassify = "/scene_classify";

  // 情景 - 常用50句
  static String sceneCommon = "/scene_common";

  // 语音评分
  static String spoken = "/spoken";

  // 翻译
  static String translate = "/translate";

  // 句子详情
  static String sentence = "/sentence";

  // 单词详情
  static String word = "/word";

  // 句子详情
  static String sentenceDetail = "/sentence/detail";

  /// -----------------词典--------------------

  /// -----------------课程--------------------
  // 课程的单元
  static String courseUnitDetails = "/course/unit";

  // 口语练习
  static String courseRepeat = "/course/repeat";

  // 要点提炼
  static String courseFramework = "/course/framework";

  // 课程的等级下 - 课程包
  static String courseLevel = "/course/level";

  // 课程精讲
  static String coursePrecise = "/course/precise";
  static String coursePrecisePrepare = "/course/precise/prepare";
  static String coursePreciseDialog = "/course/precise/dialog";
  static String coursePrecisePrecise = "/course/precise/precise";
  static String coursePreciseReview = "/course/precise/review";

  // 要点练习
  static String courseQuizer = "/course/quizer";

  // 课程 - 结果页面
  static String courseConclusion = "/course/conclusion";

  /// -----------------课程--------------------

  /// -----------------用户 User--------------------
  static String homeUser = "/user";

  // User 关于
  static String userAboutUs = "/user/aboutUs";

  // User 关注/粉丝列表
  static String userRelation = "/user/relation";

  // User 关注/粉丝列表 - tab
  static String userRelationTab = "/user/relation/tab";

  // User 消息通知
  static String userMessage = "/user/message";

  // User 消息通知 - 详情
  static String userMessageDetails = "/user/message/details";

  // User 个人主页
  static String userProfile = "/user/profile";

  /// -----------------用户 User--------------------

  /// -----------------购买--------------------
  static String purchaseCourseShow = "/purchase/courseShow";

  // 付款页面
  static String purchasePaymentPage = "/purchase/payment";

  // 使用优惠券页面
  static String purchaseUseCouponPage = "/purchase/payment/useCoupon";

  // 购买成功页面
  static String purchaseSuccess = "/purchase/payment/success";

  // 体验营
  static String purchaseExperience = "/purchase/experience";

  /// -----------------购买--------------------

  /// -----------------记忆单词/句子--------------------
  // 体验营的列表
  static String memoryExperience = "/memory/experience";

  // 日常任务
  static String memoryDailyTask = "/memory/daily/task";

  // 单词本 - 句子本
  static String memoryWordsBook = "/memory/words/book";

  // 单词学习
  static String memoryWords = "/memory/words";

  // 句子学习
  static String memorySentence = "/memory/sentence";

  // 切换项目
  static String memoryChangeSubject = "/memory/change/subject";

  /// -----------------记忆单词/句子--------------------

  /// -----------------弹窗--------------------

  // 内测用户的 - 欢迎页面
  static String popupWelcome = "/popup/welcome";

  // 引流到微信
  static String popupGuideWeChat = "/popup/guide/wechat";

  /// -----------------弹窗--------------------

  // 分享
  static String share = "/share";

  // 举报页面
  static String report = "/report";

  // 收藏页面
  static String collect = "/collect";

  // 测试
  static String testPage = "/testPage";

  // webView容器
  static String webView = "/webView";

  // 视屏播放
  static String videoPlayer = "/videoPlayer";

  // 优惠券页面
  static String couponList = "/user/coupon";

  // 优惠券页面 - tab
  static String couponTab = "/user/coupon/tab";

  // 订单列表
  static String orderList = "/user/orderList";
}
