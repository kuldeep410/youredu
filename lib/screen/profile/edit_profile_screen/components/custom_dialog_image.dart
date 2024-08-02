import 'package:flutter/material.dart';

class CustomDialogImagePicker extends StatelessWidget {
  final Function? onCameraClick;
  final Function? onGalleryClick;

  const CustomDialogImagePicker(
      {Key? key, this.onCameraClick, this.onGalleryClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: SizedBox(
        height: 210,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Select Image",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    if (onCameraClick != null) onCameraClick!();
                  },
                  child: const Column(
                    children: [
                      Icon(Icons.camera),
                      // Lottie.asset("assets/images/ic_camera.json",
                      //     height: 50, width: 50),
                      // FadeInImage.assetNetwork(
                      //   placeholder: 'assets/images/ic_loader.gif',
                      //   image:
                      //       'https://img.pikbest.com/58pic/35/39/28/82c58PICcBKIgAdeE8dI9_PIC2018.gif!c1024wm0',
                      //   height: 50,
                      //   width: 50,
                      // ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    if (onGalleryClick != null) onGalleryClick!();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Column(
                      children: [
                        Icon(Icons.browse_gallery),
                        // Lottie.asset("assets/images/ic_gallery.json",
                        //     height: 50, width: 50),
                        // FadeInImage.assetNetwork(
                        //   placeholder: 'assets/images/ic_loader.gif',
                        //   image:
                        //       'https://ps.w.org/robo-gallery/assets/icon-256x256.gif?rev=2291186',
                        //   height: 40,
                        //   width: 45,
                        // ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
