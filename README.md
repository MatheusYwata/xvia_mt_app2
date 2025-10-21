# Mobile App Testing with Robot Framework

This project contains automated tests for Android mobile applications using Robot Framework and Appium.

## Prerequisites

- Python 3.11 or higher
- Android SDK/ADB
- Appium Server
- Android Emulator or real device
- Git LFS (for handling large APK files)
- Firebase project (for APK downloads)

## Firebase Integration

This project includes Firebase integration for downloading APK files automatically. The APK files are stored in Firebase Storage and downloaded before tests are executed.

### Firebase Setup

1. Firebase Service Account credentials file (JSON) placed at:
   ```
   config/gcloud-service-account.json
   ```

2. Set the Firebase Storage bucket name as an environment variable:
   ```bash
   export FIREBASE_STORAGE_BUCKET="your-firebase-bucket-name.appspot.com"
   ```

### APK Storage Structure

APKs should be stored in Firebase Storage with the following structure:
- `releases/latest/app.apk` - Latest version of the app
- `releases/{version}/app.apk` - Specific versions

### Using Firebase Integration

To use Firebase for downloading APKs, use the setup_teardown_firebase.resource file:

```robotframework
*** Settings ***
Resource  ../shared/setup_teardown_firebase.resource

*** Test Cases ***
Example Test
    Download APK From Firebase
    abrir app
    # Test steps
    fechar app
```

To download a specific version:
```robotframework
*** Test Cases ***
Test Specific Version
    Download Specific APK Version    1.0.0
    abrir app
    # Test steps
    fechar app
```

## Setup

1. Clone the repository
```bash
git clone https://gitlab.mti.mt.gov.br/transformacao-digital/app-tester.git
cd app-tester
```

2. Create and activate virtual environment
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
# OR
venv\Scripts\activate.bat  # Windows
```

3. Install dependencies
```bash
pip install -r requirements.txt
```

4. Start Appium server
```bash
appium
```

## Running Tests

### Run all tests
```bash
robot test_cases/
```

### Run a specific test file
```bash
robot test_cases/login_mobile.robot
```

### Run a specific test case
```bash
robot -t "Nome do Teste" test_cases/login_mobile.robot
```

### Run tests with tags
```bash
robot -i usuario test_cases/login_mobile.robot
```

### Generate reports in a specific directory
```bash
robot --outputdir results test_cases/
```

## Accessing Test Reports

After tests are run through the GitLab CI/CD pipeline, reports are available at the following URLs:

- **Development Environment**: https://app-tester.dev.app.cloud.mti.mt.gov.br/report.html
- **Production Environment**: https://app-tester.app.cloud.mti.mt.gov.br/report.html

You can also access the detailed logs and outputs:
- Log: https://app-tester.dev.app.cloud.mti.mt.gov.br/log.html
- Output XML: https://app-tester.dev.app.cloud.mti.mt.gov.br/output.xml

## Project Structure

- `apps/` - Contains the application APK files
- `common/` - Shared resources and variables
- `config/` - Configuration files, including Firebase credentials
- `data/` - Test data and credentials
- `resources/` - Robot Framework resource files organized by feature
- `shared/` - Common setup, teardown, and utilities
- `test_cases/` - Robot Framework test suite files

## CI/CD Pipeline

This project is configured with a GitLab CI/CD pipeline that:
1. Downloads the latest APK from Firebase Storage
2. Builds a Docker image with Appium and Robot Framework
3. Runs tests on the downloaded APK
4. Deploys to Kubernetes (optional)
5. Makes reports available via a web interface

### GitLab CI Variables

Set the following variables in GitLab CI/CD Settings:

- `FIREBASE_STORAGE_BUCKET`: Your Firebase Storage bucket name
- `GOOGLE_CLOUD_RAW_CREDENTIALS`: Google Cloud service account JSON (for deployment)
- `GCP_PROJECT_NAME`: Google Cloud project name
- `GKE_CLUSTER_NAME`: GKE cluster name
- `GKE_ZONE`: GKE zone
- `OPENSHIFT_NAMESPACE_DESENV`: OpenShift/Kubernetes namespace for development

## Working with Large Files

This project uses Git LFS to handle large APK files. Make sure to install Git LFS before cloning:

```bash
# Install Git LFS
git lfs install

# When pushing changes that include large files
git lfs push --all origin YOUR_BRANCH
```

## Troubleshooting

If you encounter issues with the test execution:

1. Check that Appium server is running
2. Verify your device/emulator is connected: `adb devices`
3. Check the app permissions on the device
4. Review credentials in the data files
5. Verify Firebase credentials and bucket name are correctly set