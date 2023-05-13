# Create a new Model

## Getting Started 🚀

### 1. Run the following command to install the package

- Install mason globally

    ``` dart pub global activate mason_cli ```

- Init mason in your project

    ``` mason int ```

### 2. To create a new model
``` mason make model --name <model_name> ```

This will create a new model in the `lib/features/feature_name/data/models` directory.

### 3. To create a new model with a JsonSerializable
``` mason make model --name <model_name> --j true ```

### 4. To create a new model with a copyWith method
``` mason make model --name <model_name> --c true ```

### 5. To create a new model with a JsonSerializable and copyWith method
``` mason make model --name <model_name> --j true --c true ```

## This is the structure of the model directory 📁
``` 
lib
└── features
    └── feature_name
        └── data
            └── models
                ├── model_name.dart
                └── model_name.g.dart
```