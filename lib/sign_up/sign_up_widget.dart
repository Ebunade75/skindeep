import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_model.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    _model.usernameController ??= TextEditingController();
    _model.emailController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
    _model.rePasswordController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Color(0xFFA67557),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(-1, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 50,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryBtnText,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
          title: Text(
            'Create an account',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  fontSize: 20,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 16),
            child: TextFormField(
              controller: _model.usernameController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                hintText: 'Should be ananymous',
                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.normal,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
              maxLines: null,
              validator:
                  _model.usernameControllerValidator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
            child: TextFormField(
              controller: _model.emailController,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                hintText: 'Enter your email',
                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.normal,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding: EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
              maxLines: null,
              keyboardType: TextInputType.emailAddress,
              validator: _model.emailControllerValidator.asValidator(context),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
            child: TextFormField(
              controller: _model.passwordController,
              obscureText: !_model.passwordVisibility,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                hintText: 'Password should conatain letter and number',
                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.normal,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                suffixIcon: InkWell(
                  onTap: () => setState(
                    () =>
                        _model.passwordVisibility = !_model.passwordVisibility,
                  ),
                  focusNode: FocusNode(skipTraversal: true),
                  child: Icon(
                    _model.passwordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Color(0xFF95A1AC),
                    size: 22,
                  ),
                ),
              ),
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
              keyboardType: TextInputType.visiblePassword,
              validator:
                  _model.passwordControllerValidator.asValidator(context),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
            child: TextFormField(
              controller: _model.rePasswordController,
              obscureText: !_model.rePasswordVisibility,
              decoration: InputDecoration(
                labelText: 'Re-enter Passwword',
                labelStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                hintText: 'Re-enter your password here...',
                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.normal,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                suffixIcon: InkWell(
                  onTap: () => setState(
                    () => _model.rePasswordVisibility =
                        !_model.rePasswordVisibility,
                  ),
                  focusNode: FocusNode(skipTraversal: true),
                  child: Icon(
                    _model.rePasswordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Color(0xFF95A1AC),
                    size: 22,
                  ),
                ),
              ),
              style: FlutterFlowTheme.of(context).subtitle1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
              validator:
                  _model.rePasswordControllerValidator.asValidator(context),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0.05),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (_model.passwordController.text !=
                      _model.rePasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Passwords don\'t match!',
                        ),
                      ),
                    );
                    return;
                  }

                  final user = await createAccountWithEmail(
                    context,
                    _model.emailController.text,
                    _model.passwordController.text,
                  );
                  if (user == null) {
                    return;
                  }

                  final usersCreateData = {
                    ...createUsersRecordData(
                      password: _model.passwordController.text,
                      displayName: _model.usernameController.text,
                      email: _model.emailController.text,
                      uid: random_data
                          .randomInteger(10000001, 99999999)
                          .toString(),
                    ),
                    'created_time': FieldValue.serverTimestamp(),
                  };
                  await UsersRecord.collection
                      .doc(user.uid)
                      .update(usersCreateData);

                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Account Created',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      duration: Duration(milliseconds: 5000),
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  );
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavBarPage(initialPage: 'Homepage'),
                    ),
                    (r) => false,
                  );
                },
                text: 'Create Account',
                options: FFButtonOptions(
                  width: 270,
                  height: 50,
                  color: Color(0xFFA67557),
                  textStyle: FlutterFlowTheme.of(context).subtitle1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                  elevation: 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
