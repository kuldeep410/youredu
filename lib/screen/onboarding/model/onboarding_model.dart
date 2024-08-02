class OnboardingModel {
  String? image;
  String? title;
  String? discription;

  OnboardingModel({this.image, this.title, this.discription});
}

List<OnboardingModel> contents = [
  OnboardingModel(
      title: 'Let’s explore\nbeen looking for',
      image: 'assets/onboarding/onboarding_one.png',
      discription:
          "Create a unique emotional story that\ndescribe better then words"),
  OnboardingModel(
      title: 'Connect and\nGet real-time updates',
      image: 'assets/onboarding/onboarding_two.png',
      discription:
          "Create a unique emotional story that\ndescribe better then words"),
  OnboardingModel(
      title: 'Scroll and find your\nDedicated courses',
      image: 'assets/onboarding/onboarding_three.png',
      discription:
          "Create a unique emotional story that\ndescribe better then words"),
];
