import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/core/providers/storage_repo_provider.dart';
import 'package:reddit/features/community/controller/community_controller.dart';
import 'package:reddit/features/community/controller/providers/community_repo_provider.dart';

final communityControllerProvider =
    StateNotifierProvider<CommunityController, bool>((ref) {
  final communityRepo = ref.watch(communityRepProvider);
  final storageRepo = ref.watch(storageRepoProvider);
  return CommunityController(
      communityRepo: communityRepo, ref: ref, storageRepo: storageRepo);
});
