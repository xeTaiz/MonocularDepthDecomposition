# Monocular Depth Decomposition of Semi-Transparent Volume Renderings
This is the official PyTorch code for our Paper.

### [Project Page](https://dominikengel.com/stdepth) | [Paper](TODO) | [Pre-Print (Open Access)](https://arxiv.org/abs/2206.13282)

If you find our work useful, please cite our paper:
```bibtex
@article{engel2023stdepth,
  title={Monocular Depth Decomposition of Semi-Transparent Volume Renderings},
  author={Engel, Dominik and Hartwig, Sebastian and Ropinski, Timo},
  journal={IEEE Transactions on Visualization and Computer Graphics},
  year={2023},
  doi={10.1109/TVCG.2023.3245305},
}
```

## `mono-depth-estimation` Repository
The depth estimation networks are implemented in a [submodule](https://github.com/xeTaiz/mono-depth-estimation), so you should `git submodule update --init` after cloning this repo.
Big thanks to [Sebastian Hartwig (@kopetri)](https://github.com/kopetri) who did most of the work in compiling those methods into one repository.

## Pre-Trained weights
TODO

## Setup Docker Container
For Training:
```
docker run -it --gpus all --ipc=host -v $PWD:$PWD -w $PWD pytorch/pytorch:1.9.1-cuda11.1-cudnn8-runtime bash
apt-get install -y libsm6 libxext6 libxrender-dev libglib2.0-0 libgl1-mesa-glx git python3-opencv
pip install -r mono-depth-estimation/requirements.txt
python mono-depth-estimation/train.py ....
```
For inference and using the notebooks from this repo: 
```
docker run -it --gpus all --ipc=host -v $PWD:$PWD -w $PWD -p 9999:9999 pytorch/pytorch:1.9.1-cuda11.1-cudnn8-runtime bash
apt-get install -y libsm6 libxext6 libxrender-dev libglib2.0-0 libgl1-mesa-glx git python3-opencv
pip install -r requirements.txt
pip install -r mono-depth-estimation/requirements.txt
jupyter notebook --ip 0.0.0.0 --port 9999 --allow-root
```
If your data lives outside of this project folder, additionally mount your data folders to the containers (`-v /path/to/data:/path/inside/container`).

## Run Training
To run the training, use the `mono-depth-estimation/train.py` script. Using `--help` you should get an overview of possible arguments. 
We recommend using the above Docker setup to run those commands. Paths will have to be adjusted accordingly.
For just training depth prediciton start with this sample command (mono-depth-estimation on branch `stdepthmono`):
```
python mono-depth-estimation/train.py --min_epochs 10 --max_epochs 50 --gpus -1 --worker 4 bts --learning_rate 1e-5 --batch_size 16 --loss bts stdepth --background-depth-max --depth-method wysiwyp --path '/mnt/hdd/dome/STDepth_data4' --training --validation
```
For layered prediction start with this sample (mono-depth-estimation on branch `stdepthmulti`):
```
python mono-depth-estimation/train.py --name BTS_ours --precision 32 --gpus -1 bts --image-residuals --loss silma+composite+colorssim+fbdivergence --learning_rate 2e-5 --batch_size 32 stdepthmulti2 --single-layer --path '/mnt/hdd/dome/STDepth_data_multi_wys2' --training --validation
```
The parameters like loss weights default to the values reported in the paper.

## Relevant notebooks
- `change_viewpoint.ipynb` demonstrates novel view synthesis, creation of stereo pairs and animations
- `evaluate_depthmaps.ipynb` demonstrates network inference and evaluation by comparing with ground truth
- `generate_dataset.ipynb` shows generation of the dataset for training WITHOUT layered representations
- `generate_multidepth.ipynb` shows generation of the dataset for training of layered representations
- `generate_multidepth_bg.ipynb` further includes creating black/white-ish backgrounds with shot noise
- `predict_image.ipynb` and `predict_vessels.ipynb` demonstrates network inference on images just given as jpeg or png without any ground truth. This includes many of the presented applications, like ambient occlusion, contour and chromadepth shading.
- `visualize_depth_techniques.ipynb` creates the visualization of the different depth techniques shown in our paper
