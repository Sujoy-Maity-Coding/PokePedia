# Pokepedia App

Pokepedia is a Flutter-based application that provides detailed information about Pokémon. It features Firebase Authentication for secure user signup and login, Firestore for storing user details, and an external API for fetching Pokémon data.

## Features
- Firebase Authentication (Signup/Login)
- Firestore Database for storing user details
- Fetch Pokémon data from an API
- Cached images for better performance
- Animated UI with Lottie
- User-friendly experience with FlutterToast notifications

## Tech Stack
- **Flutter** (Dart)
- **Firebase** (Authentication, Firestore)
- **REST API** for Pokémon data

## Dependencies
```yaml
  lottie: ^3.3.1
  cloud_firestore: ^5.6.5
  firebase_auth: ^5.5.1
  firebase_core: ^3.12.1
  fluttertoast: ^8.2.12
  cached_network_image: ^3.4.1
  http: ^1.3.0
```

## API Information
Pokémon data is fetched from:
[Pokémon GO Pokédex API](https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json)

## Installation & Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/Sujoy-Maity-Coding/PokePedia.git
   ```
2. Navigate to the project directory:
   ```sh
   cd pokepedia
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Set up Firebase:
   - Create a Firebase project
   - Enable Authentication (Email & Password)
   - Add Firestore Database
   - Download `google-services.json` and place it in `android/app/`
5. Run the app:
   ```sh
   flutter run
   ```

## Contributing
Contributions are welcome! Feel free to fork the repository and submit a pull request.

## License
This project is licensed under the MIT License.

