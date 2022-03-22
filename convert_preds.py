import torch
import numpy as np
from torchvision.utils import save_image

from pathlib import Path
from argparse import ArgumentParser



if __name__ == '__main__':
    parser = ArgumentParser('Prediciton Converter. From .pt to .pngs')
    parser.add_argument('pred_path', type=str, help='Path to prediction .pt or folder with predictions')
    args = parser.parse_args()

    p = Path(args.pred_path)
    assert p.exists()
    if p.is_dir():
        pred_fns = [f for f in p.rglob('*.pt')]
    else:
        pred_fns = [p]

    for pred_fn in pred_fns:
        pred = torch.load(pred_fn, map_location='cpu')
        rgb_in    = pred['batch'][0].squeeze(0).float()
        targ_full = pred['batch'][1].squeeze(0).float()
        pred_full = pred['prediction'].squeeze(0).float()
        pred_comp = pred['composited'].squeeze(0).float()

        np.save(str(pred_fn).replace('.pt', '_input.npy'), rgb_in.numpy())
        np.save(str(pred_fn).replace('.pt', '_targ.npy'), targ_full.numpy())
        np.save(str(pred_fn).replace('.pt', '_pred.npy'), pred_full.numpy())
        np.save(str(pred_fn).replace('.pt', '_pcomp.npy'), pred_comp.numpy())
        
        # print(rgb_in.shape, targ_full.shape, pred_full.shape, pred_comp.shape)
        # fn_pred_comp  = str(pred_fn).replace('.pt', 'pred_comp.png')
        # fn_pred_front = str(pred_fn).replace('.pt', 'pred_front.png')
        # fn_pred_back  = str(pred_fn).replace('.pt', 'pred_back.png')
        # fn_pred_depth = str(pred_fn).replace('.pt', 'pred_depth.png')

        # fn_targ_comp  = str(pred_fn).replace('.pt', 'targ_comp.png')
        # fn_targ_front = str(pred_fn).replace('.pt', 'targ_front.png')
        # fn_targ_back  = str(pred_fn).replace('.pt', 'targ_back.png')
        # fn_targ_depth = str(pred_fn).replace('.pt', 'targ_depth.png')

        # save_image(torch.cat([rgb_in, targ_full[[9]]], dim=0), fn_targ_comp)
        # save_image(targ_full[ :4], fn_targ_front)
        # save_image(targ_full[4:8], fn_targ_back)
        # save_image(targ_full[[8]], fn_targ_depth)

        # save_image(pred_comp, fn_pred_comp)
        # save_image(pred_full[ :4], fn_pred_front)
        # save_image(pred_full[4:8], fn_pred_back)
        # save_image(pred_full[[8]], fn_pred_depth)

        
