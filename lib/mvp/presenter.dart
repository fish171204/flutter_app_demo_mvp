import 'package:flutter_app_demo_mvp/mvp/mvp_view.dart';

class Presenter<T extends MvpView> {
  T? view;

  void attachView(T view) {
    this.view = view;
  }

  void deAttachView() {
    view = null; // Hủy liên kết View
  }

  T? getView() {
    return view;
  }
}
