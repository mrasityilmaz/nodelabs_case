// // test/services/network_service_test.dart
// import 'package:flutter_test/flutter_test.dart';
// import 'package:nodelabs_movie_case/data/dtos/user_dto/user_dto.dart';
// import 'package:nodelabs_movie_case/data/repositories/user_repository_impl.dart';
// import 'package:nodelabs_movie_case/domain/repositories/user_repository.dart';
// import 'package:nodelabs_movie_case/services/network_manager/base_models/base_response_model.dart';
// import 'package:nodelabs_movie_case/services/network_manager/network_manager.dart';
// import 'package:nodelabs_movie_case/services/token_service.dart';

// import '../mocks/mocks.mocks.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();
//   late TokenService mockTokenService;
//   late NetworkService networkService;
//   late MockFlutterSecureStorage flutterSecureStorage;
//   late UserRemoteDataSource userRemoteDataSource;
//   late UserRepository userRepository;

//   setUp(() {
//     flutterSecureStorage = MockFlutterSecureStorage();
//     mockTokenService = MockTokenService();
//     networkService = NetworkService.create(mockTokenService);
//     userRemoteDataSource = UserRemoteDataSourceImpl(networkService);
//     userRepository = UserRepositoryImpl(userRemoteDataSource);
//   });

//   group('NetworkService Tests', () {
//     group('Login API', () {
//       test('should make login request with correct parameters', () async {
//         // Arrange
//         const email = 'safa@nodelabs.com';
//         const password = '123456';

//         // Act
//         final result = await userRepository.login(email: email, password: password);

//         // Assert
//         expect(result, isA<BaseResponseModel<UserDTO>>());
//       });
//     });
//   });
// }
