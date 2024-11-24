# Netflix Clone BLoC

A Flutter-based Netflix Clone app that uses the BLoC architecture for state management and provides streaming features like video trailers, web view integration, and animations. This app is built using the **MovieDB API** to simulate Netflix-like functionality.

## Packages Used

- **BLoC**: A predictable state management solution for Flutter.
- **flutter_bloc**: Provides Flutter widgets that integrate with the BLoC pattern.
- **flutter_inappwebview**: A powerful webview package for integrating web pages within the app.
- **http**: Used for making HTTP requests to fetch data from APIs.
- **youtube_player_flutter**: To embed and play YouTube video trailers in the app.
- **shimmer**: Adds a shimmer effect for loading states.

## Features

- **YouTube Trailers**: Watch movie or series trailers via YouTube using the `youtube_player_flutter` package.
- **Web View Integration**: View web pages inside the app using the `flutter_inappwebview`.
- **State Management**: Uses the BLoC pattern to manage app state efficiently.
- **Shimmer Effect**: Provides a shimmering effect during data loading.

- **API Integration**: Fetches data from the **MovieDB API** to populate the app's content, simulating Netflix's movie and series library.

## API Integration

The app fetches movie and series data through the **MovieDB API** (The Movie Database). This API provides movie and TV series information, including trailers, images, and metadata, simulating the content available on Netflix.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/ansilmirfan/netflix_clone_bloc.git
   ```
