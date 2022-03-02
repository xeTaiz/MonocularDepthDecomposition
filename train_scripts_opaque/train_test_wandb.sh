wandb login 2a9d65e893e7a362c9eb315f11d6826fcfb1a853
python mono-depth-estimation/train.py --max-train-batches 2 --precision 32 --max_epochs 2 --min_epochs 1 --gpus -1 --worker 4 vnl --pretrained 1 --learning_rate 1e-04 --batch_size 4 --encoder 'resnext101_32x4d_body_stride16' stdepth --depth-method first_hit --path '/mnt/hdd/dome/STDepth_data_opaque' --training --validation
