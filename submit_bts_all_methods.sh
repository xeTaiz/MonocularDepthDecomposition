ls -l
pwd
submit "./train_stdepth_bts.sh first_hit" --pytorch --requirements mono-depth-estimation/requirements.txt --name bts-firsthit --apt-install libsm6 libxext6 libxrender-dev libglib2.0-0 libgl1-mesa-glx git python3-opencv --exclude worker2
submit "./train_stdepth_bts.sh max_opacity" --pytorch --requirements mono-depth-estimation/requirements.txt --name bts-maxopacity --apt-install libsm6 libxext6 libxrender-dev libglib2.0-0 libgl1-mesa-glx git python3-opencv --exclude worker2
submit "./train_stdepth_bts.sh max_gradient" --pytorch --requirements mono-depth-estimation/requirements.txt --name bts-maxgradient --apt-install libsm6 libxext6 libxrender-dev libglib2.0-0 libgl1-mesa-glx git python3-opencv --exclude worker2
submit "./train_stdepth_bts.sh wysiwyg" --pytorch --requirements mono-depth-estimation/requirements.txt --name bts-wysiwyg --apt-install libsm6 libxext6 libxrender-dev libglib2.0-0 libgl1-mesa-glx git python3-opencv --exclude worker2
