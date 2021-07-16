mkdir temps
cd temps



# SMPL Files
gdown --id '1Pdcn7wwFbu3sLbhTtEPS2dp7qQVAw12-'
gdown --id '14d1IgUPOVLGKqQ3kj8Iva8MfcvIBIuvY'

mkdir -p ../smpl/models/smpl
cd ../smpl/models/smpl

rsync ../../../temps/ .

unzip "*.zip"
