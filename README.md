# 🧱 Bricks

[Mason][mason_link] brick templates to build no scoped projects.

## Getting started 🚀

### Install CLI 🔧

```sh
dart pub global activate mason_cli
```

### Install locally 🏠

To install brick locally, add them to your directory's `mason.yaml`:

```yaml
bricks:
  feature:
    git:
      url: https://github.com/blackminystudio/bricks
      path: feature
```

To get mason brick locally.

```sh
mason get
```

To create the feature.

```sh
mason make feature
```

### Install globally 🗺

To install one or more bricks globally, use the following command:

```sh
    mason i https://github.com/blackminystudio/bricks --path feature
```

_Note: Be sure to replace `<feature>` with one of the following bricks:_

## Available bricks 🧱

| Brick Name | Description                       |
| ---------- | --------------------------------- |
| feature    | Create an feature for fintech app |

[mason_link]: https://github.com/felangel/mason
