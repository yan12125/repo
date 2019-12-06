echo 'Server = https://mirror.pkgbuild.com/$repo/os/$arch' > /etc/pacman.d/mirrorlist
curl -L https://github.com/yuyichao/devtools-cn/raw/master/pacman-multilib-archlinuxcn.conf | sed 's#SigLevel.*#SigLevel = Never#' > /etc/pacman.conf
pacman -Sy
pacman -S --noconfirm --needed --nodeps --nodeps devtools devtools-cn-git
pacman -S --noconfirm --needed git python-yaml python-jsonschema pyalpm

cd /repo
env
python3 --version
export PYTHONPATH=$PYTHONPATH:$(pwd)
./pre-commit --all # checking all PKGBUILD
