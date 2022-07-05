wandb login 2a9d65e893e7a362c9eb315f11d6826fcfb1a853
python monomulti-depth-estimation/train.py --min_epochs 10 --max_epochs 50 --gpus -1 --worker 4 bts --learning_rate 1e-5 --batch_size 16 --loss mse stdepthmulti --depth-method wysiwyp3 --path '/mnt/hdd/dome/STDepth_data_multi' --training --validation
