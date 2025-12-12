# Flutter Web Portfolio

A responsive, production-ready portfolio website built with Flutter.

## Features
- **Responsive Design**: Works on Mobile, Tablet, and Desktop.
- **Dynamic Content**: Projects loaded from local JSON.
- **Architecture**: Clean code structure with Riverpod, GoRouter, and GetIt.
- **CI/CD**: GitHub Actions workflow included.

## Project Structure
```
lib/src/
  app.dart          # Main App Widget
  routes/           # GoRouter config
  theme/            # App Theme (Colors, Fonts)
  models/           # Data models
  services/         # Data loading services
  providers/        # Riverpod providers
  ui/
    widgets/        # Reusable widgets
    sections/       # Page sections (Hero, Projects, etc.)
```

## Setup & Run

### Prerequisites
- Flutter SDK (Stable)

### Local Development
1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Run in Chrome:
   ```bash
   flutter run -d chrome
   ```

3. Run tests:
   ```bash
   flutter test
   ```

### Customization
- **Projects**: Edit `assets/data/projects.json`.
- **CV**: Replace `assets/cv/Mohamed_Shibl_CV.pdf`.
- **Images**: Add images to `assets/images/` and update `projects.json`.

## Deployment
This repo includes a GitHub Actions workflow to deploy to GitHub Pages.
1. Push to `main`.
2. The workflow in `.github/workflows/flutter_build.yml` will run.
3. It deploys `build/web` to the `gh-pages` branch.
4. Enable GitHub Pages in repo settings (Source: `gh-pages` branch).
