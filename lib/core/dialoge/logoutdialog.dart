import 'package:flutter/material.dart';
import 'package:gleamhiring/features/logout/presentation/providers/logout_provider.dart';
import 'package:provider/provider.dart';

Future<bool> logoutDialog({required BuildContext context}) async{
  return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            title: Text('Logout'),
            content: Text('Are you sure you want to logout!'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => context.read<LogoutProvider>().hitLogout(context),
                child: Text('Logout'),
              ),
            ],
          ),
        );
}