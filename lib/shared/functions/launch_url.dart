import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async {
  final res = await canLaunch(url);

  if (!res) {
    print("Could not load url");
  }

  await launch(url);
}
