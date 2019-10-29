# Flutter Hive Provider Example
A basic contact management flutter app demonstrating the use of **Provider** for state management and **Hive** for persistent data storage.

- [Hive](https://pub.dev/packages/hive)
- [Provider](https://pub.dev/packages/provider)

Every time persistent data is changed _(when a contact is added or deleted from hive)_, the provider data is refreshed from hive. The ui is updated by calling `notifyListeners();`.