wandb login 2a9d65e893e7a362c9eb315f11d6826fcfb1a853
python -u monomulti-depth-estimation/train.py --name bts5-NoRes-Comp-cSSIM-FBDivE-1 --precision 32 --gpus -1 bts  --loss silma+composite+colorssim+fbdivergence --fbdiv-loss-weight 0.1 --learning_rate 1e-5 --batch_size 8 stdepthmulti2 --single-layer --path '/mnt/hdd/dome/STDepth_data_multi_wys2' --training --validation
python -u monomulti-depth-estimation/train.py --name bts5-NoRes-Comp-cSSIM --precision 32 --gpus -1 bts  --loss silma+composite+colorssim --learning_rate 1e-5 --batch_size 8 stdepthmulti2 --single-layer --path '/mnt/hdd/dome/STDepth_data_multi_wys2' --training --validation
