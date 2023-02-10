import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:udecproject/mywidget.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>
          MaterialApp(
            home: Staggerdddd(),
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
          )));
}

class Staggerdddd extends StatelessWidget {
  var icons = [
    Icons.account_box_sharp,
    Icons.account_box_sharp,
    Icons.account_box_sharp,
    Icons.account_box_sharp,
    Icons.account_box_sharp,
    Icons.account_box_sharp,
    Icons.account_box_sharp,
    Icons.account_box_sharp,
    Icons.account_box_sharp,
    Icons.account_box_sharp
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: List.generate(10, (index) {
                return StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 4,
                    child: MyCustomWidget(
                      icons: icons[index],
                      bgcolor: Colors.yellowAccent,
                    ));
              })

            // [
            // StaggeredGridTile.count(
            //     crossAxisCellCount: 2,
            //     mainAxisCellCount: 2,
            //     child: MyCustomWidget(
            //       icons: Icons.account_box_sharp,
            //       bgcolor: Colors.yellowAccent,
            //     )),
            // StaggeredGridTile.count(
            //     crossAxisCellCount: 2,
            //     mainAxisCellCount: 2,
            //     child: MyCustomWidget(
            //       icons: Icons.doorbell_outlined,
            //     )),
            // StaggeredGridTile.count(
            //     crossAxisCellCount: 2,
            //     mainAxisCellCount: 3,
            //     child: MyCustomWidget(
            //       icons: Icons.food_bank,
            //     )),
            // StaggeredGridTile.count(
            //     crossAxisCellCount: 2,
            //     mainAxisCellCount: 2,
            //     child:MyCustomWidget(
            //       icons: Icons.remove_red_eye,
            //       bgcolor: Colors.red,
            //     )),
            // StaggeredGridTile.count(
            //     crossAxisCellCount: 2,
            //     mainAxisCellCount: 3,
            //     child: MyCustomWidget(
            //       icons: Icons.password,
            //     )),
            // StaggeredGridTile.count(
            //     crossAxisCellCount: 2,
            //     mainAxisCellCount: 3,
            //     child: MyCustomWidget(
            //       icons: Icons.flag_circle,
            //     ))
            // ],
          ),
        ),
      ),
    );
  }
}
