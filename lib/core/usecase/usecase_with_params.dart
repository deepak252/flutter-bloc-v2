abstract class UseCaseWithParams<Type, Params> {
  Future<Type> call(Params params);
}
