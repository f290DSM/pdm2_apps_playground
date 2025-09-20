import 'dart:developer';

abstract interface class UseCase<P, R> {
  void execute({required P params, required R callback});
}

abstract interface class Callback<R> {
  void onSuccess(R response);
  void onError(Exception exception);
}

class TestUseCase implements UseCase<int, Callback<List<String>>> {
  final Repository repository;

  TestUseCase({required this.repository});

  @override
  void execute({required int params, required Callback callback}) {
    try {
      callback.onSuccess(repository.getFeedArticles(params));
    } catch (e) {
      callback.onError(Exception(e.toString()));
    }
  }
}

class Repository {
  List<String> getFeedArticles(int id) {
    return ['article1', 'article2', 'article3'];
  }
}

class UseCasePresenter implements Callback<List<String>> {
  final TestUseCase usecase;

  UseCasePresenter({required this.usecase});

  void fetchItems(int id) {
    usecase.execute(params: id, callback: this);
  }

  @override
  void onError(Exception exception) {
    log(exception.toString());
  }

  @override
  void onSuccess(List<String> response) {
    log('$response');
  }
}

void main(List<String> args) {
  final repository = Repository();
  final usecase = TestUseCase(repository: repository);
  final presenter = UseCasePresenter(usecase: usecase);

  presenter.fetchItems(1);
}
