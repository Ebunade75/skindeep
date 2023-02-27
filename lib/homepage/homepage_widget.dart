import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'homepage_model.dart';
export 'homepage_model.dart';

class HomepageWidget extends StatefulWidget {
  const HomepageWidget({Key? key}) : super(key: key);

  @override
  _HomepageWidgetState createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  late HomepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomepageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFFA67557),
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, -0.6),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                              child: Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      color: Color(0x33302B2B),
                                      offset: Offset(0, 2),
                                      spreadRadius: 3,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: 342.2,
                                    child: Stack(
                                      children: [
                                        if (_model.uploadedFileUrl != '')
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0.01),
                                            child: FlutterFlowMediaDisplay(
                                              path: _model.uploadedFileUrl,
                                              imageBuilder: (path) => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: CachedNetworkImage(
                                                  imageUrl: path,
                                                  width: 200,
                                                  height: 200,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              videoPlayerBuilder: (path) =>
                                                  FlutterFlowVideoPlayer(
                                                path: path,
                                                width: 300,
                                                autoPlay: false,
                                                looping: true,
                                                showControls: true,
                                                allowFullScreen: true,
                                                allowPlaybackSpeedMenu: false,
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, 1.61),
                                          child: Container(
                                            width: 90,
                                            height: 90,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.04, 1.29),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: Icon(
                                              Icons.drive_folder_upload,
                                              color: Color(0xFFA67557),
                                              size: 50,
                                            ),
                                            onPressed: () async {
                                              final selectedMedia =
                                                  await selectMedia(
                                                maxWidth: 224.00,
                                                maxHeight: 224.00,
                                                includeDimensions: true,
                                                mediaSource:
                                                    MediaSource.photoGallery,
                                                multiImage: false,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() => _model
                                                    .isMediaUploading = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];
                                                var downloadUrls = <String>[];
                                                try {
                                                  showUploadMessage(
                                                    context,
                                                    'Uploading file...',
                                                    showLoading: true,
                                                  );
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  _model.isMediaUploading =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFile =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl =
                                                        downloadUrls.first;
                                                  });
                                                  showUploadMessage(
                                                      context, 'Success!');
                                                } else {
                                                  setState(() {});
                                                  showUploadMessage(context,
                                                      'Failed to upload media');
                                                  return;
                                                }
                                              }

                                              final uploadsCreateData =
                                                  createUploadsRecordData(
                                                photoUrl:
                                                    _model.uploadedFileUrl,
                                              );
                                              await UploadsRecord.createDoc(
                                                      currentUserReference!)
                                                  .set(uploadsCreateData);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.03, 0.32),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Predict',
                                options: FFButtonOptions(
                                  width: 143.1,
                                  height: 55.3,
                                  color: Color(0xFFA67557),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 1.45),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 40, 20, 20),
                              child: Container(
                                width: 363.9,
                                height: 482.5,
                                constraints: BoxConstraints(
                                  maxHeight: 500,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
