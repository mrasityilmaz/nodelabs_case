import 'package:dartz/dartz.dart' as dartz;
import 'package:nodelabs_movie_case/core/errors/errors.dart';

typedef EitherOr<T> = dartz.Either<CustomException, T>;
typedef Right<T> = dartz.Right<CustomException, T>;
typedef Left<T> = dartz.Left<CustomException, T>;

extension EitherX<L, R> on dartz.Either<L, R> {
  R asRight() => (this as dartz.Right).value as R;
  L asLeft() => (this as dartz.Left).value as L;
}

extension EitherXX<R> on EitherOr<R> {
  R asRight() => (this as dartz.Right).value as R;
  CustomException asLeft() => (this as dartz.Left).value as CustomException;

  EitherOr<R> ifRight(void Function(R) onRight) {
    return fold<EitherOr<R>>(Left.new, (r) {
      onRight(r);
      return Right(r);
    });
  }

  EitherOr<R> ifLeft(void Function(CustomException) onLeft) {
    return fold<EitherOr<R>>((l) {
      onLeft(l);
      return Left(l);
    }, Right.new);
  }
}
