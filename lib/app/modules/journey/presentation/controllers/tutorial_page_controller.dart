import 'package:flutter/material.dart';
import 'package:ods10/app/modules/journey/domain/usecases/interfaces/set_tutorial_completed_usecase.dart';
import 'package:ods10/app/modules/journey/presentation/stores/tutorial_page_store.dart';
import 'package:ods10/app/modules/journey/utils/links_util.dart';
import 'package:url_launcher/url_launcher.dart';

class TutorialPageController {
  final TutoriaPageStore tutorialStore;
  final SetTutorialCompletedUseCase _setTutorialCompletedUseCase;
  final PageController pageController = PageController();

  TutorialPageController(
    this.tutorialStore,
    this._setTutorialCompletedUseCase,
  );

  void launchURLCNJ() async {
    if (!await launch(urlCNJ)) throw 'Tente novamente mais tarde $urlCNJ';
  }

  Future<bool> completeTutorial() async {
    return await _setTutorialCompletedUseCase();
  }
}
