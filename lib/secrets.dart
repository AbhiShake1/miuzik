import 'package:flutter_dotenv/flutter_dotenv.dart';

final supabaseUrl = dotenv.maybeGet('supabaseUrl'),
    supabaseAnonKey = dotenv.maybeGet('supabaseAnonKey');
