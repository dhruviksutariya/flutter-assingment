import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import '../model/allUser.dart';

import '../model/messages.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();

  static FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _ref = FirebaseDatabase.instance.ref();
  static FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static User get user => _auth.currentUser!;

  var uuid = Uuid();

  factory FirebaseService() {
    return _instance;
  }

  FirebaseService._internal();

  createAccountWithEmailPassword(
      {required String email,
      password,
      required Function(UserCredential credential) onSuccess,
      required Function(String message) onError}) async {
    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      onSuccess(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError('The account already exists for this email.');
      }
    } catch (e) {
      onError(e.toString());
    }
  }

  signInAccountWithEmailPassword(
      {required String email,
      password,
      required Function(UserCredential credential) onSuccess,
      required Function(String message) onError}) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      onSuccess(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        onError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        onError('Wrong password provided for that user.');
      }
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<bool> saveUserCredential(AllUser user) async {
    try {
      await _ref.child("users").child(user.id).set(user.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
    required Function(UserCredential) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess(credential);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        default:
          errorMessage = 'An error occurred: ${e.message}';
      }
      onError(errorMessage);
    }
  }

  /* Stream<List<AllUser>> getAllUserStream() {
    return _ref
        .child("users")
        .onValue
        .map((event) {
      List<AllUser> allUserList = [];
      if (event.snapshot.exists) {
        Map<dynamic, dynamic> values =
        event.snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, value) {
          final user = AllUser.fromMap(value);
          allUserList.add(user);
        });
      }
      return allUserList;
    });
  }*/

  Future<List<AllUser>> loadAllUser() async {
    DataSnapshot snapshot = await _ref.child('users').get();
    List<AllUser> allUserList = [];
    if (snapshot.exists) {
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, value) {
        final user = AllUser.fromMap(value);
        allUserList.add(user);
      });
    }
    return allUserList;
  }



  /*Future<bool> sendMessage(
      {required String fromId,
      required String msg,
        required String chatRoomId,
      required BuildContext context}) async {
    try {
      if (msg != "") {
        // Send Message
        Messages messages = Messages(
            msgId: uuid.v1(),
            fromId: fromId,
            msg: msg,
            createdAt: DateTime.now().millisecondsSinceEpoch);

        ChatRoom chatRoom = ChatRoom();
        FirebaseFirestore.instance
            .collection("chatrooms")
            .doc(chatRoomId)
            .collection("messages")
            .doc(messages.msgId)
            .set(messages.toMap());

        chatRoom.lastMessage = msg;
        FirebaseFirestore.instance
            .collection("chatrooms")
            .doc(chatRoom.chatRoomId)
            .set(chatRoom.toMap());

        print('"Message Sent!"');
      }
      return true;
    } catch (e) {
      return false;
    }
  }
*/

  Future<void> sendFirstMessage(AllUser allUser, String msg, Type type) async {
    await _fireStore
        .collection('users')
        .doc(allUser.id)
        .collection('my_users')
        .doc(user.uid)
        .set({}).then((value) => sendMessage(allUser, msg, type));
  }

  String getConversationID(String id) => user.uid.hashCode <= id.hashCode
      ? '${user.uid}_$id'
      : '${id}_${user.uid}';

  Future<void> sendMessage(AllUser allUser, String msg, Type type) async {
    //message sending time (also used as id)
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    //message to send
    final Message message = Message(
        toId: allUser.id,
        msg: msg,
        read: '',
        fromId: user.uid,
        sent: time);

    final ref = _fireStore
        .collection('chats/${getConversationID(allUser.id)}/messages/');
    await ref.doc(time).set(message.toJson());
  }


  // for getting all messages of a specific conversation from firestore database
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
      {required AllUser allUser}) {
    return _fireStore
        .collection('chats/${getConversationID(allUser.id)}/messages/')
        .orderBy('sent', descending: true)
        .snapshots();
  }

  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
