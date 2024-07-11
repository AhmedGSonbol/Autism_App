// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `AutiSociety`
  String get autiSociety {
    return Intl.message(
      'AutiSociety',
      name: 'autiSociety',
      desc: '',
      args: [],
    );
  }

  /// `It is the graduation project of the fourth year students in the Faculty of Computers and Information, Damanhour University, Nubariya`
  String get projectDescription {
    return Intl.message(
      'It is the graduation project of the fourth year students in the Faculty of Computers and Information, Damanhour University, Nubariya',
      name: 'projectDescription',
      desc: '',
      args: [],
    );
  }

  /// `Management and Supervision`
  String get managementSupervision {
    return Intl.message(
      'Management and Supervision',
      name: 'managementSupervision',
      desc: '',
      args: [],
    );
  }

  /// `Prof. Dr. Nora Shoaib`
  String get managementSupervisor {
    return Intl.message(
      'Prof. Dr. Nora Shoaib',
      name: 'managementSupervisor',
      desc: '',
      args: [],
    );
  }

  /// `Project Members`
  String get projectMembers {
    return Intl.message(
      'Project Members',
      name: 'projectMembers',
      desc: '',
      args: [],
    );
  }

  /// `Ahmed Sonbol`
  String get member1 {
    return Intl.message(
      'Ahmed Sonbol',
      name: 'member1',
      desc: '',
      args: [],
    );
  }

  /// `Mohamed Ammar`
  String get member2 {
    return Intl.message(
      'Mohamed Ammar',
      name: 'member2',
      desc: '',
      args: [],
    );
  }

  /// `Mohamed Atef`
  String get member3 {
    return Intl.message(
      'Mohamed Atef',
      name: 'member3',
      desc: '',
      args: [],
    );
  }

  /// `Ahmed Ramadan`
  String get member4 {
    return Intl.message(
      'Ahmed Ramadan',
      name: 'member4',
      desc: '',
      args: [],
    );
  }

  /// `Mohamed Khamis`
  String get member5 {
    return Intl.message(
      'Mohamed Khamis',
      name: 'member5',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePasswordTitle {
    return Intl.message(
      'Change Password',
      name: 'changePasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message(
      'Cancel',
      name: 'cancelButton',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get updateButton {
    return Intl.message(
      'Update',
      name: 'updateButton',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPasswordLabel {
    return Intl.message(
      'Old Password',
      name: 'oldPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Required*`
  String get Required {
    return Intl.message(
      'Required*',
      name: 'Required',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordLabel {
    return Intl.message(
      'New Password',
      name: 'newPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cannot create a password less than 6 characters or numbers`
  String get newPasswordLengthError {
    return Intl.message(
      'Cannot create a password less than 6 characters or numbers',
      name: 'newPasswordLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmPasswordLabel {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password updated successfully!`
  String get updateSuccessMessage {
    return Intl.message(
      'Password updated successfully!',
      name: 'updateSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while updating the password!`
  String get updateErrorMessage {
    return Intl.message(
      'An error occurred while updating the password!',
      name: 'updateErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `No chats!`
  String get noChatsMessage {
    return Intl.message(
      'No chats!',
      name: 'noChatsMessage',
      desc: '',
      args: [],
    );
  }

  /// `No messages!`
  String get noMessages {
    return Intl.message(
      'No messages!',
      name: 'noMessages',
      desc: '',
      args: [],
    );
  }

  /// `Write something here`
  String get writeSomethingHere {
    return Intl.message(
      'Write something here',
      name: 'writeSomethingHere',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Stay`
  String get stay {
    return Intl.message(
      'Stay',
      name: 'stay',
      desc: '',
      args: [],
    );
  }

  /// `Post stayed successfully!`
  String get postStayed {
    return Intl.message(
      'Post stayed successfully!',
      name: 'postStayed',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Post deleted successfully!`
  String get postDeleted {
    return Intl.message(
      'Post deleted successfully!',
      name: 'postDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Open CV`
  String get openCV {
    return Intl.message(
      'Open CV',
      name: 'openCV',
      desc: '',
      args: [],
    );
  }

  /// `Rejected successfully`
  String get rejected {
    return Intl.message(
      'Rejected successfully',
      name: 'rejected',
      desc: '',
      args: [],
    );
  }

  /// `Accepted successfully`
  String get accepted {
    return Intl.message(
      'Accepted successfully',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `Deleted successfully`
  String get deletedSuccessfully {
    return Intl.message(
      'Deleted successfully',
      name: 'deletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `Patient`
  String get patient {
    return Intl.message(
      'Patient',
      name: 'patient',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get doctor {
    return Intl.message(
      'Doctor',
      name: 'doctor',
      desc: '',
      args: [],
    );
  }

  /// `Only the main admin can delete other admins!`
  String get onlyAdmin {
    return Intl.message(
      'Only the main admin can delete other admins!',
      name: 'onlyAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Internet connection error`
  String get connectioError {
    return Intl.message(
      'Internet connection error',
      name: 'connectioError',
      desc: '',
      args: [],
    );
  }

  /// `Login data is incorrect!`
  String get loginDataIncorrect {
    return Intl.message(
      'Login data is incorrect!',
      name: 'loginDataIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for admin approval!`
  String get loginPendingError {
    return Intl.message(
      'Waiting for admin approval!',
      name: 'loginPendingError',
      desc: '',
      args: [],
    );
  }

  /// `Complaint`
  String get complaint {
    return Intl.message(
      'Complaint',
      name: 'complaint',
      desc: '',
      args: [],
    );
  }

  /// `Complainant`
  String get whoComplaint {
    return Intl.message(
      'Complainant',
      name: 'whoComplaint',
      desc: '',
      args: [],
    );
  }

  /// `Comment added successfully`
  String get SuccessAddComment {
    return Intl.message(
      'Comment added successfully',
      name: 'SuccessAddComment',
      desc: '',
      args: [],
    );
  }

  /// `Comment deleted successfully`
  String get SuccessDeleteComment {
    return Intl.message(
      'Comment deleted successfully',
      name: 'SuccessDeleteComment',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `No comments!`
  String get noComments {
    return Intl.message(
      'No comments!',
      name: 'noComments',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a comment text!`
  String get enterCommentText {
    return Intl.message(
      'Please enter a comment text!',
      name: 'enterCommentText',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete the comment?`
  String get sureToDeleteComment {
    return Intl.message(
      'Do you want to delete the comment?',
      name: 'sureToDeleteComment',
      desc: '',
      args: [],
    );
  }

  /// `Definition`
  String get docDef {
    return Intl.message(
      'Definition',
      name: 'docDef',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Address`
  String get docClinicAddress {
    return Intl.message(
      'Clinic Address',
      name: 'docClinicAddress',
      desc: '',
      args: [],
    );
  }

  /// `Post deleted successfully`
  String get successDeletePost {
    return Intl.message(
      'Post deleted successfully',
      name: 'successDeletePost',
      desc: '',
      args: [],
    );
  }

  /// `Report added successfully`
  String get successAddReport {
    return Intl.message(
      'Report added successfully',
      name: 'successAddReport',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while adding the report`
  String get errorAddReport {
    return Intl.message(
      'An error occurred while adding the report',
      name: 'errorAddReport',
      desc: '',
      args: [],
    );
  }

  /// `Post added successfully`
  String get successAddPost {
    return Intl.message(
      'Post added successfully',
      name: 'successAddPost',
      desc: '',
      args: [],
    );
  }

  /// `Loading your data!`
  String get loadingUserData {
    return Intl.message(
      'Loading your data!',
      name: 'loadingUserData',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userName {
    return Intl.message(
      'Username',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get userEmail {
    return Intl.message(
      'Email',
      name: 'userEmail',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Test your child`
  String get testChild {
    return Intl.message(
      'Test your child',
      name: 'testChild',
      desc: '',
      args: [],
    );
  }

  /// `Our Vision`
  String get ourVision {
    return Intl.message(
      'Our Vision',
      name: 'ourVision',
      desc: '',
      args: [],
    );
  }

  /// `We aim to help parents of children with autism spectrum disorder to identify the disorder early and take the necessary actions. We also provide a platform for doctors and parents to communicate and share tips, information, and alerts. Finally, we offer educational resources for parents.`
  String get aim {
    return Intl.message(
      'We aim to help parents of children with autism spectrum disorder to identify the disorder early and take the necessary actions. We also provide a platform for doctors and parents to communicate and share tips, information, and alerts. Finally, we offer educational resources for parents.',
      name: 'aim',
      desc: '',
      args: [],
    );
  }

  /// `Our website`
  String get website {
    return Intl.message(
      'Our website',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get main {
    return Intl.message(
      'Home',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `About Autism`
  String get aboutAutism {
    return Intl.message(
      'About Autism',
      name: 'aboutAutism',
      desc: '',
      args: [],
    );
  }

  /// `Join Requests`
  String get requests {
    return Intl.message(
      'Join Requests',
      name: 'requests',
      desc: '',
      args: [],
    );
  }

  /// `Complaints`
  String get complaints {
    return Intl.message(
      'Complaints',
      name: 'complaints',
      desc: '',
      args: [],
    );
  }

  /// `Accounts`
  String get accounts {
    return Intl.message(
      'Accounts',
      name: 'accounts',
      desc: '',
      args: [],
    );
  }

  /// `What you need to know about autism in children?`
  String get screenTitle {
    return Intl.message(
      'What you need to know about autism in children?',
      name: 'screenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Autism symptoms in children`
  String get image2Description {
    return Intl.message(
      'Autism symptoms in children',
      name: 'image2Description',
      desc: '',
      args: [],
    );
  }

  /// `What is autism?`
  String get whatIsAutism {
    return Intl.message(
      'What is autism?',
      name: 'whatIsAutism',
      desc: '',
      args: [],
    );
  }

  /// `How to care for a child with autism`
  String get caringForAutisticChild {
    return Intl.message(
      'How to care for a child with autism',
      name: 'caringForAutisticChild',
      desc: '',
      args: [],
    );
  }

  /// `Autism symptoms in children`
  String get autismInChildren {
    return Intl.message(
      'Autism symptoms in children',
      name: 'autismInChildren',
      desc: '',
      args: [],
    );
  }

  /// `Autism is a neurological disorder that affects a person's ability to communicate and interact with others. A person with autism may need lifelong care. If you recently discovered that your child or a family member has this condition, you are likely wondering what steps to take next.`
  String get paragraph1 {
    return Intl.message(
      'Autism is a neurological disorder that affects a person\'s ability to communicate and interact with others. A person with autism may need lifelong care. If you recently discovered that your child or a family member has this condition, you are likely wondering what steps to take next.',
      name: 'paragraph1',
      desc: '',
      args: [],
    );
  }

  /// `Autism can be a challenging condition, especially when you are not equipped with the right information to care for someone with this disorder. If you are a parent or guardian of a child with autism, it is essential to educate yourself on the proper way to care for your child with autism.`
  String get paragraph2 {
    return Intl.message(
      'Autism can be a challenging condition, especially when you are not equipped with the right information to care for someone with this disorder. If you are a parent or guardian of a child with autism, it is essential to educate yourself on the proper way to care for your child with autism.',
      name: 'paragraph2',
      desc: '',
      args: [],
    );
  }

  /// `In this article, we offer caregiving tips that can help you provide the proper care for your child or anyone with autism. It also discusses the importance of taking care of yourself while caring for someone with autism.`
  String get paragraph3 {
    return Intl.message(
      'In this article, we offer caregiving tips that can help you provide the proper care for your child or anyone with autism. It also discusses the importance of taking care of yourself while caring for someone with autism.',
      name: 'paragraph3',
      desc: '',
      args: [],
    );
  }

  /// `Children with autism exhibit a wide range of symptoms. Autism symptoms appear differently from child to child. Sometimes, the signs of the condition can look different in girls compared to boys.`
  String get paragraph4 {
    return Intl.message(
      'Children with autism exhibit a wide range of symptoms. Autism symptoms appear differently from child to child. Sometimes, the signs of the condition can look different in girls compared to boys.',
      name: 'paragraph4',
      desc: '',
      args: [],
    );
  }

  /// `Girls with autism tend to be quieter and better at 'hiding' their symptoms, making the diagnosis of autism in girls slightly more complicated than in boys.`
  String get paragraph5 {
    return Intl.message(
      'Girls with autism tend to be quieter and better at \'hiding\' their symptoms, making the diagnosis of autism in girls slightly more complicated than in boys.',
      name: 'paragraph5',
      desc: '',
      args: [],
    );
  }

  /// `Autism symptoms also appear slightly different in younger children compared to older children. The most common symptoms of this disorder include:`
  String get paragraph6 {
    return Intl.message(
      'Autism symptoms also appear slightly different in younger children compared to older children. The most common symptoms of this disorder include:',
      name: 'paragraph6',
      desc: '',
      args: [],
    );
  }

  /// `Difficulty in maintaining eye contact with others`
  String get pa7 {
    return Intl.message(
      'Difficulty in maintaining eye contact with others',
      name: 'pa7',
      desc: '',
      args: [],
    );
  }

  /// `Difficulty communicating with others`
  String get pa8 {
    return Intl.message(
      'Difficulty communicating with others',
      name: 'pa8',
      desc: '',
      args: [],
    );
  }

  /// `Difficulty learning new things`
  String get pa9 {
    return Intl.message(
      'Difficulty learning new things',
      name: 'pa9',
      desc: '',
      args: [],
    );
  }

  /// `Problems dealing with new changes`
  String get pa10 {
    return Intl.message(
      'Problems dealing with new changes',
      name: 'pa10',
      desc: '',
      args: [],
    );
  }

  /// `Strong reactions to loud sounds and bright lights`
  String get pa11 {
    return Intl.message(
      'Strong reactions to loud sounds and bright lights',
      name: 'pa11',
      desc: '',
      args: [],
    );
  }

  /// `Displaying repetitive behaviors such as clapping hands frequently or rocking their bodies back and forth`
  String get pa12 {
    return Intl.message(
      'Displaying repetitive behaviors such as clapping hands frequently or rocking their bodies back and forth',
      name: 'pa12',
      desc: '',
      args: [],
    );
  }

  /// `How is autism diagnosed in children?`
  String get pa13 {
    return Intl.message(
      'How is autism diagnosed in children?',
      name: 'pa13',
      desc: '',
      args: [],
    );
  }

  /// `There is no specific medical test used to diagnose autism spectrum disorder in children. However, specific diagnostic tools can be used to detect autism in children as young as two years old.`
  String get pa14 {
    return Intl.message(
      'There is no specific medical test used to diagnose autism spectrum disorder in children. However, specific diagnostic tools can be used to detect autism in children as young as two years old.',
      name: 'pa14',
      desc: '',
      args: [],
    );
  }

  /// `Early diagnosis of autism spectrum disorder can facilitate early treatment, helping children with this condition to adapt better.`
  String get pa15 {
    return Intl.message(
      'Early diagnosis of autism spectrum disorder can facilitate early treatment, helping children with this condition to adapt better.',
      name: 'pa15',
      desc: '',
      args: [],
    );
  }

  /// `Some signs that doctors look for in children when trying to determine if they have autism spectrum disorder include:`
  String get pa16 {
    return Intl.message(
      'Some signs that doctors look for in children when trying to determine if they have autism spectrum disorder include:',
      name: 'pa16',
      desc: '',
      args: [],
    );
  }

  /// `- Inability to make eye contact.`
  String get pa17 {
    return Intl.message(
      '- Inability to make eye contact.',
      name: 'pa17',
      desc: '',
      args: [],
    );
  }

  /// `- Not talking by 16 months.`
  String get pa18 {
    return Intl.message(
      '- Not talking by 16 months.',
      name: 'pa18',
      desc: '',
      args: [],
    );
  }

  /// `- Talking very little or speaking in an unusual voice.`
  String get pa19 {
    return Intl.message(
      '- Talking very little or speaking in an unusual voice.',
      name: 'pa19',
      desc: '',
      args: [],
    );
  }

  /// `- Inability to communicate with their hands by the age of one.`
  String get pa20 {
    return Intl.message(
      '- Inability to communicate with their hands by the age of one.',
      name: 'pa20',
      desc: '',
      args: [],
    );
  }

  /// `- If they seem to lose social or language skills.`
  String get pa21 {
    return Intl.message(
      '- If they seem to lose social or language skills.',
      name: 'pa21',
      desc: '',
      args: [],
    );
  }

  /// `- Showing repetitive behavior such as repeating every word they hear or repeating a particular gesture repeatedly.`
  String get pa22 {
    return Intl.message(
      '- Showing repetitive behavior such as repeating every word they hear or repeating a particular gesture repeatedly.',
      name: 'pa22',
      desc: '',
      args: [],
    );
  }

  /// `What causes autism in children?`
  String get pa23 {
    return Intl.message(
      'What causes autism in children?',
      name: 'pa23',
      desc: '',
      args: [],
    );
  }

  /// `It is difficult to pinpoint the causes of autism in children or adults. However, several risk factors are believed to contribute to the development of the condition.`
  String get pa24 {
    return Intl.message(
      'It is difficult to pinpoint the causes of autism in children or adults. However, several risk factors are believed to contribute to the development of the condition.',
      name: 'pa24',
      desc: '',
      args: [],
    );
  }

  /// `Environmental and genetic factors are considered the most likely cause. There has been strong evidence linking autism to genetic factors, but no specific gene has been identified as causing this disorder. The likelihood is that many different genes can cause this condition.`
  String get pa25 {
    return Intl.message(
      'Environmental and genetic factors are considered the most likely cause. There has been strong evidence linking autism to genetic factors, but no specific gene has been identified as causing this disorder. The likelihood is that many different genes can cause this condition.',
      name: 'pa25',
      desc: '',
      args: [],
    );
  }

  /// `Research shows that the brains of children with autism appear slightly different from the brains of children who do not have this condition. In the early years, the brains of children with autism seem to grow faster than the brains of other children. It is unclear what causes this accelerated growth, but it affects how the brain functions.`
  String get pa26 {
    return Intl.message(
      'Research shows that the brains of children with autism appear slightly different from the brains of children who do not have this condition. In the early years, the brains of children with autism seem to grow faster than the brains of other children. It is unclear what causes this accelerated growth, but it affects how the brain functions.',
      name: 'pa26',
      desc: '',
      args: [],
    );
  }

  /// `Historically, vaccines have been wrongly linked to the development of autism in children. However, decades of research have debunked this idea. No vaccines can be linked to autism in children or expose them to the risk of developing the condition.`
  String get pa27 {
    return Intl.message(
      'Historically, vaccines have been wrongly linked to the development of autism in children. However, decades of research have debunked this idea. No vaccines can be linked to autism in children or expose them to the risk of developing the condition.',
      name: 'pa27',
      desc: '',
      args: [],
    );
  }

  /// `How is autism treated in children?`
  String get pa28 {
    return Intl.message(
      'How is autism treated in children?',
      name: 'pa28',
      desc: '',
      args: [],
    );
  }

  /// `There is currently no cure for autism. However, with appropriate treatment, its symptoms can be managed adequately. Treatment for autism spectrum disorder in children depends on the severity of the symptoms they experience. Below, we discuss the treatment of autism spectrum disorder in children.`
  String get pa29 {
    return Intl.message(
      'There is currently no cure for autism. However, with appropriate treatment, its symptoms can be managed adequately. Treatment for autism spectrum disorder in children depends on the severity of the symptoms they experience. Below, we discuss the treatment of autism spectrum disorder in children.',
      name: 'pa29',
      desc: '',
      args: [],
    );
  }

  /// `Medication`
  String get pa30 {
    return Intl.message(
      'Medication',
      name: 'pa30',
      desc: '',
      args: [],
    );
  }

  /// `No medication is specifically approved by the US Food and Drug Administration to treat autism. However, certain medications can be prescribed to treat specific symptoms or conditions that may have developed due to autism.`
  String get pa31 {
    return Intl.message(
      'No medication is specifically approved by the US Food and Drug Administration to treat autism. However, certain medications can be prescribed to treat specific symptoms or conditions that may have developed due to autism.',
      name: 'pa31',
      desc: '',
      args: [],
    );
  }

  /// `Some therapies`
  String get pa32 {
    return Intl.message(
      'Some therapies',
      name: 'pa32',
      desc: '',
      args: [],
    );
  }

  /// `Various forms of therapy are used to treat autism in children. The type of therapy used depends on the child's unique needs. The following therapies are the most common for treating autism:`
  String get pa33 {
    return Intl.message(
      'Various forms of therapy are used to treat autism in children. The type of therapy used depends on the child\'s unique needs. The following therapies are the most common for treating autism:',
      name: 'pa33',
      desc: '',
      args: [],
    );
  }

  /// `Occupational Therapy: Occupational therapy aims to equip children with autism with the skills needed to function in their daily lives.`
  String get pa34 {
    return Intl.message(
      'Occupational Therapy: Occupational therapy aims to equip children with autism with the skills needed to function in their daily lives.',
      name: 'pa34',
      desc: '',
      args: [],
    );
  }

  /// `Applied Behavior Analysis: Research shows that Applied Behavior Analysis is one of the most effective forms of therapy for children with autism, whether they have mild or severe symptoms. It equips children with communication and social skills to help them interact with others.`
  String get pa35 {
    return Intl.message(
      'Applied Behavior Analysis: Research shows that Applied Behavior Analysis is one of the most effective forms of therapy for children with autism, whether they have mild or severe symptoms. It equips children with communication and social skills to help them interact with others.',
      name: 'pa35',
      desc: '',
      args: [],
    );
  }

  /// `Tips for parents of children with autism`
  String get pa36 {
    return Intl.message(
      'Tips for parents of children with autism',
      name: 'pa36',
      desc: '',
      args: [],
    );
  }

  /// `Here are some tips you can use to help your child manage their condition:`
  String get pa37 {
    return Intl.message(
      'Here are some tips you can use to help your child manage their condition:',
      name: 'pa37',
      desc: '',
      args: [],
    );
  }

  /// `Stay informed about your child's autism treatment plan. This usually includes a combination of medication and therapy. With the right treatment plan, your child with autism can lead a healthy life.`
  String get pa38 {
    return Intl.message(
      'Stay informed about your child\'s autism treatment plan. This usually includes a combination of medication and therapy. With the right treatment plan, your child with autism can lead a healthy life.',
      name: 'pa38',
      desc: '',
      args: [],
    );
  }

  /// `Join local support groups. Talking to and listening to other parents of children with autism can be beneficial.`
  String get pa39 {
    return Intl.message(
      'Join local support groups. Talking to and listening to other parents of children with autism can be beneficial.',
      name: 'pa39',
      desc: '',
      args: [],
    );
  }

  /// `Don't forget to take care of yourself as well. It's very easy to become overwhelmed while trying to meet all your child's needs. However, if you are not at your best, you will not be able to provide the proper care for your child.`
  String get pa40 {
    return Intl.message(
      'Don\'t forget to take care of yourself as well. It\'s very easy to become overwhelmed while trying to meet all your child\'s needs. However, if you are not at your best, you will not be able to provide the proper care for your child.',
      name: 'pa40',
      desc: '',
      args: [],
    );
  }

  /// `Look for early signs of the condition in your children. Having one child with autism means subsequent children are at higher risk of being born with the condition, so it's important to visit a specialist.`
  String get pa41 {
    return Intl.message(
      'Look for early signs of the condition in your children. Having one child with autism means subsequent children are at higher risk of being born with the condition, so it\'s important to visit a specialist.',
      name: 'pa41',
      desc: '',
      args: [],
    );
  }

  /// `Raising a child with autism can be challenging at times. While Autism Spectrum Disorder can be managed with appropriate treatment, there is no cure. This means it is a lifelong condition that people who have it need to manage continuously.`
  String get pa42 {
    return Intl.message(
      'Raising a child with autism can be challenging at times. While Autism Spectrum Disorder can be managed with appropriate treatment, there is no cure. This means it is a lifelong condition that people who have it need to manage continuously.',
      name: 'pa42',
      desc: '',
      args: [],
    );
  }

  /// `Some videos`
  String get pa43 {
    return Intl.message(
      'Some videos',
      name: 'pa43',
      desc: '',
      args: [],
    );
  }

  /// `Useful videos discussing Autism Spectrum Disorder in Arabic`
  String get pa44 {
    return Intl.message(
      'Useful videos discussing Autism Spectrum Disorder in Arabic',
      name: 'pa44',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_screen_title {
    return Intl.message(
      'Login',
      name: 'login_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `To your Autism Community account`
  String get login_screen_subtitle {
    return Intl.message(
      'To your Autism Community account',
      name: 'login_screen_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_button {
    return Intl.message(
      'Login',
      name: 'login_button',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create_account {
    return Intl.message(
      'Create',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `You can create a new account from here`
  String get create_account_description {
    return Intl.message(
      'You can create a new account from here',
      name: 'create_account_description',
      desc: '',
      args: [],
    );
  }

  /// `Please write the post content!`
  String get postContent {
    return Intl.message(
      'Please write the post content!',
      name: 'postContent',
      desc: '',
      args: [],
    );
  }

  /// `Patient Data`
  String get patientsData {
    return Intl.message(
      'Patient Data',
      name: 'patientsData',
      desc: '',
      args: [],
    );
  }

  /// `Child's Name:`
  String get patientName {
    return Intl.message(
      'Child\'s Name:',
      name: 'patientName',
      desc: '',
      args: [],
    );
  }

  /// `Child's Age:`
  String get patientAge {
    return Intl.message(
      'Child\'s Age:',
      name: 'patientAge',
      desc: '',
      args: [],
    );
  }

  /// `Autism Test`
  String get autismTest {
    return Intl.message(
      'Autism Test',
      name: 'autismTest',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get none {
    return Intl.message(
      'None',
      name: 'none',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get high {
    return Intl.message(
      'High',
      name: 'high',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get low {
    return Intl.message(
      'Low',
      name: 'low',
      desc: '',
      args: [],
    );
  }

  /// `Possibility of developing autism`
  String get mayHaveAutism {
    return Intl.message(
      'Possibility of developing autism',
      name: 'mayHaveAutism',
      desc: '',
      args: [],
    );
  }

  /// `Diagnose your child now`
  String get doTestNow {
    return Intl.message(
      'Diagnose your child now',
      name: 'doTestNow',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get test {
    return Intl.message(
      'Test',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Governorate`
  String get government {
    return Intl.message(
      'Governorate',
      name: 'government',
      desc: '',
      args: [],
    );
  }

  /// `Child's Age`
  String get patienTAge {
    return Intl.message(
      'Child\'s Age',
      name: 'patienTAge',
      desc: '',
      args: [],
    );
  }

  /// `Child's Name`
  String get child_name {
    return Intl.message(
      'Child\'s Name',
      name: 'child_name',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get about {
    return Intl.message(
      'About Me',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Clinic Address`
  String get clinic_address {
    return Intl.message(
      'Clinic Address',
      name: 'clinic_address',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Add New Admin`
  String get add_admin {
    return Intl.message(
      'Add New Admin',
      name: 'add_admin',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `The name must be at least 5 characters long!`
  String get nameLimitation {
    return Intl.message(
      'The name must be at least 5 characters long!',
      name: 'nameLimitation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email!`
  String get writeCorrectEmail {
    return Intl.message(
      'Please enter a valid email!',
      name: 'writeCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `The phone number must be 11 digits!`
  String get phoneLimitation {
    return Intl.message(
      'The phone number must be 11 digits!',
      name: 'phoneLimitation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPass {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPass',
      desc: '',
      args: [],
    );
  }

  /// `Please re-enter the password correctly!`
  String get passLimitation {
    return Intl.message(
      'Please re-enter the password correctly!',
      name: 'passLimitation',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Password`
  String get editPassword {
    return Intl.message(
      'Edit Password',
      name: 'editPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get addNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'addNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get backButton {
    return Intl.message(
      'Back',
      name: 'backButton',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been created`
  String get completeAccount {
    return Intl.message(
      'Your account has been created',
      name: 'completeAccount',
      desc: '',
      args: [],
    );
  }

  /// `Parent`
  String get parent {
    return Intl.message(
      'Parent',
      name: 'parent',
      desc: '',
      args: [],
    );
  }

  /// `The phone number must be 11 digits!`
  String get phoneLengthError {
    return Intl.message(
      'The phone number must be 11 digits!',
      name: 'phoneLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email!`
  String get emailFormatError {
    return Intl.message(
      'Please enter a valid email!',
      name: 'emailFormatError',
      desc: '',
      args: [],
    );
  }

  /// `Create Password`
  String get createPassword {
    return Intl.message(
      'Create Password',
      name: 'createPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please re-enter the password correctly!`
  String get confirmPasswordError {
    return Intl.message(
      'Please re-enter the password correctly!',
      name: 'confirmPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been successfully registered`
  String get registerSuccessPatient {
    return Intl.message(
      'Your account has been successfully registered',
      name: 'registerSuccessPatient',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been successfully registered, awaiting admin approval`
  String get registerSuccessAdminApproval {
    return Intl.message(
      'Your account has been successfully registered, awaiting admin approval',
      name: 'registerSuccessAdminApproval',
      desc: '',
      args: [],
    );
  }

  /// `Registration error`
  String get registerError {
    return Intl.message(
      'Registration error',
      name: 'registerError',
      desc: '',
      args: [],
    );
  }

  /// `Upload CV`
  String get uploadCV {
    return Intl.message(
      'Upload CV',
      name: 'uploadCV',
      desc: '',
      args: [],
    );
  }

  /// `Please upload your CV first`
  String get uploadCVError {
    return Intl.message(
      'Please upload your CV first',
      name: 'uploadCVError',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations, your account has been created and now you can contribute to raising awareness and helping children with Autism Spectrum Disorder`
  String get successRegistration {
    return Intl.message(
      'Congratulations, your account has been created and now you can contribute to raising awareness and helping children with Autism Spectrum Disorder',
      name: 'successRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a country`
  String get chooseCountry {
    return Intl.message(
      'Please choose a country',
      name: 'chooseCountry',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a governorate`
  String get chooseGovernment {
    return Intl.message(
      'Please choose a governorate',
      name: 'chooseGovernment',
      desc: '',
      args: [],
    );
  }

  /// `Diagnose`
  String get Diagnose {
    return Intl.message(
      'Diagnose',
      name: 'Diagnose',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previousButton {
    return Intl.message(
      'Previous',
      name: 'previousButton',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get nextButton {
    return Intl.message(
      'Next',
      name: 'nextButton',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finishButton {
    return Intl.message(
      'Finish',
      name: 'finishButton',
      desc: '',
      args: [],
    );
  }

  /// `Please select an answer first`
  String get selectAnswerFirst {
    return Intl.message(
      'Please select an answer first',
      name: 'selectAnswerFirst',
      desc: '',
      args: [],
    );
  }

  /// `Please select a valid date!`
  String get selectValidDate {
    return Intl.message(
      'Please select a valid date!',
      name: 'selectValidDate',
      desc: '',
      args: [],
    );
  }

  /// `Please select the birth date first`
  String get selectBirthDateFirst {
    return Intl.message(
      'Please select the birth date first',
      name: 'selectBirthDateFirst',
      desc: '',
      args: [],
    );
  }

  /// `Please choose an answer first`
  String get chooseAnswerFirst {
    return Intl.message(
      'Please choose an answer first',
      name: 'chooseAnswerFirst',
      desc: '',
      args: [],
    );
  }

  /// `Perform Test`
  String get performTestButton {
    return Intl.message(
      'Perform Test',
      name: 'performTestButton',
      desc: '',
      args: [],
    );
  }

  /// `Always`
  String get always {
    return Intl.message(
      'Always',
      name: 'always',
      desc: '',
      args: [],
    );
  }

  /// `Often`
  String get often {
    return Intl.message(
      'Often',
      name: 'often',
      desc: '',
      args: [],
    );
  }

  /// `Sometimes`
  String get sometimes {
    return Intl.message(
      'Sometimes',
      name: 'sometimes',
      desc: '',
      args: [],
    );
  }

  /// `Rarely`
  String get rarely {
    return Intl.message(
      'Rarely',
      name: 'rarely',
      desc: '',
      args: [],
    );
  }

  /// `Never`
  String get never {
    return Intl.message(
      'Never',
      name: 'never',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Publish`
  String get publish {
    return Intl.message(
      'Publish',
      name: 'publish',
      desc: '',
      args: [],
    );
  }

  /// `Advice`
  String get advice {
    return Intl.message(
      'Advice',
      name: 'advice',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Question`
  String get question {
    return Intl.message(
      'Question',
      name: 'question',
      desc: '',
      args: [],
    );
  }

  /// `Write something`
  String get write_something {
    return Intl.message(
      'Write something',
      name: 'write_something',
      desc: '',
      args: [],
    );
  }

  /// `Write`
  String get write {
    return Intl.message(
      'Write',
      name: 'write',
      desc: '',
      args: [],
    );
  }

  /// `Write post content`
  String get post_content_hint {
    return Intl.message(
      'Write post content',
      name: 'post_content_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please write the post content!`
  String get please_write_post_text {
    return Intl.message(
      'Please write the post content!',
      name: 'please_write_post_text',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message(
      'Post',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Child's Age`
  String get childAge {
    return Intl.message(
      'Child\'s Age',
      name: 'childAge',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `No data!`
  String get noData {
    return Intl.message(
      'No data!',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Ethnicity`
  String get ethnicity {
    return Intl.message(
      'Ethnicity',
      name: 'ethnicity',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get yourPosts {
    return Intl.message(
      'Posts',
      name: 'yourPosts',
      desc: '',
      args: [],
    );
  }

  /// `Child`
  String get yourChild {
    return Intl.message(
      'Child',
      name: 'yourChild',
      desc: '',
      args: [],
    );
  }

  /// `You`
  String get you {
    return Intl.message(
      'You',
      name: 'you',
      desc: '',
      args: [],
    );
  }

  /// `Saves`
  String get saves {
    return Intl.message(
      'Saves',
      name: 'saves',
      desc: '',
      args: [],
    );
  }

  /// `Select the type of abuse in the post`
  String get reportKind {
    return Intl.message(
      'Select the type of abuse in the post',
      name: 'reportKind',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect information`
  String get incorrectInfo {
    return Intl.message(
      'Incorrect information',
      name: 'incorrectInfo',
      desc: '',
      args: [],
    );
  }

  /// `Verbal abuse`
  String get VerbalAbuse {
    return Intl.message(
      'Verbal abuse',
      name: 'VerbalAbuse',
      desc: '',
      args: [],
    );
  }

  /// `Annoying`
  String get annoying {
    return Intl.message(
      'Annoying',
      name: 'annoying',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Please choose the complaint!`
  String get chooseComplaint {
    return Intl.message(
      'Please choose the complaint!',
      name: 'chooseComplaint',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete the post?`
  String get deletePost {
    return Intl.message(
      'Do you want to delete the post?',
      name: 'deletePost',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
