class IntroSliderContent {
  String image;
  String title;
  String discription;

  IntroSliderContent(
      {required this.image, required this.title, required this.discription});
}

List<IntroSliderContent> contents = [
  IntroSliderContent(
      title: 'Welcome to Etiqa\'s '
          'Insurance To-do List',
      image: 'lib/assets/etiqa.png',
      discription: "Where You will be more efficient in your task! "),
  IntroSliderContent(
      title: 'No Uncertainty',
      image: 'lib/assets/slide1.png',
      discription: "No more Uncertainty in task implementation."),
  IntroSliderContent(
      title: 'More Managed',
      image: 'lib/assets/slide2.png',
      discription: "Be more productive and manageable with us! "),
  IntroSliderContent(
      title: 'More Achievements',
      image: 'lib/assets/slide3.png',
      discription:
          "Simply an everyday application to help you to serve in achieving your goal! "),
];
