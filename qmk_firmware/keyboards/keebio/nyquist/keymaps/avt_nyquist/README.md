qmk compile keymap:

```bash
homebrew qmk/qmk/qmk
qmk setup
qmk new-keymap -kb keebio/nyquist/rev3 
# name it nyquist_avt
qmk json2c 20210713_keebio_nyquist_rev3_layout_ortho_4x12_hold_tap_home_row.json -o ~/qmk_firmware/keyboards/keebio/nyquist/keymaps/nyquist_avt/keymap.c
qmk compile -kb keebio/nyquist/rev3 -km nyquist_avt
```
