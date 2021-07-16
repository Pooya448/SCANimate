mkdir temps
cd temps

# SMPL Files
mkdir smpl; cd smpl

gdown --id '1Pdcn7wwFbu3sLbhTtEPS2dp7qQVAw12-'
gdown --id '14d1IgUPOVLGKqQ3kj8Iva8MfcvIBIuvY'

mkdir -p ../../smpl/models/smpl
cd ../../smpl/models/smpl

rsync -r ../../../temps/smpl/ .

unzip "*.zip"
cd ../../..

# Data Files
bash download_aist_demo_motion.sh
cd temps
mkdir data; cd data

gdown --id '1Qqq5da7KbN_kWAYVdUxCDcQqhRHmMYbW'
gdown --id '1xfe7nGJPay2C-G5id3Dr7HNgsTRFl1ao'

cd ../../data

rsync -r ../temps/data/ .
unzip "*.zip"

cd ../
