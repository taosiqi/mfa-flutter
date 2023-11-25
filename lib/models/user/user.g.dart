// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int? ?? 0,
      nodeId: json['node_id'] as String? ?? '',
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
      private: json['private'] as bool? ?? false,
      topics: (json['topics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      permissions:
          Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
      securityAndAnalysis: SecurityAndAnalysis.fromJson(
          json['security_and_analysis'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'owner': instance.owner.toJson(),
      'private': instance.private,
      'topics': instance.topics,
      'permissions': instance.permissions.toJson(),
      'security_and_analysis': instance.securityAndAnalysis.toJson(),
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      login: json['login'] as String? ?? '',
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'login': instance.login,
    };

Permissions _$PermissionsFromJson(Map<String, dynamic> json) => Permissions(
      admin: json['admin'] as bool? ?? false,
      push: json['push'] as bool? ?? false,
      pull: json['pull'] as bool? ?? false,
    );

Map<String, dynamic> _$PermissionsToJson(Permissions instance) =>
    <String, dynamic>{
      'admin': instance.admin,
      'push': instance.push,
      'pull': instance.pull,
    };

AdvancedSecurity _$AdvancedSecurityFromJson(Map<String, dynamic> json) =>
    AdvancedSecurity(
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$AdvancedSecurityToJson(AdvancedSecurity instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

SecretScanning _$SecretScanningFromJson(Map<String, dynamic> json) =>
    SecretScanning(
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$SecretScanningToJson(SecretScanning instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

SecretScanningPushProtection _$SecretScanningPushProtectionFromJson(
        Map<String, dynamic> json) =>
    SecretScanningPushProtection(
      status: json['status'] as String? ?? '',
    );

Map<String, dynamic> _$SecretScanningPushProtectionToJson(
        SecretScanningPushProtection instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

SecurityAndAnalysis _$SecurityAndAnalysisFromJson(Map<String, dynamic> json) =>
    SecurityAndAnalysis(
      advancedSecurity: AdvancedSecurity.fromJson(
          json['advanced_security'] as Map<String, dynamic>),
      secretScanning: SecretScanning.fromJson(
          json['secret_scanning'] as Map<String, dynamic>),
      secretScanningPushProtection: SecretScanningPushProtection.fromJson(
          json['secret_scanning_push_protection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SecurityAndAnalysisToJson(
        SecurityAndAnalysis instance) =>
    <String, dynamic>{
      'advanced_security': instance.advancedSecurity.toJson(),
      'secret_scanning': instance.secretScanning.toJson(),
      'secret_scanning_push_protection':
          instance.secretScanningPushProtection.toJson(),
    };
