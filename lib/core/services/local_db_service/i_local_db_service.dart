abstract class ILocalDBService {
  Future<List<E>> getData<E>();
  Future<void> saveData<E>(List<E> list);
  void initWatcher<E>(void Function(List<E>) callback);
}
