# Flutter Tests Workshop
A sample project to practice unit and widget testing


# Set up launcher

Copy this example configuration into the launch configuration for the project and replace
the API key obtained from https://thecatapi.com/

{
    "configurations": [
        {
            "name": "Flutter (lib/main.dart)",
            "type": "dart",
            "request": "launch",
            "program": "lib/main.dart",
            "args": [
                "--dart-define=\"api-key=ABC123\""
            ]
        }
    ]
}
