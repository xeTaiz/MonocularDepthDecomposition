wandb login 2a9d65e893e7a362c9eb315f11d6826fcfb1a853
python mono-depth-estimation/train.py --precision 32 --min_epochs 10 --max_epochs 50 --gpus -1 --worker 4 laina --learning_rate 0.0001 --batch_size 8 stdepth --depth-method wysiwyp --path '/mnt/hdd/dome/STDepth_data3' --training --validation
