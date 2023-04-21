import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/core/providers/firebase_provider.dart';
import 'package:reddit/features/community/repo/community_repo.dart';

final communityRepProvider = Provider((ref) {
  return CommunityRepo(firestore: ref.watch(firebaseProvider));
});
