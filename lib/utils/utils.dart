import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void call(String? call){
  launchUrl(Uri.parse('tel:$call'));
}

void mail(String? email){
  launchUrl(Uri.parse('mailto:$email'));
}

void message(String? sms){
  launchUrl(Uri.parse('sms:$sms'));
}

void share(String? fullname,String? phone){
  Share.share('$fullname \n $phone');
}

