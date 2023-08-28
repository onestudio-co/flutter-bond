part of 'post_cubit.dart';

enum ListStatus { initial, loading, success, failed }

class ListState<T extends Model> extends Equatable {
  const ListState(this.data, this.status, this.error);

  final ListResponse<T> data;

  final ListStatus status;

  final String? error;

  factory ListState.initial() => ListState<T>(
        ListResponse<T>(data: List<T>.empty(growable: true)),
        ListStatus.initial,
        null,
      );

  ListState<T> loading() => copyWith(status: ListStatus.loading);

  ListState<T> success(ListResponse<T> newData) => copyWith(
        status: ListStatus.success,
        data: data.copyWith(
          data: List.of(data.data.followedBy(newData.data)),
          meta: newData.meta,
          links: newData.links,
        ),
      );

  ListState<T> failed(String error) => copyWith(
        status: ListStatus.failed,
        error: error,
      );

  Widget when({
    required Widget Function() initial,
    required Widget Function(List<T>, bool loading) success,
    required Widget Function(String) failed,
  }) {
    switch (status) {
      case ListStatus.initial:
        return initial();
      case ListStatus.loading:
        return success(data.data, true);
      case ListStatus.success:
        return success(data.data, false);
      case ListStatus.failed:
        return failed(error!);
    }
  }

  ListState<T> copyWith({
    ListResponse<T>? data,
    ListStatus? status,
    String? error,
  }) {
    return ListState<T>(
      data ?? this.data,
      status ?? this.status,
      error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        data,
        data.hashCode,
        data.data.length,
        status,
        error,
      ];
}
