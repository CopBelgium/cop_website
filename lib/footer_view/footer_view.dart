import 'package:auto_size_text/auto_size_text.dart';
import 'package:cop_website/footer_view/widgets/footer_icon_button.dart';
import 'package:cop_website/utilities/constant.dart';
import 'package:cop_website/utilities/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

const String emailUrl = 'mailto:info@copbelgium.com';
const String addressUrl = 'https://rb.gy/p6icar';
const String youtubeUrl =
    'https://www.youtube.com/channel/UC7fQxWqyHcxOHbe5o8w5ToA?sub_confirmation=1';
const String instaUrl = 'https://www.instagram.com/copbelgium';
const String facebookUrl =
    'https://www.facebook.com/Church-of-Pentecost-Belgium-106370728720719';
List<String> phoneNumbers = [
  '+32 484 404 354',
  '+32 487 535 881',
  '+32 488 144 869',
];

class FooterView extends StatefulWidget {
  const FooterView({Key? key}) : super(key: key);

  @override
  State<FooterView> createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenInfo) {
        if (screenInfo.isMobile) {
          return const _MobileView();
        }

        return const _DesktopView();
      },
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDesktopPadding,
        vertical: kMobilePadding,
      ),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _ChurchAddress(),
            SizedBox(height: kContentSpacing12),
            _EmailPhoneNumbers(),
            SizedBox(height: kContentSpacing8),
            _SocialIcons(),
          ],
        ),
      ),
    );
  }
}

class _DesktopView extends StatelessWidget {
  const _DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kDesktopPadding,
        vertical: kContentSpacing8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Flexible(child: _ChurchAddress()),
          _EmailPhoneNumbers(),
          _SocialIcons(),
        ],
      ),
    );
  }
}

class _ChurchAddress extends StatelessWidget {
  const _ChurchAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText('Koning Abertlaan 195', style: kBody2),
          AutoSizeText('1082 Sint Agartha Berchem', style: kBody2),
          AutoSizeText('Belgium', style: kBody2),
        ],
      ),
      onTap: () => openUrl(url: addressUrl),
    );
  }
}

class _EmailPhoneNumbers extends StatelessWidget {
  const _EmailPhoneNumbers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: Text('info@copbelgium.com', style: kBody2),
          onTap: () => openUrl(url: emailUrl),
        ),
        const SizedBox(height: kContentSpacing8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: phoneNumbers.map((phoneNumber) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                child: Text(phoneNumber, style: kBody2),
                onTap: () => openUrl(url: 'tel:$phoneNumber'),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _SocialIcons extends StatelessWidget {
  const _SocialIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FooterIconButton(
          icon: const Icon(FontAwesomeIcons.facebook),
          onPressed: () => openUrl(url: facebookUrl),
        ),
        FooterIconButton(
            icon: const Icon(FontAwesomeIcons.instagram),
            onPressed: () => openUrl(url: instaUrl)),
        FooterIconButton(
          icon: const Icon(FontAwesomeIcons.youtube),
          onPressed: () => openUrl(url: youtubeUrl),
        ),
      ],
    );
  }
}
