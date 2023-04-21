import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/community/controller/providers/community_controller_provider.dart';

final searchCommunityProvider = StreamProvider.family((ref, String query) {
  return ref.watch(communityControllerProvider.notifier).searchCommunity(query);
});
