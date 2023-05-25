// ignore_for_file: use_build_context_synchronously

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hcm23_03/features/global/data/entities/hcm23_user.dart';
import 'package:hcm23_03/features/global/data/repo/auth_repo.dart';

import '../../../shared/shared_ui/dialogs/hcm23_dialog.dart';
import '../../global/cubit/auth_cubit.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RegisterCubit()
      : super(const RegisterState(
          hidePassword: true,
        ));

  void registerWithUsernameAndPw(BuildContext ctx) async {
    EasyLoading.show();
    final Either<String, UserCredential> userCre =
        await AuthRepo.createUserWithEmailAndPassword(
      email: usernameController.text,
      password: passwordController.text,
    );
    if (userCre is Right<String, UserCredential>) {
      final DatabaseReference ref = ctx
          .read<AuthCubit>()
          .state
          .db
          .ref("users/${userCre.value.user?.uid}");
      ref.set(UserX.default$(
              uid: userCre.value.user?.uid ?? "",
              email: userCre.value.user?.email ?? "")
          .toMap());

      final DatabaseReference ref2 = ctx
          .read<AuthCubit>()
          .state
          .db
          .ref("tasks/${userCre.value.user?.uid}");
      ref2.set(json);

      ctx.read<AuthCubit>().loginWithUsernameAndPw(
            username: usernameController.text,
            password: passwordController.text,
            ctx: ctx,
            rememberAccount: true,
          );
    } else if (userCre is Left<String, UserCredential>) {
      showDialog(
        context: ctx,
        builder: (context) => HCM23Dialog(
          title: 'Error',
          content: userCre.value,
          backgroundColor: Colors.red.withOpacity(0.4),
          titleTextStyle: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          contentTextStyle: const TextStyle(fontSize: 16, color: Colors.white),
          actions: [
            CleanDialogActionButtons(
              actionTitle: 'OK',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }

    EasyLoading.dismiss();
  }

  void toogleHidePassword() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }
}

var json = [
  {
    "uid": "735da0c2-6c27-4fc0-b67e-0c0c9100c8da",
    "title": "Nancy Hicks",
    "description": "rediscovery slide site conclusion safari answer ",
    "createdAt": 1685116085942,
    "modifiedAt": 1684859261207,
    "startTime": 1685312484359,
    "dueTime": 1685064651534,
    "teamMembers": [
      {
        "uid": "91604b68-5560-4afd-b785-7e3e09243962",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "adb58416-34c0-4c15-aa1c-9a0e98207526",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "cb04f661-3b65-442e-98f9-ebffff6245b2",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "61d53def-1fb1-48cd-b1d5-966a66a7ac1b",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "34e585e6-c598-47cd-98ca-fd848f2b272d",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "f443fc55-6c34-4249-810a-c733aa073e39",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "e5502d6e-06a3-4418-be79-5353c44e98db",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "6d70adae-0d8d-415c-9bd1-a5b743ad739c",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      }
    ],
    "taskStages": [
      {
        "uid": "1a053a63-3d5d-42cf-99cb-07ecda87957b",
        "isDone": false,
        "description": "attendance principal ",
        "active": false
      },
      {
        "uid": "595d61e4-e8e8-4bad-a8d9-7aba7123ee27",
        "isDone": false,
        "description": "aspect tell ",
        "active": false
      },
      {
        "uid": "d805e692-604e-48bc-80d3-48073fccb7a0",
        "isDone": false,
        "description": "weeder copywriter ",
        "active": false
      },
      {
        "uid": "fcc9f573-3179-43c3-ab6a-da03ec6f4d9e",
        "isDone": true,
        "description": "ban placement ",
        "active": true
      },
      {
        "uid": "b3cde104-aed7-4ef9-a114-f1425b1c5cc1",
        "isDone": true,
        "description": "switchboard conspirator ",
        "active": false
      },
      {
        "uid": "65dc9f61-2a83-489d-a9fe-0c11a32b427c",
        "isDone": true,
        "description": "condominium gloom ",
        "active": true
      },
      {
        "uid": "7a98c2ed-4679-4f7c-b84d-3c2e852b1452",
        "isDone": true,
        "description": "review essence ",
        "active": false
      },
      {
        "uid": "1a04e935-04f8-4802-96f9-524a62e6a76c",
        "isDone": false,
        "description": "skill hatchet ",
        "active": false
      },
      {
        "uid": "a305bc66-34b2-47d0-b235-7d903f6be001",
        "isDone": false,
        "description": "grey restroom ",
        "active": true
      }
    ],
    "active": true
  },
  {
    "uid": "4b69bb1f-ce23-4c02-b03c-f25ad0b86b0c",
    "title": "Marx Cardenas",
    "description": "morning nutmeg stepping-stone hemisphere step-son raffle ",
    "createdAt": 1684894824781,
    "modifiedAt": 1685440719718,
    "startTime": 1685021528984,
    "dueTime": 1685070297127,
    "teamMembers": [
      {
        "uid": "7c553a64-c15b-4589-a22c-f0c86ebe5b71",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "00b1cbfd-178a-482b-a918-aa1c87e48aa7",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "c2f0c579-efdd-4a1d-8972-8adbd661dd8c",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "f286c320-496d-48b6-8aaa-34d0009f278b",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "d7c92319-882e-4e58-be0d-c0236568eed3",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "e4bdd99c-d0f7-4a7b-b578-e55cce797d64",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      }
    ],
    "taskStages": [
      {
        "uid": "87b340a8-1aee-494a-af4f-e6ef6811bd76",
        "isDone": false,
        "description": "axis publicity ",
        "active": true
      },
      {
        "uid": "1e68339f-ee9d-418f-a6e0-cda0350929af",
        "isDone": true,
        "description": "gamma-ray quince ",
        "active": false
      },
      {
        "uid": "de649211-d3fb-4c36-9920-a0a0414e0877",
        "isDone": true,
        "description": "bonfire gamma-ray ",
        "active": true
      },
      {
        "uid": "a645d29e-2c26-4e91-8064-5c959940ab77",
        "isDone": true,
        "description": "tsunami turkey ",
        "active": true
      },
      {
        "uid": "5fa57bed-072a-463e-a690-4cdedbc39ad7",
        "isDone": false,
        "description": "photographer sturgeon ",
        "active": false
      }
    ],
    "active": true
  },
  {
    "uid": "e6a1aedd-e1bc-4b71-a76c-106fd38ebb72",
    "title": "Roxie Addington",
    "description": "soybean sprinter distortion footnote ride subroutine ",
    "createdAt": 1685099897952,
    "modifiedAt": 1685388310263,
    "startTime": 1684815584627,
    "dueTime": 1684704768943,
    "teamMembers": [
      {
        "uid": "723202d4-e855-4ecc-bf5e-9146cf07ba1d",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "f9c209de-5f85-4ce4-8c40-8f3a87630ecd",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "827c60f5-40fe-4a5d-a1c8-62abc76404de",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      }
    ],
    "taskStages": [],
    "active": false
  },
  {
    "uid": "9df928a7-b7f5-4fb2-9404-56a735e6c668",
    "title": "Evon Carver",
    "description": "behest gander weekend sofa plumber prevention ",
    "createdAt": 1684763057129,
    "modifiedAt": 1685270143765,
    "startTime": 1685290632711,
    "dueTime": 1685329590730,
    "teamMembers": [
      {
        "uid": "c71cde99-acae-463c-9600-b0da7ca57520",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "9090b483-bdfa-48ba-8eb6-4587e14e8a80",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "c0cc83c9-df24-4d82-8bb3-dea9053efc78",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "f42d3744-6c63-45cc-ab43-1add75d14184",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "ba60981b-5979-4463-ba86-5e894e81b90b",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "dbce491b-7fb6-4618-a990-cba975695962",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "1d4ace72-95d1-4209-b83e-6296635457d5",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "5bac0747-99a9-4394-8f05-5334549e9f77",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      }
    ],
    "taskStages": [
      {
        "uid": "4c11ba99-fa95-40a6-bed0-7e91db866191",
        "isDone": true,
        "description": "inventor show-stopper ",
        "active": false
      },
      {
        "uid": "fb777f70-5270-4b93-b228-518af0272404",
        "isDone": true,
        "description": "estuary access ",
        "active": true
      }
    ],
    "active": true
  },
  {
    "uid": "dcc4b1e6-0c42-469d-aa0c-8b83fa591ed9",
    "title": "Cecelia Mcknight",
    "description":
        "partnership rehospitalization plow chit-chat window restriction ",
    "createdAt": 1685310940206,
    "modifiedAt": 1685017383687,
    "startTime": 1685408462755,
    "dueTime": 1685062084668,
    "teamMembers": [],
    "taskStages": [
      {
        "uid": "0a568a12-209f-44d3-b412-024e97bc3c34",
        "isDone": false,
        "description": "cricketer omega ",
        "active": false
      },
      {
        "uid": "2fd7b6e5-58c3-4576-9b59-573ddf2ec28f",
        "isDone": true,
        "description": "bower fresco ",
        "active": false
      },
      {
        "uid": "03020012-c3bb-4b0d-963c-04fe6ccc5275",
        "isDone": true,
        "description": "bran snowboarding ",
        "active": true
      },
      {
        "uid": "aa62f0e3-1597-4f1e-b4bd-4e3d579dd2a3",
        "isDone": false,
        "description": "faculty firm ",
        "active": true
      },
      {
        "uid": "f56867a8-8630-4cdd-ac72-ccb7c88f051f",
        "isDone": false,
        "description": "jam wagon ",
        "active": false
      },
      {
        "uid": "b12bd684-79e2-4fb7-84f7-1f947ac9b402",
        "isDone": true,
        "description": "family relief ",
        "active": true
      },
      {
        "uid": "975f74de-2bfa-4ee7-81a7-1a699af3d340",
        "isDone": false,
        "description": "television dogwood ",
        "active": false
      },
      {
        "uid": "feb8dab3-0482-4000-9a13-eeb3a246e219",
        "isDone": false,
        "description": "genetics mother-in-law ",
        "active": false
      }
    ],
    "active": false
  },
  {
    "uid": "ac81fe0c-2f46-4eb1-9710-f7faed952a62",
    "title": "Tu Gonzales",
    "description": "ripple shred moon ivory vaulting treaty ",
    "createdAt": 1685132994838,
    "modifiedAt": 1685386533118,
    "startTime": 1684814778663,
    "dueTime": 1685352655939,
    "teamMembers": [
      {
        "uid": "599c647c-39a2-424d-a8ec-9975a62b7f19",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "a0eedbe8-3f5d-4c03-879d-fd64b5cf6382",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "a5c78dbb-a16c-47d5-ae63-938c1e1cf6c8",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "44a55a82-6a35-448c-b701-9a60b1c0737a",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "816ee5f8-5999-461b-8db4-33deef98e8e7",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "9fbbdf03-b5b1-43cd-b1a9-e1d319a88bf8",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "e4313c21-58a3-4a65-a57f-ec789c046420",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      }
    ],
    "taskStages": [
      {
        "uid": "cf608f78-ca34-492f-ab42-5a27d6c5a924",
        "isDone": true,
        "description": "pseudocode algorithm ",
        "active": false
      },
      {
        "uid": "283b8d6f-40e6-4104-802a-5b7b687bfbf0",
        "isDone": true,
        "description": "technology kindness ",
        "active": true
      },
      {
        "uid": "2d880f2a-6b65-413e-aab3-2a983abf00e9",
        "isDone": true,
        "description": "harvest ziggurat ",
        "active": false
      },
      {
        "uid": "5b8abe66-a2bc-4642-9cce-ab5b657feb66",
        "isDone": false,
        "description": "guacamole dad ",
        "active": false
      },
      {
        "uid": "326fe6a9-0d81-43b7-8a9c-0f885f180ab7",
        "isDone": false,
        "description": "matter bait ",
        "active": true
      },
      {
        "uid": "35ade66d-b145-4b02-9130-65cfff6bdc0b",
        "isDone": false,
        "description": "yolk idiot ",
        "active": true
      },
      {
        "uid": "52ef9bf6-7c73-4023-8366-4f1a567065e5",
        "isDone": true,
        "description": "voter pastoralist ",
        "active": true
      },
      {
        "uid": "35bfbb3b-5c0e-4c30-89ea-560f5cfd47bf",
        "isDone": false,
        "description": "desk concept ",
        "active": false
      },
      {
        "uid": "eeeebc75-34a2-45c8-bd34-75b4ecb9ddde",
        "isDone": true,
        "description": "step-father kimono ",
        "active": false
      }
    ],
    "active": true
  },
  {
    "uid": "9f1505df-9779-4144-8564-459e033953b2",
    "title": "Paris Woodward",
    "description": "carpenter emerald self saucer feel sunroom ",
    "createdAt": 1684698295887,
    "modifiedAt": 1685348054546,
    "startTime": 1684941980451,
    "dueTime": 1684807755527,
    "teamMembers": [
      {
        "uid": "03a1c98b-fdd8-49e2-9101-4f86e1efbc56",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "2c77f5d5-c4e1-4454-a66d-d0e7d1acdafd",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "e85d9b9e-bf8e-4674-9a5e-ae5391d57280",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "bfb40c10-ab22-4bc7-a4f5-d77042fef7d1",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "923af247-a80b-4f4b-b1cb-ddf2259c6072",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      }
    ],
    "taskStages": [
      {
        "uid": "cb652a55-4d7b-42a1-a38f-38d7b4a3074e",
        "isDone": false,
        "description": "adapter slate ",
        "active": false
      },
      {
        "uid": "f2b12d99-0541-4445-b42c-6c212d888040",
        "isDone": true,
        "description": "ratio disk ",
        "active": false
      },
      {
        "uid": "5684f45b-bbf3-439e-a83c-5b8e783c55a5",
        "isDone": true,
        "description": "paintwork networking ",
        "active": false
      },
      {
        "uid": "e4ff0c52-2018-4b0f-be30-35e956824635",
        "isDone": false,
        "description": "speech foundation ",
        "active": false
      },
      {
        "uid": "03d7181f-611a-4096-91a6-b0d438f3c95a",
        "isDone": false,
        "description": "creek battery ",
        "active": false
      },
      {
        "uid": "ca81b292-2144-4486-bf56-a40c6f81f1fe",
        "isDone": true,
        "description": "manner deformation ",
        "active": false
      },
      {
        "uid": "23da85a6-5ac0-4c37-aed1-f9cc157f2e24",
        "isDone": false,
        "description": "appetite giant ",
        "active": true
      },
      {
        "uid": "f584f4ee-1e9d-4925-aa18-e97db6ff3431",
        "isDone": true,
        "description": "loading moustache ",
        "active": true
      }
    ],
    "active": true
  },
  {
    "uid": "87d135e2-0d5a-4581-880e-4b47fe377dc9",
    "title": "Pandora Carr",
    "description": "mandate harpsichord reindeer identification member colt ",
    "createdAt": 1684839381553,
    "modifiedAt": 1685168516685,
    "startTime": 1684740671346,
    "dueTime": 1685038222096,
    "teamMembers": [
      {
        "uid": "810eb779-db4d-476f-b070-f002d7c39e43",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "ae0a459d-658f-49ed-93d0-d81dd1d5d4ac",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "1822ff54-45d7-4a9c-9641-42fb931fe5f6",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "70e55f0f-1ac2-40de-8663-af670958359f",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      }
    ],
    "taskStages": [],
    "active": false
  },
  {
    "uid": "95ffaa47-5ffd-4ec0-97b7-fc1557f818bd",
    "title": "DATTARAM  PARAB",
    "description": "profile array crewman cardigan bassinet guinea ",
    "createdAt": 1685007962243,
    "modifiedAt": 1684963227836,
    "startTime": 1684923372881,
    "dueTime": 1685403503046,
    "teamMembers": [
      {
        "uid": "c7b5e7ac-382d-4e9a-91d7-bc0f73a430d0",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "cb6e6b40-9484-4101-911b-e7b0a705b2eb",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "91b1c882-9eab-41a9-8bcd-6e61599455af",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "2b57ce66-238e-4db0-abbc-585fd18982c3",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "6a7b2a5c-2178-434e-83dc-fd5fdbcf61b0",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "274b7a69-44f9-4298-9082-d3d7a642810b",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      }
    ],
    "taskStages": [],
    "active": true
  },
  {
    "uid": "3a866f99-c15f-474e-ba6b-7bf660756384",
    "title": "Nicki Henry",
    "description": "hole nut day uplift flame album ",
    "createdAt": 1685259896072,
    "modifiedAt": 1684860275604,
    "startTime": 1685176975742,
    "dueTime": 1684721362917,
    "teamMembers": [
      {
        "uid": "ea534e1f-47c9-46ae-bc48-c16923465930",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      },
      {
        "uid": "d99454e9-25d1-47d3-9d77-54075b672e71",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": false
      }
    ],
    "taskStages": [
      {
        "uid": "955de01f-ac16-4ea3-8546-e1d2960ee733",
        "isDone": false,
        "description": "bombing question ",
        "active": false
      },
      {
        "uid": "335afb65-2516-4f43-a33e-4345e686e140",
        "isDone": true,
        "description": "chops payee ",
        "active": false
      },
      {
        "uid": "523e32ca-9551-4260-add1-79b1fcfb6067",
        "isDone": false,
        "description": "disguise inhabitant ",
        "active": true
      },
      {
        "uid": "40864498-316f-4506-878b-3343a94f58a7",
        "isDone": false,
        "description": "earnings jug ",
        "active": false
      },
      {
        "uid": "f11cdfab-ca9c-4238-beb2-40e22a7d4fd6",
        "isDone": true,
        "description": "chime appellation ",
        "active": true
      },
      {
        "uid": "f203925e-6944-4746-b990-1ee3af5e461b",
        "isDone": false,
        "description": "contour slime ",
        "active": false
      }
    ],
    "active": false
  },
  {
    "uid": "c99feb3f-1c04-44d5-beb8-9bf35c20092e",
    "title": "Alline Hardin",
    "description": "bandana descent crow schoolhouse metro mushroom ",
    "createdAt": 1685368809698,
    "modifiedAt": 1684940129582,
    "startTime": 1684776073817,
    "dueTime": 1684761751231,
    "teamMembers": [
      {
        "uid": "64662304-5cfe-4652-ae52-0543fd404d17",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "041ddd94-125c-45c4-9154-82703e537530",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      },
      {
        "uid": "b81c0130-f959-4674-97d7-11b1bdc0de00",
        "avatarUrl":
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/618.jpg",
        "active": true
      }
    ],
    "taskStages": [
      {
        "uid": "fc7b937e-c01a-4ed5-a59f-99bcc9fd5bac",
        "isDone": true,
        "description": "truth bracket ",
        "active": true
      },
      {
        "uid": "96781b22-da08-4c5a-8d43-b21f8249cd6f",
        "isDone": false,
        "description": "cigarette hydrolyze ",
        "active": true
      },
      {
        "uid": "791072c1-4c6d-4b93-883b-608088765f37",
        "isDone": false,
        "description": "factory gallon ",
        "active": false
      },
      {
        "uid": "30a90dda-2c3b-4bab-bf0d-f7543a5a7f6b",
        "isDone": false,
        "description": "pressurization likelihood ",
        "active": true
      },
      {
        "uid": "3e99d77e-04b6-4b27-bbcd-754a920cc53d",
        "isDone": false,
        "description": "traditionalism buying ",
        "active": false
      },
      {
        "uid": "3a40b36f-9dad-4466-bbbd-52a468a615e2",
        "isDone": false,
        "description": "tactile image ",
        "active": true
      },
      {
        "uid": "99ae54ad-e061-4ebd-bf9f-20c88baaa089",
        "isDone": true,
        "description": "minor-league sensitivity ",
        "active": false
      },
      {
        "uid": "d74243ac-9044-4b03-a701-79bc2408198c",
        "isDone": true,
        "description": "tortilla density ",
        "active": true
      }
    ],
    "active": true
  }
];
