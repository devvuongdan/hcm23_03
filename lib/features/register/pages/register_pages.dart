import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hcm23_03/features/tasks/entities/task_model.dart';
import '../../home/pages/home_page.dart';
import '../../login/pages/login_page.dart';
import 'package:uuid/uuid.dart';

import '../../../shared/shared_ui/btn/btn_default/btn_default.dart';
import '../../../shared/shared_ui/inputs/input_clear/input_clear.dart';
import '../../../shared/shared_ui/inputs/input_normal/input_normal_layout_mixin.dart';
import '../../../shared/shared_ui/themes/colors.dart';
import '../../../shared/shared_ui/themes/text_styles.dart';
import '../../authentication/data/model/hcm23_user.dart';
import '../../authentication/data/resource/sqlite_helper.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/RegisterPage';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _hidePw = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _showHidePw() {
    setState(() {
      _hidePw = !_hidePw;
    });
  }

  // signup() {
  //   if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
  //     MotionToast.error(
  //             title: Text("Đăng ký thất bại!"),
  //             description: Text("Yêu cầu nhập lại tài khoản hoặc mật khẩu"))
  //         .show(context);
  //   } else {
  //     Navigator.of(context).pushNamed(HomePage.routeName);
  //     MotionToast.success(
  //             title: Text("Đăng ký thành công!"),
  //             description: Text("Chúc mừng bạn đã đăng ký thành công"))
  //         .show(context);
  //   }
  // }

  FeedbackType passwordFeedbackType = FeedbackType.none;
  String? feedbackMessage;

  void _registerUser() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final String userId = const Uuid().v4();
    // Create a map of user data
    final user = Hcm23User(
      uid: userId,
      username: username,
      password: password,
    );

    // Insert user data into the database
    await Hcm23DBHelper.insert<Hcm23User>(Hcm23User.dbTable, user);
    _saveTask(userId);
    _login();
  }

  void _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final List<Map<String, dynamic>> users =
        await Hcm23DBHelper.query(Hcm23User.dbTable);
    print(users);
    final user = users.firstWhere((user) => user['username'] == username);

    if (user['password'].toString() == password) {
      _getTasks();
      _navigateToHomePage();

      return;
    }
  }

  void _saveTask(String userId) async {
    final String taskUid = const Uuid().v4();
    final Task demoTask = Task(
      uid: taskUid,
      userId: userId,
      title: "title",
      description: "description",
      starttime: DateTime.now().toString(),
      duetime: DateTime.now().toString(),
      teamMembers: [
        TeamMember(
            taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
        TeamMember(
            taskUid: taskUid, uid: const Uuid().v4(), avatarUrl: "avatarUrl"),
      ],
      stages: [
        TaskStage(
          uid: const Uuid().v4(),
          taskUid: taskUid,
          isDone: true,
          stageName: "stageName",
        ),
        TaskStage(
          uid: const Uuid().v4(),
          taskUid: taskUid,
          isDone: true,
          stageName: "stageName",
        ),
        TaskStage(
          uid: const Uuid().v4(),
          taskUid: taskUid,
          isDone: true,
          stageName: "stageName",
        ),
      ],
    );

    await Hcm23DBHelper.insert<Task>(Task.dbTable, demoTask);
    for (TeamMember element in demoTask.teamMembers) {
      await Hcm23DBHelper.insert<TeamMember>(TeamMember.dbTable, element);
    }
    for (TaskStage stage in demoTask.stages) {
      await Hcm23DBHelper.insert<TaskStage>(TaskStage.dbTable, stage);
    }
  }

  _getTasks() async {
    final List<Map<String, dynamic>> tasks =
        await Hcm23DBHelper.query(Task.dbTable);
    print(tasks.first);
    final List<Map<String, dynamic>> taskStages =
        await Hcm23DBHelper.query(TaskStage.dbTable);
    print(taskStages.first);
    final List<Map<String, dynamic>> teamMembers =
        await Hcm23DBHelper.query(TeamMember.dbTable);
    print(teamMembers.first);
  }

  void _navigateToHomePage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomePage.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("Đăng ký"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Image.asset("assets/images/image_login.png"),
              ),
              // Text(
              //   "Xin chào Người dùng!",
              //   style: tStyle.paragraph18().w500().copyWith(
              //         color: Hcm23Colors.colorTextTitle,
              //       ),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // Text(
              //   "Vui lòng điền thông tin tài khoản để đăng ký!",
              //   style: tStyle
              //       .paragraph14()
              //       .w400()
              //       .copyWith(color: Hcm23Colors.colorTextPhude),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              InputClear(
                controller: _usernameController,
                placeholderText: "Tài khoản",
                clearButton: SvgPicture.asset(
                  "assets/icons/ui_kit/bold/close_square.svg",
                  fit: BoxFit.scaleDown,
                ),
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/normal/user.svg",
                    color: const Color(0XFFA2AEBD),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              InputClear(
                controller: _passwordController,
                placeholderText: "Mật khẩu",
                obscureText: _hidePw,
                decoration: InputDecoration(
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/ui_kit/bold/lock.svg",
                    fit: BoxFit.scaleDown,
                  ),
                  suffixIcon: InkWell(
                    onTap: _showHidePw,
                    child: SvgPicture.asset(
                      _hidePw
                          ? "assets/icons/ui_kit/bold/hide.svg"
                          : "assets/icons/ui_kit/bold/show.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                clearButton: SvgPicture.asset(
                  "assets/icons/ui_kit/bold/close_square.svg",
                  fit: BoxFit.scaleDown,
                ),
                feedBackType: passwordFeedbackType,
                feedbackMessage: feedbackMessage,
              ),
              const SizedBox(
                height: 32,
              ),
              BtnDefault(
                title: "Đăng ký",
                onTap: _registerUser,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Hoặc",
                style: tStyle
                    .paragraph14()
                    .w400()
                    .copyWith(color: Hcm23Colors.colorTextPhude),
              ),
              const SizedBox(
                height: 4,
              ),
              BtnDefault(
                type: BtnDefaultType.secondary,
                title: "Đăng nhập",
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
