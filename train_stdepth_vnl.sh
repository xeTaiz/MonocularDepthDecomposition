python mono-depth-estimation/train.py --precision 32 --max_epochs 50 --min_epochs 10 --gpus -1 --worker 4 vnl --pretrained 1 --learning_rate 1e-04 --batch_size 4 --encoder 'resnext101_32x4d_body_stride16' stdepth --depth-method $1 --path '/mnt/hdd/dome/STDepth_data3' --training --validation

