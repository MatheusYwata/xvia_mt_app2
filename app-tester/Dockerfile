# Dockerfile for Android Emulator and Robot Framework Testing
# ----------------------------------------------------------

FROM registry-gitlab.mti.mt.gov.br/docker-images/ubuntu

# Install required tools
# Node.js and npm for Appium, Python for Robot Framework, ADB for Android device management
RUN apt-get update && \
    apt-get install -y nodejs npm python3-pip android-tools-adb python3-venv nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* # Clean up apt cache to reduce image size

# Set up environment
WORKDIR /
COPY ./requirements.txt ./requirements.txt

# Install Appium and Robot Framework dependencies
RUN npm install -g appium && \
    python3 -m venv venv && \
    . venv/bin/activate && \
    pip3 install -r requirements.txt && \
    pip3 install robotframework robotframework-appiumlibrary firebase-admin requests

# Create directory for APK downloads
RUN mkdir -p /apps

# Copy test scripts and configuration files
COPY ./test_cases /tests
COPY ./resources /resources
COPY ./common /common
COPY ./data /data
COPY ./shared /shared
COPY ./config /config

# Configure Nginx to serve test reports
RUN mkdir -p /tests/results && \
    echo 'server { \
    listen 3000; \
    root /tests/results; \
    location / { \
        autoindex on; \
        try_files $uri $uri/ =404; \
    }}' > /etc/nginx/sites-available/default

# Copy entrypoint script
COPY <<EOF /entrypoint.sh
#!/bin/bash
echo "🚀 Starting Nginx to serve test reports"
nginx

echo "🚀 Starting Appium Server"
appium --log-level error &
sleep 5

echo "📱 Downloading APK from Firebase"
cd /
. venv/bin/activate
python3 -c "
import sys
from common.firebase_utils import FirebaseAppManager
firebase = FirebaseAppManager('/config/gcloud-service-account.json')
success = firebase.download_latest_apk('releases/latest', '/apps/app.apk')
if not success: 
    print('Failed to download APK from Firebase')
    sys.exit(1)
"

echo "🎯 Executing tests with Robot Framework"
robot --outputdir /tests/results /tests

echo "🔄 Keeping container alive to serve reports"
tail -f /dev/null
EOF

RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
