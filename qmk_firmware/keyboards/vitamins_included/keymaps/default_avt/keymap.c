#include QMK_KEYBOARD_H
#include "sendstring_us_international.h"

#define TG_NKRO MAGIC_TOGGLE_NKRO

// Layer names

enum layer_names {
    _QWERTY,
    _LOWER,
    _RAISE,
    _ADJUST
};

enum custom_keycodes {
  QWERTY = SAFE_RANGE,
  LOWER,
  RAISE,
  ADJUST,
  MAIL_LEXMAIL,
  MAIL_STRUCTURA,
  MAIL_A,
  MAIL_B,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/* Qwerty
 * ,-----------------------------------------------------------------------------------.
 * | Esc  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Tab  |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   ;  |  '   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  |Enter |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Ctrl | GUI  |  Alt |Adjust|Lower |Space |Space |Raise | Left | Down |  Up  |Right |
 * `-----------------------------------------------------------------------------------'
 */
[_QWERTY] = LAYOUT_ortho_4x12( \
  KC_MEDIA_NEXT_TRACK, 	KC_Q, 		KC_W, 		KC_E, 		KC_R, 		KC_T,            KC_Y, 	KC_U, 		KC_I, 		KC_O, 		KC_P, KC_BSPC, \
  KC_MPLY, 		LALT_T(KC_A), 	LCTL_T(KC_S),	LSFT_T(KC_D), 	LGUI_T(KC_F), 	KC_G,		KC_H, 	LGUI_T(KC_J), 	RSFT_T(KC_K), 	LCTL_T(KC_L), 	LALT_T(KC_SCLN), KC_QUOT, \
  _______, 		KC_Z, 		KC_X, 		KC_C, 		KC_V, 		KC_B, 		KC_N, 	KC_M, 		KC_COMM, 	KC_DOT, 		KC_SLSH, 	_______, \
  MO(2), 		_______, 	_______, 	_______, 	MO(1), 		KC_SPC, 	      	KC_ENT,	MO(1), 		_______, 	_______, 	_______, MO(2) \
),

/* Lower
 * ,-----------------------------------------------------------------------------------.
 * |   ~  |   !  |   @  |   #  |   $  |   %  |   ^  |   &  |   *  |   (  |   )  | Del  |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Del  |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |   _  |   +  |      |   \  |  |   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |RESET |  F7  |  F8  |  F9  |  F10 |  F11 |  F12 |ISO ~ |ISO | |      |      |Enter |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |TGNKRO|      |      |      |      |             |      | Next | Vol- | Vol+ | Play |
 * `-----------------------------------------------------------------------------------'
 */
[_LOWER] = LAYOUT_ortho_4x12( \
  _______, 	KC_F1, 		KC_F2, 	KC_F3, 	 KC_F4, 		KC_F5,		KC_F8, 	KC_F9, 	KC_F10, 	KC_F11, 	KC_F12, 	_______, \
  KC_HOME, 	KC_PSCR, 	_______, _______, KC_F6, 		KC_F7,           _______,	KC_LEFT,	KC_DOWN,	KC_UP, 	KC_RGHT,	KC_PGUP, \
  KC_END, 	KC_1, 		KC_2, 	KC_3, 	 KC_4, 		KC_5, 		KC_6, 	KC_7, 	KC_8, 	KC_9, 	KC_0, 	KC_PGDN, \
  _______, 	MAIL_LEXMAIL, 	_______, _______, KC_TRNS,	_______, 	_______,	KC_TRNS,	_______,	_______,	MAIL_A, 	_______  \
),

/* Raise
 * ,-----------------------------------------------------------------------------------.
 * |   `  |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  | Del  |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Del  |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |   -  |   =  |   [  |   ]  |  \   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      |  F7  |  F8  |  F9  |  F10 |  F11 |  F12 |ISO # |ISO / |      |TGNKRO|RESET |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      | Next | Vol- | Vol+ | Play |
 * `-----------------------------------------------------------------------------------'
 */
[_RAISE] = LAYOUT_ortho_4x12( \
  _______, 	KC_TILD, 	KC_GRV, 	KC_NO, 	RESET, 	KC_NO,		KC_UNDS,	KC_MINS,	KC_EXLM,	KC_EQL, 	KC_PLUS,	KC_DEL, \
  KC_NO, 	KC_BSLS, 	KC_PIPE,	KC_NO, 	KC_NO, 	KC_NO, 		KC_LBRC,	KC_LCBR,	KC_LPRN,	KC_RPRN,	KC_RCBR,	KC_RBRC, \
  KC_NO, 	KC_NO, 		KC_AT, 	KC_HASH,	KC_DLR, 	KC_PERC, 	KC_CIRC,	KC_AMPR,	KC_ASTR,	KC_NO, 	KC_NO, 	KC_NO, \
  KC_TRNS, 	MAIL_STRUCTURA, 	KC_NO, 	KC_NO, 	KC_NO, 	KC_TAB, 		KC_ESC, 	KC_NO, 	KC_NO, 	KC_NO, 	MAIL_B, 	KC_TRNS \
),


};


bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case MAIL_LEXMAIL:
        if (record->event.pressed) {
            SEND_STRING("lexmail@gmail.com");
        } 	
	return false;
	break;
    case MAIL_STRUCTURA:
        if (record->event.pressed) {
            SEND_STRING("alexander@structura.ws");
        } 	
 	return false;
	break;
    case MAIL_A:
        if (record->event.pressed) {
            SEND_STRING("alexander.vantrijffel@prosim-ar.com");
        } 	
 	return false;
	break;
    case MAIL_B:
        if (record->event.pressed) {
            SEND_STRING("avantrijffel@schubergphilis.com");
        } 	
 	return false;
	break;
    case QWERTY:
      if (record->event.pressed) {
        set_single_persistent_default_layer(_QWERTY);
      }
      return false;
      break;
    case LOWER:
      if (record->event.pressed) {
        layer_on(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case RAISE:
      if (record->event.pressed) {
        layer_on(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case ADJUST:
      if (record->event.pressed) {
        layer_on(_ADJUST);
      } else {
        layer_off(_ADJUST);
      }
      return false;
      break;
  }
  return true;
}



