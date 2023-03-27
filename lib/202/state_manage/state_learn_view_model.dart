import 'package:flutter/cupertino.dart';
import 'package:temeldenzirveyeflutter/202/state_manage/state_manage_learn_view.dart';

abstract class StateLearnViewModel extends State<StateManageLearnView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isVisible = false;
  bool isOpacity = false;

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }

  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }
}
