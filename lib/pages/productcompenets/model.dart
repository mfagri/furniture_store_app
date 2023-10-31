import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class model3d extends StatefulWidget {
  final String modellink;
   model3d({super.key,required this.modellink});

  @override
  State<model3d> createState() => _model3dState();
}

class _model3dState extends State<model3d> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child:  ModelViewer(
          backgroundColor: Colors.transparent,
          src: widget.modellink.toString(),
          alt: 'A 3D model of an astronaut',
          ar: true,
          // arModes: ['scene-viewer', 'webxr', 'quick-look'],
          autoRotate: false,
          // iosSrc: 'lib/images/round_chair.glb',
          disableZoom: true,
        ),
        // child: Image.asset('lib/images/hattefjaell-office-chair-with-armrests-gunnared-medium-grey-white__1019093_pe831300_s5-2.avif'),
      ),
    );
  }
}
