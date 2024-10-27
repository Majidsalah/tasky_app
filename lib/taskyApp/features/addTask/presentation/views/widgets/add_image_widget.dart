import 'dart:io';
import 'dart:typed_data';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/taskyApp/core/utiles/app_text_styles.dart';
import 'package:task/taskyApp/core/utiles/constanst.dart';
import 'package:task/taskyApp/core/utiles/shared_prefrences.dart';
import 'package:task/taskyApp/features/addTask/presentation/manager/image_cubit/image_upload_cubit.dart';
import 'package:task/taskyApp/features/auth/presentation/views/widgets/success_widget.dart';

// ignore: must_be_immutable
class AddImageWidget extends StatefulWidget {
  AddImageWidget({super.key});
  String? _image;

  @override
  State<AddImageWidget> createState() => _AddImageWidgetState();
}

class _AddImageWidgetState extends State<AddImageWidget> {
  @override
  void initState() {
    deleteCahedImges();

    super.initState();
  }

  final ImagePicker picker = ImagePicker();

  XFile? imagePath;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageUploadCubit(),
      child: GestureDetector(
          onTap: () async {
            XFile? picked = await picker.pickImage(source: ImageSource.gallery);
            setState(() {
              imagePath = picked;
            });
          },
          child: imagePath == null
              ? DottedBorder(
                  borderType: BorderType.RRect,
                  strokeCap: StrokeCap.round,
                  color: kPrimaryColor,
                  dashPattern: const [1, 3],
                  radius: const Radius.circular(12),
                  strokeWidth: 1.2,
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_photo_alternate_outlined,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Add Image',
                          style: textStyle16.copyWith(color: kPrimaryColor),
                        )
                      ],
                    ),
                  ))
              : Column(
                  children: [
                    Center(
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                      SizedBox(
                        height: 100.h,
                        width: double.infinity,
                        child: Image.file(File(imagePath!.path)),
                      )
                    ])),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<ImageUploadCubit, ImageUploadState>(
                      builder: (context, state) {
                        if (state is ImageUploadLoading) {
                          return const LinearProgressIndicator();
                        } else if (state is ImageUploadFailed) {
                          return Column(
                            children: [
                              TextButton(
                                  onPressed: () async {
                                    setState(() {
                                      imagePath = null;
                                    });
                                    await BlocProvider.of<ImageUploadCubit>(
                                            context)
                                        .resetState();
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: textStyle16,
                                  )),
                              MessageWidget(message: state.errorMessage)
                            ],
                          );
                        } else if (state is ImageUploadSuccess) {
                          state.image = widget._image;

                          return const MessageWidget(
                              message: "Image uploaded Successfully ✔️ ");
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () async {
                                  XFile? compressedImage =
                                      await imageCompress();

                                  await BlocProvider.of<ImageUploadCubit>(
                                          context)
                                      .uploadImage(compressedImage!.path);
                                },
                                child: Text(
                                  "Upload",
                                  style: textStyle16,
                                )),
                            TextButton(
                                onPressed: () async {
                                  setState(() {
                                    imagePath = null;
                                  });
                                  await BlocProvider.of<ImageUploadCubit>(
                                          context)
                                      .resetState();
                                },
                                child: Text(
                                  "Cancel",
                                  style: textStyle16,
                                )),
                          ],
                        );
                      },
                    )
                  ],
                )),
    );
  }

  Future<XFile?> imageCompress() async {
    XFile? userImage = imagePath;
    // XFile? defaultImage =
    //     await assetImageToXFile('D:/flutterApps/task/assets/icon.png');
    XFile? imageToCompress = userImage;
    File imageFile = File(imageToCompress!.path);
    final compressedImage = await FlutterImageCompress.compressAndGetFile(
        imageFile.absolute.path, '${imageFile.absolute.path}_compressed.jpeg',
        format: CompressFormat.jpeg, quality: 30);
    return compressedImage;
  }

  Future<XFile> assetImageToXFile(String assetPath) async {
    final ByteData byteData = await rootBundle.load(assetPath);
    Uint8List imageData = byteData.buffer.asUint8List();
    return XFile.fromData(imageData);
  }

  deleteCahedImges() {
    return ShPref.delete('image');
  }
}
