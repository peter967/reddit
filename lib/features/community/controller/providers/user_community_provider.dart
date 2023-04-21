import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/community/controller/providers/community_controller_provider.dart';

final userCommunityProvider = StreamProvider((ref) {
  final communityController = ref.watch(communityControllerProvider.notifier);

  return communityController.getUserCommunities();
});
