
// json saving
#macro save_data "ghin_sav.dat"
#macro json_version 0.32
#macro app_save json_save_array(save_data,ROOT_data_struct)
#macro app_load json_load_array(save_data)

#macro COURSE_database ROOT_data_struct.courselistDatabase
#macro SEASON_data ROOT_data_struct.seasonList

#macro PROFILE_data ROOT_data_struct.profiles[profile_index]
#macro META_data ROOT_data_struct.meta
#macro COURSE_data ROOT_data_struct.profiles[profile_index].courselist
#macro SCORE_data ROOT_data_struct.profiles[profile_index].scorelist
#macro ACTIVE_data ROOT_data_struct.profiles[profile_index].activeRound

#macro create_score scr_score_create("","","","","","","","",date_current_datetime(),"0",false)

#macro scoresort scr_score_sort(scorelist_array,false) // array_sort_nested_struct(scorelist_array,"roundDate",false)
#macro coursesort scr_course_sort_abc(courselist_array,true)

// header
#macro header_color make_color_rgb(0,145,206)
#macro header_height 90
#macro header_submenu_height 60
#macro header_font_height 50

// background colors
#macro c_lt_gray make_color_rgb(228,228,228)
#macro c_click_color make_color_rgb(245,245,245)

// layout
#macro res_bleed_xx 20
#macro res_bleed_yy 10
#macro DPI_POINT 72

// textbox scrolling
#macro fric 0.009
#macro flick_max 0.5
#macro flick_window 5
#macro refresh_dist 6

// cursor
#macro cursor_blink 500
#macro cursor_color c_aqua
#macro cursor_width 3

// sidebar
#macro side_menu_width 460
#macro SIDEBAR_LERP 0.16

// clicking
#macro press_hold_timer 30
#macro click_highlight_lerp 0.35

// navbar
#macro nav_sca_off 0.85
#macro nav_height 100
#macro nav_ico_num 5
#macro navbar_color make_color_rgb(0,122,173)

// calendar
#macro start_date date_create_datetime(1970,1,1,0,0,0)

// misc
#macro dialogue draw_dialogue_box(xx,yy,ww,hh,col,sub)

// debug
#macro db show_debug_message
#macro sm show_message
#macro sma show_message_async
#macro cs clipboard_set_text
#macro cg clipboard_get_text
#macro js json_stringify
#macro ssm struct_debug_show