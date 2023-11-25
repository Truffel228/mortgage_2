import 'package:mortgage/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:mortgage/screens/settings/param_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParametersScreen extends StatelessWidget {
  const ParametersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Settings',
                  style: TextStyle(
                    color: Color(0xFF363636),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ParamItem(
                title: 'Privacy Policy',
                onTap: () => context.push(
                  AppRouter.ppu,
                  extra:
                      'https://docs.google.com/document/d/1HxulcD1gNQm0XXmUVFzk-_CAdDlofzbJE9IcXswHt1o/edit?usp=sharing',
                ),
              ),
              ParamItem(
                title: 'Terms and Condition',
                onTap: () => context.push(
                  AppRouter.ppu,
                  extra:
                      'https://docs.google.com/document/d/14H1luNmj23rQ3jyUepgO_lP_rJh8FoTqkszm_4l5Wp0/edit?usp=sharing',
                ),
              ),
              ParamItem(
                title: 'Write Support',
                onTap: () => context.push(
                  AppRouter.ppu,
                  extra: 'https://forms.gle/GQKLramC4sTWUxxi8',
                ),
              ),
              ParamItem(
                title: 'Rate our app in the AppStore',
                onTap: () => InAppReview.instance.openStoreListing(
                  appStoreId: '6471505545',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> rate(SharedPreferences shPre) async {
  final rev = InAppReview.instance;
  bool alreadyRated = shPre.getBool('rate') ?? false;
  if (!alreadyRated) {
    if (await rev.isAvailable()) {
      rev.requestReview();
      await shPre.setBool('rate', true);
    }
  }
}
