import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class TickedShape extends StatelessWidget {
  final String image, title, local, hora, data;
  final double preco;
  TickedShape(
      {this.image, this.title, this.local, this.hora, this.data, this.preco});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset(image),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Container(
                  child: Column(
                    children: [
                      TicketRow(
                        icon: Icons.location_on_outlined,
                        label: 'Casa Nostra',
                        fontsize: 18,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TicketRow(
                              icon: Icons.watch_later_outlined,
                              label: '12:00 AM',
                              fontsize: 12,
                            ),
                          ),
                          Flexible(
                            child: TicketRow(
                              icon: Icons.date_range_outlined,
                              label: '14 FEB',
                              fontsize: 12,
                            ),
                          ),
                          Flexible(
                            child: TicketRow(
                              icon: Icons.monetization_on_outlined,
                              label: '200 MT',
                              fontsize: 12,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: BarcodeWidget(
                height: 100,
                barcode: Barcode.code128(),
                data: 'Bilhete Valido para 1',
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        height: MediaQuery.of(context).size.height / 1.49,
      ),
    );
  }
}

class TicketRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final double  fontsize;
  TicketRow({this.icon, this.label,this.fontsize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: TextStyle(fontSize: fontsize),
        ),
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height);

    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);
    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 1.5), radius: 20.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 1.5), radius: 20.0));

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
