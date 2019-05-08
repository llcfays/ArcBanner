import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ArcBanner extends StatelessWidget {

  List imageSrc;

  ArcBanner(this.imageSrc);

  @override
  Widget build(BuildContext context) {
    SwiperPlugin dots = const DotSwiperPaginationBuilder(
        size: 5, activeSize: 5, activeColor: Colors.blue);
    return ClipPath(
      clipper: ArcClipper(),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            imageSrc[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: imageSrc.length,
        pagination: SwiperPagination(builder: dots, margin: EdgeInsets.all(15)),
        autoplay: true,
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = Offset(size.width / 4, size.height - 8);
    var firstPoint = Offset(size.width / 2, size.height - 8);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 4), size.height - 8);
    var secondPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
