import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone_app/models/models.dart';
import 'package:video_player/video_player.dart';

import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: _ContentHeaderMobile(featuredContent: featuredContent),
        desktop: _ContentHeaderDesktop(
          featuredContent: featuredContent,
        ));
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;
  const _ContentHeaderMobile({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(featuredContent.imageUrl), fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl!),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                  icon: Icons.add,
                  title: "List",
                  onTap: () => print("My List")),
              _PlayButton(),
              VerticalIconButton(
                  icon: Icons.info_outlined,
                  title: "info",
                  onTap: () => print("My Inf0")),
            ],
          ),
        )
      ],
    );
    ;
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;
  const _ContentHeaderDesktop({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  late VideoPlayerController _videoController;
  bool _isMuted = true;
  @override
  void initState() {
    // TODO: implement initState
    _videoController =
        VideoPlayerController.network(widget.featuredContent.videoUrl!)
          ..initialize().then((_) => setState(() {}))
          ..setVolume(0)
          ..play();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _videoController.value.isPlaying
            ? _videoController.pause()
            : _videoController.play();
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.isInitialized
                ? _videoController.value.aspectRatio
                : 2.344,
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: _videoController.value.isInitialized
                  ? _videoController.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
          ),
          Positioned(
              left: 60,
              right: 60,
              bottom: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Image.asset(widget.featuredContent.titleImageUrl!),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    widget.featuredContent.description!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                              color: Colors.black,
                              offset: Offset(2.0, 4.0),
                              blurRadius: 6.0)
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      _PlayButton(),
                      const SizedBox(
                        width: 14.0,
                      ),
                      FlatButton.icon(
                        padding:
                            const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
                        onPressed: () => print("more Info"),
                        color: Colors.white,
                        icon: const Icon(
                          Icons.info_outlined,
                          size: 30.0,
                        ),
                        label: const Text(
                          "More Info",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16.0),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      if (_videoController.value.isInitialized)
                        IconButton(
                          icon: _isMuted
                              ? Icon(Icons.volume_off)
                              : Icon(Icons.volume_up),
                          iconSize: 30.0,
                          color: Colors.white,
                          onPressed: () => setState(() {
                            _isMuted
                                ? _videoController.setVolume(100)
                                : _videoController.setVolume(0);
                            _isMuted = _videoController.value.volume == 0;
                          }),
                        )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
    ;
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton.icon(
      padding: !Responsive.isDesktop(context)
          ? const EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)
          : const EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
      onPressed: () => print("play"),
      color: Colors.white,
      icon: const Icon(
        Icons.play_arrow,
        size: 30.0,
      ),
      label: const Text(
        "Play",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
      ),
    );
  }
}
