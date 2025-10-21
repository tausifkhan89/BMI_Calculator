# BMI Calculator - Flutter

A clean, simple, and interactive Body Mass Index (BMI) calculator application built with Flutter. This app allows users to input their gender, height, weight, and age to compute their BMI and view their corresponding health category on a separate results page.

## 📱 Screenshots

*(Insert screenshots of your app here. A table format is great for side-by-side comparisons.)*

| Home Page (Input) | Results Page (Category) |
| :---: | :---: |
|<img width="364" height="719" alt="image" src="https://github.com/user-attachments/assets/7670c868-d6d8-42d8-ba87-874696d0d9eb" />| <img width="358" height="719" alt="image" src="https://github.com/user-attachments/assets/4d543dbf-2b62-44e4-8657-fc6c85a61fea" />|
| *Input Screen with slider* | *Results screen showing 'Normal'* |

## ✨ Features

* **Gender Selection:** Interactive cards for selecting Male or Female.
* **Height Input:** A sleek slider for height input (in cm), with a live display in feet and inches.
* **Weight & Age Input:** Easy-to-use `+` / `-` buttons for adjusting weight and age.
* **Instant Calculation:** Computes BMI using the standard formula: $weight (kg) / [height (m)]^2$.
* **Dynamic Results Page:**
    * Displays the numeric BMI score.
    * Shows the corresponding health category (e.g., Underweight, Normal, Overweight, Obese, Extreme).
    * Uses color-coding (blue, green, yellow, orange, red) for an at-a-glance understanding.
    * Displays a unique image for each BMI category.
* **Input Validation:** Prompts the user with a `SnackBar` if they try to calculate without selecting a gender.
* **Reset Function:** A dedicated button to clear all inputs and start over.

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine.

### Prerequisites

You will need the Flutter SDK installed on your machine.
* [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

### Installation & Running

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/tausifkhan89/BMI_Calculator.git
    ```

2.  **Navigate to the project directory:**
    ```bash
    cd BMI_Calculator
    ```

3.  **Get dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Create the Image Assets Folder** ⚠️
    The results page (`second_page.dart`) loads images based on the BMI category. You **must** create an `images` folder in the root of your project and add the following files:
    * `images/underweight.png`
    * `images/normal.png`
    * `images/overweight.png`
    * `images/obese.png`
    * `images/extreme.png`

5.  **Update your `pubspec.yaml`** ⚠️
    You must register your `images` folder as an asset in your `pubspec.yaml` file for Flutter to find them:

    ```yaml
    flutter:
      uses-material-design: true

      assets:
        - images/
    ```

6.  **Run the app:**
    ```bash
    flutter run
    ```

## 📂 Code Structure

Here is a brief overview of the key files provided:

* **`lib/pages/home_page.dart`**: The main screen for user input (gender, height, weight, age). Contains all the logic for input selection and navigation.
* **`lib/pages/second_page.dart`**: The results screen that receives the calculated BMI. It determines the correct category, color, and image to display.
* **`lib/utils/constants.dart`**: Contains shared colors, text styles, and padding constants for consistent styling across the app.
* **`lib/main.dart`**: The entry point of the app, which should run `HomePage`.
