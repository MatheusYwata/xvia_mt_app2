import os
import firebase_admin
from firebase_admin import credentials, storage
import requests

class FirebaseAppManager:
    """Utility class to download APK files from Firebase Storage."""
    
    def __init__(self, credentials_path=None):
        """
        Initialize Firebase with credentials.
        
        Args:
            credentials_path: Path to the Firebase service account JSON file.
                              If None, attempts to use environment variables.
        """
        self.app = None
        self.bucket = None
        self.initialized = False
        
        try:
            # Initialize Firebase app
            if credentials_path and os.path.exists(credentials_path):
                cred = credentials.Certificate(credentials_path)
            else:
                # Try to use environment variables
                cred = credentials.ApplicationDefault()
                
            storage_bucket = os.getenv('FIREBASE_STORAGE_BUCKET', 'your-firebase-bucket-name.appspot.com')
            self.app = firebase_admin.initialize_app(cred, {
                'storageBucket': storage_bucket
            })
            self.bucket = storage.bucket()
            self.initialized = True
            print("Firebase initialized successfully")
        except Exception as e:
            print(f"Firebase initialization error: {e}")
    
    def download_apk(self, firebase_path, local_path='apps/app.apk'):
        """
        Download APK file from Firebase Storage.
        
        Args:
            firebase_path: Path to the APK file in Firebase Storage
            local_path: Local path to save the downloaded APK
            
        Returns:
            bool: True if download was successful, False otherwise
        """
        if not self.initialized:
            print("Firebase not initialized")
            return False
            
        try:
            # Ensure the local directory exists
            os.makedirs(os.path.dirname(local_path), exist_ok=True)
            
            # Get blob reference
            blob = self.bucket.blob(firebase_path)
            
            # Check if blob exists
            if not blob.exists():
                print(f"File {firebase_path} does not exist in Firebase Storage")
                return False
                
            # Get download URL
            url = blob.generate_signed_url(expiration=300)  # URL valid for 5 minutes
            
            # Download file
            response = requests.get(url, stream=True)
            if response.status_code == 200:
                with open(local_path, 'wb') as f:
                    for chunk in response.iter_content(chunk_size=1024):
                        f.write(chunk)
                print(f"Downloaded APK to {local_path}")
                return True
            else:
                print(f"Download failed with status code: {response.status_code}")
                return False
                
        except Exception as e:
            print(f"Error downloading APK: {e}")
            return False
    
    def download_latest_apk(self, directory_path, local_path='apps/app.apk'):
        """
        Download the latest APK from a directory in Firebase Storage.
        
        Args:
            directory_path: Directory path in Firebase Storage to look for APKs
            local_path: Local path to save the downloaded APK
            
        Returns:
            bool: True if download was successful, False otherwise
        """
        if not self.initialized:
            print("Firebase not initialized")
            return False
            
        try:
            # List all files in directory
            blobs = list(self.bucket.list_blobs(prefix=directory_path))
            
            # Filter for APK files
            apk_blobs = [blob for blob in blobs if blob.name.endswith('.apk')]
            
            if not apk_blobs:
                print(f"No APK files found in {directory_path}")
                return False
                
            # Sort by creation time, newest first
            latest_apk = sorted(apk_blobs, key=lambda x: x.time_created, reverse=True)[0]
            
            # Download the latest APK
            return self.download_apk(latest_apk.name, local_path)
                
        except Exception as e:
            print(f"Error finding latest APK: {e}")
            return False