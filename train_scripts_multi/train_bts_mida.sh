wandb login 2a9d65e893e7a362c9eb315f11d6826fcfb1a853
python -u monomulti-depth-estimation/train.py --name bts-mu2mida-comp --precision 16 --min_epochs 10 --max_epochs 50 --gpus -1 --worker 4 bts --learning_rate 1e-5 --batch_size 12 --loss silog+composite stdepthmulti --path '/mnt/hdd/dome/STDepth_data_multi_mida' --training --validation
