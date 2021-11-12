import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone_app/assets.dart';
import 'package:flutter_netflix_clone_app/widgets/responsive.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      color:
          Colors.red.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: "TV Shows",
                  onTap: () => print("TV Showa"),
                ),
                _AppBarButton(
                  title: "Movies",
                  onTap: () => print("Movies"),
                ),
                _AppBarButton(
                  title: "My List",
                  onTap: () => print("My List"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: "Home",
                  onTap: () => print("Home"),
                ),
                _AppBarButton(
                  title: "TV Shows",
                  onTap: () => print("TV Showa"),
                ),
                _AppBarButton(
                  title: "Movies",
                  onTap: () => print("Movies"),
                ),
                _AppBarButton(
                  title: "Latest",
                  onTap: () => print("Latest"),
                ),
                _AppBarButton(
                  title: "My List",
                  onTap: () => print("My List"),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => print("search"),
                    icon: Icon(Icons.search),
                    iconSize: 28.0,
                    color: Colors.white),
                _AppBarButton(
                  title: "KIDS",
                  onTap: () => print("TV Showa"),
                ),
                _AppBarButton(
                  title: "DVD",
                  onTap: () => print("DVD"),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print("gift"),
                  icon: Icon(Icons.card_giftcard),
                  iconSize: 28.0,
                  color: Colors.white,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print("notifications"),
                  icon: Icon(Icons.notifications),
                  iconSize: 28.0,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const _AppBarButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 16.0, color: Colors.white),
      ),
    );
  }
}
