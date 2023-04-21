import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/community/controller/providers/community_controller_provider.dart';

final getCommunityByNameProvider = StreamProvider.family((ref, String name) {
  return ref
      .watch(communityControllerProvider.notifier)
      .getCommunityByName(name);
});
