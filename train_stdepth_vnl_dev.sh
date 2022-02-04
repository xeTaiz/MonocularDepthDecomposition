python mono-depth-estimation/train.py --max-train-batches 10 --precision 32 --max_epochs 2 --min_epochs 1 --gpus -1 --worker 4 vnl --pretrained 1 --learning_rate 1e-04 --batch_size 4 --encoder 'resnext101_32x4d_body_stride16' stdepth --path '/mnt/hdd/dome/STDepth_data2' --training --validation

