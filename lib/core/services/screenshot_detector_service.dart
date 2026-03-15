import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class ScreenshotDetectorService extends GetxService {
  Future<List<AssetEntity>> getRecentScreenshots({int limit = 20}) async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth || ps.hasAccess) {
      final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        onlyAll: true,
      );

      if (albums.isNotEmpty) {
        final List<AssetEntity> images = await albums[0].getAssetListPaged(
          page: 0,
          size: limit,
        );
        
        // Filter those that are likely screenshots
        // You can check by title assuming Android defaults to "Screenshot..."
        // Or you can fetch albums again filtering for the "Screenshots" path
        return images.where((asset) => asset.title?.toLowerCase().contains("screenshot") ?? false).toList();
      }
    }
    return [];
  }
  
  Future<List<AssetEntity>> getScreenshotsAlbumAssets({int limit = 50}) async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth || ps.hasAccess) {
      final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );

      final screenshotsAlbum = albums.firstWhereOrNull((album) => album.name.toLowerCase() == "screenshots");
      
      if (screenshotsAlbum != null) {
        return await screenshotsAlbum.getAssetListPaged(page: 0, size: limit);
      }
    }
    return [];
  }
}
