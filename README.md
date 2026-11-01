# thought_bubble

A Flutter sandbox for trying out [solidart](https://pub.dev/packages/flutter_solidart) signals and the `solid_annotations` code style, where you write plain classes with `@SolidState`, `@SolidEffect` and `@SolidEnvironment` annotations and get reactive Flutter widgets.

## What's in it

- **`source/`**: the annotated input. `source/main.dart` is a counter widget with `@SolidState` fields and a `@SolidEffect`; `source/environment.dart` shows a `Counter` class injected into a widget with `@SolidEnvironment`.
- **`lib/`**: the matching hand-converted / generated output using `flutter_solidart` directly: `Signal`, `Computed` (`doubleCounter`), `Effect`, `SignalBuilder` and `SolidProvider` for dependency injection.
- `lib/main.dart` sets `SolidartConfig.autoDispose = false`, sets up a pretty-printing `logger`, and opens the counter demo.

A commented-out `EnvironmentExample2` in `environment.dart` records an injection style that didn't work yet.

## Tech stack

- Flutter, Dart `^3.9`
- `flutter_solidart` 2.7, `solid_annotations`
- `logger`, `very_good_analysis`

## Running it

```sh
flutter pub get
flutter run
```

Compare a file in `source/` with its twin in `lib/` to see what each annotation turns into.
