echo "🔢 Arguments(right or left): $1"

if [ "$1" != "right" ] && [ "$1" != "left" ]; then
    echo "エラー: 引数は 'right' または 'left' でなければなりません。"
    echo "使用法: $0 [right|left]"
    exit 1
fi

echo "🔧 Change Directory to /build/qmk_firmware"

cd /build/qmk_firmware

echo "🔧 Git Submodule Update"

git submodule update --init --recursive

echo "🔧 Copy my_keymap"

\cp -f -r /build/my_keymap /build/qmk_firmware/keyboards/fingerpunch/ximi/v1/keymaps/

echo "🔧 ls /keymaps"

ls /build/qmk_firmware/keyboards/fingerpunch/ximi/v1/keymaps/

echo "🏗 Build $1"

case "$1" in
    "right")
        make fingerpunch/ximi/v1:my_keymap RGB_MATRIX_ENABLE=yes FP_CIRQUE_LEFT_TRACKBALL_RIGHT=yes ENCODER_ENABLE=yes FP_SPLIT_RIGHT=yes
        ;;
    "left")
        make fingerpunch/ximi/v1:my_keymap RGB_MATRIX_ENABLE=yes FP_CIRQUE_LEFT_TRACKBALL_RIGHT=yes ENCODER_ENABLE=yes FP_SPLIT_LEFT=yes
        ;;
esac

echo "🎉 Build Done!"

case "$1" in
    "right")
        \mv -f /build/qmk_firmware/*.uf2 /build/uf2/right.uf2
        ;;
    "left")
        \mv -f /build/qmk_firmware/*.uf2 /build/uf2/left.uf2
        ;;
esac
