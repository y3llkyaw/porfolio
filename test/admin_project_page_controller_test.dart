import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:porfolio_yhk/app/controllers/admin_project_page_controller.dart';
import 'package:porfolio_yhk/app/data/models/project_model.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

class MockQuerySnapshot extends Mock
    implements QuerySnapshot<Map<String, dynamic>> {}

class MockQueryDocumentSnapshot extends Mock
    implements QueryDocumentSnapshot<Map<String, dynamic>> {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AdminProjectPageController controller;
  late MockFirestore mockFirestore;
  late MockCollectionReference mockCollectionReference;
  late MockDocumentReference mockDocumentReference;

  setUp(() {
    mockFirestore = MockFirestore();
    mockCollectionReference = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();

    // You need to mock the collection().doc() call for onInit
    when(mockFirestore.collection('projects'))
        .thenReturn(mockCollectionReference);
    when(mockCollectionReference.orderBy('createdAt', descending: true))
        .thenReturn(mockCollectionReference);
    when(mockCollectionReference.snapshots())
        .thenAnswer((_) => const Stream.empty());

    controller = AdminProjectPageController();
    controller.onInit();
  });

  group('AdminProjectPageController', () {
    test('fetchProjects should update projects list', () {
      final mockQuerySnapshot = MockQuerySnapshot();
      final mockDocumentSnapshot = MockQueryDocumentSnapshot();

      when(mockCollectionReference.orderBy('createdAt', descending: true))
          .thenReturn(mockCollectionReference);
      when(mockCollectionReference.snapshots())
          .thenAnswer((_) => Stream.value(mockQuerySnapshot));
      when(mockQuerySnapshot.docs).thenReturn([mockDocumentSnapshot]);
      when(mockDocumentSnapshot.data()).thenReturn({
        'title': 'Test Project',
        'url': 'http://test.com',
        'githubUrl': 'http://github.com/test',
        'tags': ['flutter', 'firebase'],
        'description': 'Test description',
        'createdAt': Timestamp.now(),
      });
      when(mockDocumentSnapshot.id).thenReturn('123');

      controller.fetchProjects();

      expect(controller.isLoading.value, true);
    });

    test('addProject should add a new project', () async {
      final project = Project(
        title: 'Test Project',
        url: 'http://test.com',
        githubUrl: 'http://github.com/test',
        tags: ['flutter', 'firebase'],
        description: 'Test description',
      );

      when(mockCollectionReference.add(any)).thenAnswer((_) async => mockDocumentReference);

      await controller.addProject(project);

      verify(mockCollectionReference.add(project.toFirestore())).called(1);
    });

    test('updateProject should update an existing project', () async {
      final project = Project(
        id: '123',
        title: 'Updated Project',
        url: 'http://test.com',
        githubUrl: 'http://github.com/test',
        tags: ['flutter', 'firebase'],
        description: 'Test description',
      );

      when(mockCollectionReference.doc(project.id))
          .thenReturn(mockDocumentReference);
      when(mockDocumentReference.update(any)).thenAnswer((_) async {});

      await controller.updateProject(project);

      verify(mockDocumentReference.update(project.toFirestore())).called(1);
    });

    test('deleteProject should delete a project', () async {
      const projectId = '123';

      when(mockCollectionReference.doc(projectId))
          .thenReturn(mockDocumentReference);
      when(mockDocumentReference.delete()).thenAnswer((_) async {});

      await controller.deleteProject(projectId);

      verify(mockDocumentReference.delete()).called(1);
    });
  });
}

