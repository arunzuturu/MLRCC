import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlrcc/config/config.dart';
import 'package:mlrcc/core/core.dart';
import 'package:mlrcc/modals/explore_modal.dart';

/// A provider that creates an instance of the [ExploreAPI] class.
final exploreAPIProvider = Provider((ref) => ExploreAPI());

/// A [Dio] instance that can be reused across multiple API calls.
final dio = Dio();

/// An interface for the ExploreAPI class.
abstract class IExploreAPI {
  /// Fetches a list of [ExploreModal] objects from the API.
  ///
  /// On success, a [Right] instance is returned containing a list of [ExploreModal].
  /// On failure, a [Left] instance is returned containing a [Failure] object.
  ///
  /// Throws an exception if an unexpected error occurs.
  FutureEither<List<ExploreModal>> getPosts();

  /// Creates a post on the API.
  ///
  /// [name] is the name of the post.
  /// [image] is the image file associated with the post.
  /// [photoUrl] is the URL of the photo associated with the post.
  ///
  /// On success, a [Right] instance is returned.
  /// On failure, a [Left] instance is returned containing a [Failure] object.
  ///
  /// Throws an exception if an unexpected error occurs.
  FutureEither<void> createPosts(
      final String name, final File image, final String photoUrl);
}

/// An implementation of the [IExploreAPI] interface that fetches data from an API.
class ExploreAPI implements IExploreAPI {
  /// Fetches a list of [ExploreModal] objects from the API.
  ///
  /// On success, a [Right] instance is returned containing a list of [ExploreModal].
  /// On failure, a [Left] instance is returned containing a [Failure] object.
  ///
  /// Throws an exception if an unexpected error occurs.
  @override
  FutureEither<List<ExploreModal>> getPosts() async {
    try {
      final response = await dio.get('${apiUrl}getExplore');
      final exploreData = response.data['data'] as List<dynamic>;

      // Convert the JSON data to a list of ExploreModal objects.
      final posts =
          exploreData.map((data) => ExploreModal.fromJson(data)).toList();

      // Return a Right containing the list of posts.
      return right(posts);
    } catch (e, st) {
      // If an exception occurs, throw a Failure object with the error message and stack trace.
      return left(Failure(e.toString(), st));
    }
  }

  /// Creates a post on the API.
  ///
  /// [name] is the name of the post.
  /// [image] is the image file associated with the post.
  /// [photoUrl] is the URL of the photo associated with the post.
  ///
  /// On success, a [Right] instance is returned.
  /// On failure, a [Left] instance is returned containing a [Failure] object.
  ///
  /// Throws an exception if an unexpected error occurs.
  @override
  @override
  FutureEither<void> createPosts(
      String name, File image, String photoUrl) async {
    try {
      // Get the name of the image file from its path.
      String imageName = image.path.split('/').last;

      // Create a FormData object with the image file, photo URL, and post name as fields.
      FormData data = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          image.path,
          filename: imageName,
        ),
        "photoUrl": photoUrl,
        "name": name,
      });

      // Send a POST request to the API with the FormData object as the request body.
      await dio.post('${apiUrl}postExplore', data: data);

      // Return a Right with a null value to indicate success.
      return right(null);
    } catch (e, st) {
      // If an exception occurs, throw a Failure object with the error message and stack trace.
      return left(Failure(e.toString(), st));
    }
  }
}
