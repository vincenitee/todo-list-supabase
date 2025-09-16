// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authFormHash() => r'f89a286c5c2aef6e98d758d1fa2f363d36453273';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AuthForm extends BuildlessAutoDisposeNotifier<AuthFormState> {
  late final String type;

  AuthFormState build(String type);
}

/// See also [AuthForm].
@ProviderFor(AuthForm)
const authFormProvider = AuthFormFamily();

/// See also [AuthForm].
class AuthFormFamily extends Family<AuthFormState> {
  /// See also [AuthForm].
  const AuthFormFamily();

  /// See also [AuthForm].
  AuthFormProvider call(String type) {
    return AuthFormProvider(type);
  }

  @override
  AuthFormProvider getProviderOverride(covariant AuthFormProvider provider) {
    return call(provider.type);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'authFormProvider';
}

/// See also [AuthForm].
class AuthFormProvider
    extends AutoDisposeNotifierProviderImpl<AuthForm, AuthFormState> {
  /// See also [AuthForm].
  AuthFormProvider(String type)
    : this._internal(
        () => AuthForm()..type = type,
        from: authFormProvider,
        name: r'authFormProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$authFormHash,
        dependencies: AuthFormFamily._dependencies,
        allTransitiveDependencies: AuthFormFamily._allTransitiveDependencies,
        type: type,
      );

  AuthFormProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final String type;

  @override
  AuthFormState runNotifierBuild(covariant AuthForm notifier) {
    return notifier.build(type);
  }

  @override
  Override overrideWith(AuthForm Function() create) {
    return ProviderOverride(
      origin: this,
      override: AuthFormProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AuthForm, AuthFormState> createElement() {
    return _AuthFormProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthFormProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AuthFormRef on AutoDisposeNotifierProviderRef<AuthFormState> {
  /// The parameter `type` of this provider.
  String get type;
}

class _AuthFormProviderElement
    extends AutoDisposeNotifierProviderElement<AuthForm, AuthFormState>
    with AuthFormRef {
  _AuthFormProviderElement(super.provider);

  @override
  String get type => (origin as AuthFormProvider).type;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
