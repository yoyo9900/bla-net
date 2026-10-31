
workflows:
  android-workflow:
    name: BLA NET Android
    max_build_duration: 60
    instance_type: mac_mini_m2
    environment:
      flutter: stable
    scripts:
      - name: Prepare Flutter project
        script: |
          mkdir -p lib
          cp main.dart lib/main.dart
          flutter create --platforms=android .
          flutter pub get
      - name: Build APK
        script: flutter build apk --release
    artifacts:
      - build/app/outputs/flutter-apk/*.apk
