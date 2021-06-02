import 'package:mobx/mobx.dart';

part 'sampleui_viewmodel.g.dart';

class SampleUiViewModel = _SampleUiViewModel with _$SampleUiViewModel;

abstract class _SampleUiViewModel with Store {
  @observable
  String i;
}
