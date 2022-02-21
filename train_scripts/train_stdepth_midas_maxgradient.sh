wandb login 2a9d65e893e7a362c9eb315f11d6826fcfb1a853
python mono-depth-estimation/train.py --min_epochs 10 --max_epochs 50 --gpus -1 --worker 4 midas --learning_rate 1e-5 --batch_size 16 --loss mse --pretrained 0 stdepth --depth-method max_gradient --path '/mnt/hdd/dome/STDepth_data4' --training --validation
