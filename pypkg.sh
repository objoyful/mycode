#Export varibles
#echo "export OPENBLAS_CORETYPE=ARMV8" >> ~/.bashrc
#source ~/.bashrc

#Check Ubuntu version
version=$(lsb_release -r --short)

# Check if user has Ubuntu version less than 20.04
if [ $(echo "${version} < 20.04" | bc) -eq 1 ]
    then    
        #User has Ubuntu version less than 20.04
        
        #Install Linux packages
        sudo apt install -y python3.8 python3-dev python3-wxgtk4.0 python3-yaml vim git screen libffi-dev build-essential autoconf libtool pkg-config python3-opengl python-pil pyqt5-dev-tools libqscintilla2-qt5-designer python3-qtpy libgle3 libssl-dev python3.8-dev gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libfreetype6-dev python3-setuptools python3-dev python3 libportmidi-dev python3-opencv
        sudo apt-get build-dep libsdl2 libsdl2-image libsdl2-mixer libsdl2-ttf libfreetype6 python3 libportmidi0
        
        #Install pip
        python3.8 ./Packages/get-pip.py -U --user

        #Python 3.8
        python3.8 -m pip install -r ./Packages/requirements.txt -U --user
        python3.8 -m pip install -r ./Packages/pip.txt -U --user
else
    #User has Ubuntu version at or above than 20.04
    
    #Install Linux packages
    sudo apt install -y python-is-python3 python3.9 python3-dev python3-wxgtk4.0 python3-yaml vim git screen libffi-dev build-essential autoconf libtool pkg-config python3-opengl python-pil pyqt5-dev-tools libqscintilla2-qt5-designer python3-qtpy libgle3 libssl-dev python3.9-dev gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libfreetype6-dev python3-setuptools python3-dev python3 libportmidi-dev python3-opencv
    sudo apt-get build-dep libsdl2 libsdl2-image libsdl2-mixer libsdl2-ttf libfreetype6 python3 libportmidi0
    
    #Install pip
    python3.9 ./Packages/get-pip.py -U --user

    #Python 3.9
    python3.9 -m pip install -r ./Packages/requirements.txt -U --user
    python3.9 -m pip install -r ./Packages/pip.txt -U --user
fi

#Give user permissions
sudo usermod -a -G dialout $USER
sudo usermod -aG i2c $USER
sudo groupadd -f -r gpio
sudo usermod -a -G gpio $USER