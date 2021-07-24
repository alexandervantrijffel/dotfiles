#include QMK_KEYBOARD_H
#include "sendstring_us_international.h"

enum custom_keycodes {
    MAIL_LEXMAIL = SAFE_RANGE,
    MAIL_STRUCTURA,
    MAIL_PROSIM,
    MAIL_GRANDVISION
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
    case MAIL_LEXMAIL:
        if (record->event.pressed) {
            SEND_STRING("lexmail@gmail.com");
        } 	
 	return false;
    case MAIL_STRUCTURA:
        if (record->event.pressed) {
            SEND_STRING("alexander@structura.ws");
        } 	
 	return false;
    case MAIL_PROSIM:
        if (record->event.pressed) {
            SEND_STRING("alexander.vantrijffel@prosim-ar.com");
        } 	
 	return false;
    case MAIL_GRANDVISION:
        if (record->event.pressed) {
            SEND_STRING("alexander.vantrijffel@grandvision.com");
        } 	
 	return false;
    }
    // let someone else handle this 
    return true;
};

enum {
   TD_E_EE,
};

// Tap Dance definitions
qk_tap_dance_action_t tap_dance_actions[] = {
    // Tap once for E, twice for '
    [TD_E_EE] = ACTION_TAP_DANCE_DOUBLE(KC_E, KC_QUOT),
};
// usage:
// TD(TD_E_EE)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[0] = LAYOUT_ortho_4x12(KC_NO, KC_Q, KC_W, KC_E, KC_R, KC_T,                                  	KC_Y, KC_U, KC_I, KC_O, KC_P, KC_BSPC, \
            			KC_NO, LALT_T(KC_A), LCTL_T(KC_S), LSFT_T(KC_D), LGUI_T(KC_F), KC_G,	KC_H, LGUI_T(KC_J), RSFT_T(KC_K), LCTL_T(KC_L), LALT_T(KC_SCLN), KC_QUOT, \
 				KC_NO, KC_Z, KC_X, KC_C, KC_V, KC_B, 			              	KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_NO, \
				MO(2), KC_NO, KC_NO, KC_NO, MO(1), KC_SPC, 	      	              	KC_ENT, MO(1), KC_NO, KC_NO, KC_NO, MO(2)),

// JMP keys
	[1] = LAYOUT_ortho_4x12(KC_NO, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5,                             	KC_F8, KC_F9, KC_F10, KC_F11, KC_F12, KC_NO, \
				KC_HOME, KC_PSCR, KC_NO, KC_NO, KC_F6, KC_F7,                         	KC_NO, KC_LEFT, KC_DOWN, KC_UP, KC_RGHT, KC_PGUP, \
				KC_END, KC_1, KC_2, KC_3, KC_4, KC_5, 				      	KC_6, KC_7, KC_8, KC_9, KC_0, KC_PGDN, \
				KC_NO, MAIL_LEXMAIL, KC_NO, KC_NO, KC_TRNS, KC_NO, 		      	KC_NO, KC_TRNS, KC_NO, KC_NO, MAIL_PROSIM, KC_NO),

// POP keys
	[2] = LAYOUT_ortho_4x12(KC_NO, KC_TILD, KC_GRV, KC_NO, KC_NO, KC_NO, 			      	KC_UNDS, KC_MINS, KC_EXLM, KC_EQL, KC_PLUS, KC_DEL, \
				KC_NO, KC_BSLS, KC_PIPE, KC_NO, KC_NO, KC_NO, 			      	KC_LBRC, KC_LCBR, KC_LPRN, KC_RPRN, KC_RCBR, KC_RBRC, \
				KC_NO, KC_NO, KC_AT, KC_HASH, KC_DLR, KC_PERC, 			     	KC_CIRC, KC_AMPR, KC_ASTR, KC_NO, KC_NO, KC_NO, \
				KC_TRNS, MAIL_STRUCTURA, KC_NO, KC_NO, KC_NO, KC_TAB, 		      	KC_ESC, KC_NO, KC_NO, KC_NO, MAIL_GRANDVISION, KC_TRNS)
};

// KC_LSFT, KC_RSFT
// KC_LCTL, KC_LALT, KC_LGUI, KC_RALT
