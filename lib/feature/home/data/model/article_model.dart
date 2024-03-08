import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:offline_first/feature/home/data/model/source_model.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@Freezed(toJson: false)
class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    SourceModel? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}
