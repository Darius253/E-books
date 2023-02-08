import '../../../shared/exports.dart';

class OnBoardData {
  String svgimg;
  String title;
  String desc;
  OnBoardData({required this.svgimg, required this.title, required this.desc});
}

List<OnBoardData> ondata = [
  OnBoardData(
      svgimg: Images.welcome,
      title: 'Welcome to Awstore',
      desc: "The ultimate destination for buying and selling digital arts and books."),
  OnBoardData(
      svgimg: Images.thing,
      title: 'Find your thing',
      desc: "The app offers a wide selection of digital arts and books, including paintings, photographs, ebooks,"),
  OnBoardData(
      svgimg: Images.interface,
      title: 'Easy-to-use interface',
      desc: "Awstore has an easy-to-use interface that allows users to search for specific items or browse by category."),
      OnBoardData(
      svgimg: Images.profit,
      title: 'Profit from your work',
      desc: "This is the perfect platform for artists and authors. Create a profile, upload your artwork, and sell to your work to buyers all over the world."),
];
