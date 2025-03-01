
import os
from minio import Minio
from minio.error import S3Error

client = Minio(
    'localhost:9000', 
    access_key='admin',
    secret_key='password',
    secure=False 
)

bucket_name = 'raw'
folder_path = './data/'

if not client.bucket_exists(bucket_name):
    client.make_bucket(bucket_name)

try:
    for file_name in os.listdir(folder_path):
        if file_name.endswith('.csv'):
            file_path = os.path.join(folder_path, file_name)
            client.fput_object(bucket_name, file_name, file_path)
            print(f'File {file_name} uploaded to {bucket_name}/{file_name}')
except S3Error as err:
    print(f'Error occurred: {err}')
except Exception as e:
    print(f'Unexpected error: {e}')
