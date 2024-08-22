class OnboardingContent {
  String title;
  String description;
  String image;

  OnboardingContent({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<OnboardingContent> content = [
  OnboardingContent(
    description: 'Pick your food in more than 25 times',
    image: 'images/food.jpg',
    title: 'Select from our Best Menu',
  ),
  OnboardingContent(
    description: 'Pay through cards/UPI',
    image: 'images/food.jpg',
    title: 'Easy checkout',
  ),
  OnboardingContent(
    description: 'Deliver your food at your doorstep',
    image: 'images/food.jpg',
    title: 'Fast and Fresh!',
  ),
];