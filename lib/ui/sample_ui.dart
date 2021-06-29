import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sampleui_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SampleUiPage extends StatelessWidget {
  static const String route = "sample_ui_page";

  @override
  Widget build(BuildContext context) {
    final viewModel = SampleUiViewModel();
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                color: Colors.red,
              ),
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ],
          ),
          Container(
            width: 100.w,
            height: 50.h,
            color: Colors.black,
          ),
          Column(
            children: [
              Text(
                '16sp, will not change with the system.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
                textScaleFactor: 1.0,
              ),
              Text(
                '16sp, will not change with the system.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textScaleFactor: 1.0,
              ),
            ],
          ),
          Text(
            '16sp,if data is not set in MediaQuery,my font size will change with the system.',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
// return ScreenUtilInit(
//   designSize: Size(320, 480),
//   builder:()=> Provider(
//     create: (_) => viewModel,
//     child: Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//         Container(
//           width: 50.w,
//           height: 50.w,
//           color: Colors.red,
//         ),
//           Container(
//             width: 100.w,
//             height: 50.h,
//             color: Colors.black,
//           ),
//
//         ],
//       ),
//     ),
//   ),
// );

}
